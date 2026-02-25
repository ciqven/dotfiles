local _get_cwd = ya.sync(
    function(state)
        return cx.active.current.cwd
    end
)

return {
    entry = function(self)
        local cwd = _get_cwd()  -- Yazi’s current directory

        local cmd, result = ya.input {
            title = "Run in new Kitty tab:",
            position = { "top-center", y = 3, w = 60 },
            value = "",
        }

        if result ~= 1 then
            return
        end

        if cmd == "" then
            return
        end

        -- Escape single quotes for safety
        local cmd_esc = cmd:gsub("'", "\\'")
        local shell_cmd = string.format("kitten @ launch --type=tab bash -lc '%s'", cmd)

        local child, err = Command("sh")
            :arg {"-c", shell_cmd}
            :cwd(tostring(cwd))
            :spawn()
    end,
}
