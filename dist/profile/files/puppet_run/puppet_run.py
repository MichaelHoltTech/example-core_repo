#!/usr/bin/python
# Puppet Wrapper to make sure it runs as expected 

import subprocess
import logging
import os
import random
import time

logging.basicConfig(filename='/var/log/puppet_run.log',level=logging.INFO)
logger = logging.getLogger('puppet_run')

puppet_cmd = ['/usr/bin/puppet', 'agent', '--detailed-exitcodes', '--onetime', '--no-daemonize', '--verbose']
run_lock_file = '/var/lib/puppet/state/agent_catalog_run.lock'
disabled_lock_file = '/var/lib/puppet/state/agent_disabled.lock'
max_delay = 1200


def random_delay():
    randomized_delay = random.randrange(0, max_delay)
    logger.info("Delaying run by %s seconds" % randomized_delay)
    time.sleep(randomized_delay)


def preflight():
    ## ToDo
    # * Make sure puppet.conf exists, if not, place it
    # * look for vardir, create if it does not exist
    # * look for /etc/puppet, create if it does not exist
    logger.info("Running Puppet Preflight Actions...")

    if os.path.exists(run_lock_file):
        logger.info("Agent Run Lock file is present, cleaning up previous run...") 
        old_pid = read_pidfile(run_lock_file)
        os.remove(run_lock_file)
        if check_for_process(old_pid):
            os.kill(int(old_pid), 9)
    
    if os.path.exists(disabled_lock_file):
        logger.info("Agent Disabled Lock file is present, cleaning up previous run...") 
        old_pid = read_pidfile(disabled_lock_file)
        os.remove(disabled_lock_file)
        if check_for_process(old_pid):
            os.kill(int(old_pid), 9)


def read_pidfile(pidfile):
    if os.path.exists(pidfile):
        with file(pidfile) as f:
            pid = f.read()
            f.close()
        result = pid.rstrip('\n')
    else:
        result = False

    return result


def check_for_process(pid):
    cmd = ['/bin/ps', '-p', pid, '-o', 'pid='] 
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (output, error_output) = proc.communicate()
    # debugging
    # print("check_for_process output = %s" % output)
    return output.rstrip('\n')


def run_puppet():
    ## ToDo
    # * Run puppet and capture output.
    # * Check for cert errors:
    #   'Retrieved certificate does not match private key')
    #   'Certificate request does not match existing certificate')
    # * If cert errors exist, clean up ssl dir and email about it?

    returncode = 1

    logger.info("Running Puppet...")
    returncode = subprocess.call(puppet_cmd)

    if returncode != 0:
        returncode = subprocess.call(puppet_cmd)


def main():
    random_delay()
    preflight()
    run_puppet()


if __name__ == "__main__":
    main()
