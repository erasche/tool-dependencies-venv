Shell script to make producing tool_dependencies easier. It's simple to use, behaves a lot like a venv, and then produces a `tool_dependencies.xml` in the directory where you started when you `deactivate` at the end. 

Pretty to activate:

```
. activate.sh
```

Example of use:

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
