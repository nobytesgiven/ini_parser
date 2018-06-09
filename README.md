# Lua .INI Parser
[![Github file size](https://img.shields.io/badge/size-2.72%20kB-green.svg)](https://github.com/FivosM/ini_parser) &nbsp; [![license](https://img.shields.io/badge/license-CC0-green.svg)](https://github.com/FivosM/ini_parser/blob/master/LICENSE.md)
###### [INI file format specification](https://en.wikipedia.org/wiki/INI_file)
###### Please note that the library only works with [LÖVE](https://love2d.org/)

## • API
`ini = require "ini"` Requires the library.

### Necessary API for using .ini files

`ini.load( filePath )` Loads a .ini file and returns it as a table.

`ini.save( Table, targetFile )` Saves a table using the .ini file format.

#### Extra API
The below functions are not necessary and can be easily replaced with simple table-editing. They should only be used to make the game logic more readable.

`ini.readKey( iniTable, sectionName, keyName )` Returns a key value.

`ini.addSection( iniTable, newSectionName )` Adds a new section.

`ini.addKey( iniTable, sectionName, keyName, keyValue )` Adds a value to a key.

`ini.sectionExists( iniTable, sectionName )` Checks if section exists.

`ini.keyExists( iniTable, keyName )` Checks if key exists.

`ini.deleteSection( iniTable, sectionName )` Removes a section.

`ini.deleteKey( iniTable, sectionName, keyName )` Removes a key.

## • Example of API usage
##### Load ini file to table and print one of its keys:
```lua
ini = require "ini" 
ini_file = ini.load("file.ini") 
if ini_file then 
	print(ini.readKey( ini_file, "owner", "name" )) 
end
```
##### Save table as an ini file:
```lua
ini = require "ini" 
ini_table = {
	scores = {
		player1 = 3982,
		player2 = 1312,
		player3 = 13,
		player4 = 1543,
	},
	playerNames = {
		player1 = "Pete",
		player2 = "Billy",
		player3 = "Sam",
		player4 = "Eric"
	}
}

if ini.save(ini_table, "inifile.ini") then
	print("success!")
end

```
[![This library is licensed under CC0](https://licensebuttons.net/p/zero/1.0/88x31.png "This code is licensed under CC0")](https://github.com/FivosM/ini_parser/blob/master/LICENSE.md)
