#!/bin/sh
# OLD:
#eval $(ssh-agent -s)
#
# NEW, based on https://stackoverflow.com/questions/40549332/how-to-check-if-ssh-agent-is-already-running-in-bash

# Ensure agent is running
ssh-add -l &>/dev/null
if [ "$?" == 2 ]; then
    # Could not open a connection to your authentication agent.

    # Load stored agent connection info.
    test -r /tmp/ssh-agent && \
        eval "$(</tmp/ssh-agent)" >/dev/null

    ssh-add -l &>/dev/null
    if [ "$?" == 2 ]; then
        # Start agent and store agent connection info.
        (umask 066; ssh-agent > /tmp/ssh-agent)
        eval "$(</tmp/ssh-agent)" >/dev/null
    fi
fi

# Load identities
#ssh-add -l &>/dev/null
#if [ "$?" == 1 ]; then
    # The agent has no identities.
    # Time to add one.
#    ssh-add -t 4h
#fi
