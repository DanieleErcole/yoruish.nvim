local M = {}

---@param opts? yoruish.Config
function M.setup(opts)
    require("yoruish.config").setup(opts)
end

function M.load()
    local ok, result = pcall(function()
        local config = require("yoruish.config")
        local opts = config.opts or config.defaults
        return require("yoruish.highlights").setup(opts)
    end)

    if not ok then
        vim.notify("Failed to load luna colorscheme: " .. tostring(result), vim.log.levels.ERROR)
        return
    end

    vim.g.colors_name = "yoruish"
    return result
end

return M
