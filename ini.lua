--[[
    AUTHOR: Fivos Moutavelis (https://github.com/FivosM)
    LICENSE: CC0 1.0 Universal (https://creativecommons.org/publicdomain/zero/1.0/legalcode)
    Attribution is not required but always appreciated.
]]--

local ini = {}

function ini.load( filePath )
    fileInfo = love.filesystem.getInfo( filePath )
    if fileInfo and fileInfo.type == "file" then
        local iniTable = {}
        local currentSection = "default"
        for line in love.filesystem.lines( filePath ) do
            local section = string.match( line, "%[%s*(.*)%s*%]" ) -- Returns section (if current line defines a new section)
            if section ~= nil then
                currentSection = section
                iniTable[section] = {}
            else
                local variableName, variableValue = string.match( line, "(.*)%s*=%s*(.+[^%s])" ) -- Returns variable name and variable value
                if variableName and variableValue then
                    iniTable[currentSection][variableName] = variableValue
                end
            end
        end
        return iniTable
    end
    return nil
end

function ini.save( iniTable, file )
    if iniTable then
        local writeString = ""
        for sectionName, sectionValue in pairs( iniTable ) do
            writeString = writeString .. "[" .. sectionName .. "]" .. "\r\n"
            for variableName, variableValue in pairs(sectionValue) do
                writeString = writeString .. variableName .. " = " .. variableValue .. "\r\n"
            end
        end
        local success, message = love.filesystem.write( file, writeString )
        if not success then
            return message
        end
        return 1
    end
    return nil
end


function ini.readKey( iniTable, sectionName, keyName )
    return iniTable[sectionName][keyName]
end

function ini.addSection( iniTable, newSectionName )
    iniTable[newSectionName] = {}
    return 1
end

function ini.addKey( iniTable, sectionName, keyName, keyValue )
    iniTable[sectionName][keyName] = keyValue
    return 1
end

function ini.sectionExists( iniTable, sectionName )
    if iniTable[sectionName] then
        return 1
    end
    return 0
end

function ini.keyExists( iniTable, keyName )
    if iniTable[sectionName][keyName] then
        return 1
    end
    return 0
end

function ini.deleteSection( iniTable, sectionName )
    iniTable[sectionName] = nil
    return 1
end

function ini.deleteKey( iniTable, sectionName, keyName )
    iniTable[sectionName][keyName] = nil
    return 1
end

return ini
