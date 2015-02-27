Shell script to make producing tool_dependencies easier

Simple to activate:

```
. activate.sh
```

Example of use:

```console
esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc⟫ . activate.sh
(remember-me) esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc⟫ wget http://hgdownload.soe.ucsc.edu/admin/jksrc.v312.zip
(remember-me) esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc⟫ unzip jksrc.v312.zip
(remember-me) esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc⟫ cd kent/src/lib/
(remember-me) esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc/kent/src/utils⟫ make
...
(remember-me) esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc/kent/src/utils⟫ mv x86_64/jkweb.a $INSTALL_DIR/lib/
# TODO, right now we just let this fail
(remember-me)130 esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc/kent/src/utils⟫ cd ../utils/
(remember-me)130 esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc/kent/src/utils⟫ make

(remember-me)130 esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc/kent/src/utils⟫ deactivate 
Package Name: kent
Package Version: 312
Commands executed stored to tool_dependencies.xml
130 esr@cpt:~/Projects/galaxy/tools-iuc/tools/ucsc⟫ 
```
