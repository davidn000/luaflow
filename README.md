<p align="center">
  <a>
     <img src="https://i.postimg.cc/2yrNDjyz/logo.png" alt="Logo" width=315 height=150>
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
- [Get Started](#get-started)
- [Todo](#Todo)
- [Bugs and feature requests](#bugs-and-feature-requests)
- [Contributing](#contributing)
- [Creators](#creators)
- [Copyright and license](#copyright-and-license)


## About

Luaflow is a web framework for Lua that revolves around an object orientated building process designed for agile web development. Currently I'm using apache2's built in module 'mod_lua' but there are plans to bring Luaflow to nginx and other webservers. mod_lua allows the server to parse lua files. You can enable this module by adding ``LoadModule lua_module modules/mod_lua.so`` to your ``httpd.conf`` file for apache2. 


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


## Get Started

To get started locate your ``httpd.conf`` file for apache, and add ``LoadModule lua_module modules/mod_lua.so``. I added this text where the other LoadModule's were located. Clone the entire repo and go into ``luaflow/config.lua`` and change the 'src_directory' value to where the absolute path to the  webpages' directory (where .htaccess is), also go into ``luaflow/router.lua`` and change ``package.path = package.path .. ';C:/xampp/htdocs/luaflow/?.lua'`` to ``package.path = package.path .. ';absolute/path/that/is/in/config/?.lua'``. **A full documentation guide is coming soon**. 

### Documentation

Documentation revolving Luaflow.

#### Basic

All Luaflow apps consist of two parts: views, and templates. A view is a page within your app, and the initial index page of your app will be ``App.lua``. 

Each view is a subclass of Luaflow's core class (luaflow/core.lua) and consists of 3 main variables: 'core.variables', 'core.head', 'core.style'. All the variables that are apart of your view will be held in the variables table, the views' html head contents are set by the head table (title, stylesheets, or etc/other), and all extra styles will be held as a string within the style variable.

The core class will build and render the string returned by the view's 'render' method. The render method will replace all varibles nested within double curly brackets ( ex. {{variable_name}} ) with the variables value.

A template is much like a view, except it can be rendered within views many seperate times.



## Todo

Here is what's on my todo list:

```text

- Websocket state managment
- Database class
- Custom routing

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
