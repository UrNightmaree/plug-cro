local pc_msg = require "plug-cro.msg"

local function checkcmd(infobar, cmd)
    local exist
    for s in os.getenv "PATH":gmatch "([^:]+)" do
        local path = s.."/"..cmd
        local ok, _, code = os.rename(path, path)

        if ok or ok and code == 13 then
            exist = true
        end
    end

    if not exist then
        pc_msg.error(infobar, "failed to find command `"..cmd.."`")
    end
end

local function checkdeps(infobar)
    checkcmd(infobar, "git")
end

return {
    checkcmd = checkcmd,
    checkdeps = checkdeps
}
