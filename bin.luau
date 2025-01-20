local process = require('@lune/process')
local pathfs = require('./lune_packages/pathfs')

local luneLuaurc = [[
{
    "languageMode": "strict",
    "aliases": {
        "lune": "~/.lune/.typedefs/0.8.9/"
    },
    "lint": {
        "LocalShadow": false
    }
}
]]

local luauLuaurc = [[
{
    "languageMode": "strict"
}
]]

local args = process.args

local isLune = table.find(args, '--lune')

if not pathfs.isFile('.luaurc') then
    if isLune then
        pathfs.writeFile('.luaurc', luneLuaurc)
    else
        pathfs.writeFile('.luaurc', luauLuaurc)
    end
end

if not pathfs.isDir('src') then
    pathfs.writeDir('src')
    pathfs.writeFile('src/init.luau', '')
end

if not pathfs.isDir('tests') then
    pathfs.writeDir('tests')
    pathfs.writeFile('tests/test.luau', '')
end



