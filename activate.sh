# 90% from virtualenv's activate.sh
# This file must be used with "source bin/activate" *from bash*
# you cannot run it directly
export TMPFILE=$(mktemp)
export _ORIG_DIR=$(pwd)

deactivate () {
    # This should detect bash and zsh, which have a hash command that must
    # be called to get it to forget past commands.  Without forgetting
    # past commands the $PATH changes we made may not be respected
    if [ -n "$BASH" -o -n "$ZSH_VERSION" ] ; then
        hash -r 2>/dev/null
    fi

    if [ -n "$_OLD_VIRTUAL_PS1" ] ; then
        PS1="$_OLD_VIRTUAL_PS1"
        export PS1
        unset _OLD_VIRTUAL_PS1
    fi

    if [ ! "$1" = "nondestructive" ] ; then
    # Self destruct!
        STARTED_AT=$(cat $TMPFILE.orig);
        rm $TMPFILE.orig;
        cd "$_ORIG_DIR";
        # Process the history for just the commands we're interested in
        history | awk "(\$1>$STARTED_AT){print \$0}" | sed 's|^[0-9]\+\s\+||g' > $TMPFILE
        # Request package information
        echo -n "Package Name: "
        read package_name
        echo -n "Package Version: "
        read package_version

        cat $TMPFILE | awk -v pkg_vers="$package_version" -v pkg_name="$package_name" '
BEGIN {
    print "<?xml version=\"1.0\"?>"
    print "<tool_dependency>"
    print "    <package name=\""pkg_name"\" version=\""pkg_vers"\">"
    print "        <install version=\"1.0\">"
    print "            <actions>"
}

{
    if($1 == "wget"){
        print "                <action type=\"download_by_url\">"$2"</action>"
    } else if ($1 == "cd"){
        print "                <action type=\"change_directory\">"$2"</action>"
    } else if ($1 == "tar"){
        # Ignore tar/unzip of initial directory. TODO: conditionally for the SECOND action, and only if wget/curl.
    } else if ($1 == "unzip"){
    }else{
        print "                <action type=\"shell_command\">"$0"</action>"
    }
}

END {
    print "            </actions>"
    print "        </install>"
    print "        <readme>"
    print "        </readme>"
    print "    </package>"
    print "</tool_dependency>"
}
        ' > tool_dependencies.xml


        echo "Commands executed stored to tool_dependencies.xml"
        unset -f deactivate
    fi
}

# Store the last line of history
history 1 | sed 's/ .*//g' > $TMPFILE.orig

# unset irrelevant variables
deactivate nondestructive

# unset PYTHONHOME if set
# this will fail if PYTHONHOME is set to the empty string (which is bad anyway)
# could use `if (set -u; : $PYTHONHOME) ;` in bash
if [ -n "$PYTHONHOME" ] ; then
    _OLD_VIRTUAL_PYTHONHOME="$PYTHONHOME"
    unset PYTHONHOME
fi

if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
    _OLD_VIRTUAL_PS1="$PS1"
    if [ "x" != x ] ; then
        PS1="$PS1"
    else
        PS1="(remember-me)$PS1"
    fi
    export PS1
fi

# This should detect bash and zsh, which have a hash command that must
# be called to get it to forget past commands.  Without forgetting
# past commands the $PATH changes we made may not be respected
if [ -n "$BASH" -o -n "$ZSH_VERSION" ] ; then
    hash -r 2>/dev/null
fi