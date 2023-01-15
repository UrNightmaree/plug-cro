local function log(infobar, msg)
    infobar:Message("[plug-cro]: "..msg)
end

local function err(infobar, msg)
    infobar:Error("[plug-cro]: "..msg)
end

return {
    log = log,
    error = err
}
