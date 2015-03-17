# Galaxy Tool_Dependencies Virtualenv

While behaving like a virtualenv (go inside, build software), this virtualenv tracks what was done and builds a `tool_dependenceis.xml` file out of the terminal history.

## Examples:

Here's an example console session:

```console
esr@cpt:~/⟫ . activate.sh
(remember-me) esr@cpt:~/⟫ wget http://hgdownload.soe.ucsc.edu/admin/jksrc.v312.zip
(remember-me) esr@cpt:~/⟫ unzip jksrc.v312.zip
(remember-me) esr@cpt:~/⟫ cd kent/src/lib/
(remember-me) esr@cpt:~/kent/src/utils⟫ make
...
(remember-me) esr@cpt:~/kent/src/utils⟫ mv x86_64/jkweb.a $INSTALL_DIR/lib/
# TODO, right now we just let this fail
(remember-me)130 esr@cpt:~/kent/src/utils⟫ cd ../utils/
(remember-me)130 esr@cpt:~/kent/src/utils⟫ make

(remember-me)130 esr@cpt:~/kent/src/utils⟫ deactivate 
Package Name: kent
Package Version: 312
Commands executed stored to tool_dependencies.xml
130 esr@cpt:~/⟫ 
```

The `Package Name: ...` section is interactive, allowing you to specify the package name and version, before storing the data to a file.

Finally, the following file is generated:

```xml
<?xml version="1.0"?>
<tool_dependency>
    <package name="kent" version="312">
        <install version="1.0">
            <actions>
                <action type="download_by_url">http://hgdownload.soe.ucsc.edu/admin/jksrc.v312.zip</action>
                <action type="change_directory">kent/src/lib/</action>
                <action type="shell_command">make</action>
                <action type="move_file"><source>x86_64/jkweb.a</source><destination>$INSTALL_DIR/lib/</destination></action>
                <action type="change_directory">../utils/</action>
                <action type="shell_command">make</action>
            </actions>
        </install>
        <readme>
        </readme>
    </package>
</tool_dependency>
```
