local M = {}

---@param opts? JaimeConfig
function M.setup(opts)
	require('jaime.config').setup(opts)
end

return M
