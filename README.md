# cURL
To use [cURL](https://github.com/curl/curl.git) in [ZPM](http://zpm.zefiros.eu), just use:

# [ZPM](http://zpm.zefiros.eu) Installation
In `.package.json`
```json
"requires": [
		{
			"name": "Zefiros-Software/cURL",
			"version": "^7.50.0"
		}
]
```

In `premake5.lua`
```lua
zpm.uses "Zefiros-Software/cURL"
```

# Status
Type        | Status
----------- | -------
Linux & OSX | [![Build Status](https://travis-ci.org/Zefiros-Software/SFML.svg?branch=master)](https://travis-ci.org/Zefiros-Software/SFML)
Windows     | [![Build status](https://ci.appveyor.com/api/projects/status/b4syumypyox1y09w?svg=true)](https://ci.appveyor.com/project/Zefiros-Software/sfml)