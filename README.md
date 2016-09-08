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