#!/bin/bash
#
# Create my standard konsole windows.

if [[ ! "$profile" ]]; then
    profile=Shell
fi

sessions=(
    sh1   $profile   'clear; bash'
    sh1   $profile   'clear; bash'
    su1   $profile   'clear; su'
    ssh1  $profile   'clear; ssh 127.0.0.1'
    )

nsessions=0

#####################################################################
# Start sessions in konsole.
function start_sessions()
{
    local session_count=${#sessions[*]}
    local i=0

    while [[ $i -lt $session_count ]]
    do
        local name=${sessions[$i]}
        let i++
        local profile=${sessions[$i]}
        let i++
        local command=${sessions[$i]}
        let i++

        echo "Creating $name: $command"
        # Starting with a specific profile appears to be broken.
        #local session_num=$(qdbus org.kde.konsole /Konsole newSession $profile $HOME)
        local session_num=$(qdbus org.kde.konsole /Konsole newSession)
        sleep 0.1
        qdbus org.kde.konsole /Sessions/$session_num setTitle 0 $name
        sleep 0.1
        qdbus org.kde.konsole /Sessions/$session_num setTitle 1 $name
        sleep 0.1
        qdbus org.kde.konsole /Sessions/$session_num sendText "$command"
        sleep 0.1
        qdbus org.kde.konsole /Sessions/$session_num sendText $'\n'
        sleep 0.1

        let nsessions++
    done
}

read -p "Create konsoles? " ans
if [[ "${ans:0:1}" == 'y' ]]; then
    start_sessions

    # Activate first session.
    while [[ $nsessions -gt 1 ]]
    do
        qdbus org.kde.konsole /Konsole prevSession
        let nsessions--
    done
fi


# vim: tabstop=4: shiftwidth=4: noexpandtab:
# kate: tab-width 4; indent-width 4; replace-tabs false;
