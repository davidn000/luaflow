<p align="center">
  <a href="./">
    <iframe src='https://svgshare.com/f/iGL' width=100% height=100% ></iframe>
  </a>

  <h3 align="center">Luaflow</h3>

  <p align="center">
    A MVC (Model-View-Controller) lua framework for apache2 web servers.
    <br>
    <a href="https://github.com/davidn000/luaflow/issues/new?template=bug.md">Report bug</a>
    ·
    <a href="https://github.com/davidn000/luaflow/issues/new?template=feature.md&labels=feature">Request feature</a>
  </p>
</p>


## Table of contents

- [About](#about)
- [Status](#status)
- [Todo](#Todo)
- [Bugs and feature requests](#bugs-and-feature-requests)
- [Contributing](#contributing)
- [Creators](#creators)
- [Copyright and license](#copyright-and-license)


## About

I didin't like any of the existing frameworks so this project is my attempt at brining lua into web programming.  
Currently I'm using apache2's built in module 'mod_lua'. This module allows the server to parse lua files. You can enable this module by adding ``LoadModule lua_module modules/mod_lua.so`` to your ``httpd.conf`` file for apache2. 


- XAMPP httpd.conf: xampp/apache/conf/httpd.conf
- Ubuntu: idk
- anything else: idk

### For performance add this to the file as well

```text 
AddHandler lua-script .lua
LuaScope thread
LuaCodeCache stat
```

## Status

Currnetly a bare bones functionality is implmented.


## Todo

Here is what's on my todo list:

```text

```

## Bugs and feature requests

n/a

## Contributing

Contributing is open.

## Creators

**Creator 1**

- <https://github.com/davidn000>


## Copyright and license

Code and documentation copyright 2011-2018 the authors. Code released under the [MIT License](https://https://github.com/davidn000/luaflow/blob/master/LICENSE).

Enjoy :smiley:
