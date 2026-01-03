-- source https://github.com/Givemegitpls/dotfiles/blob/bb1b7c6275f96454bca20500ff40d65e44a686be/private_dot_config/nvim/lua/functions/python.lua
local export = {}

local function shorten_path(path)
  if not path or #path <= 1 then
    return path or "/"
  end

  local last_slash = path:match(".*/()")

  if last_slash and last_slash > 1 then
    return path:sub(1, last_slash - 2)
  else
    return "/"
  end
end

local function check_poetry(workspace)
  local match = vim.fn.glob(vim.fs.joinpath(workspace, "poetry.lock"))
  if match ~= "" then
    vim.api.nvim_set_current_dir(workspace)
    local venv = vim.fn.trim(vim.fn.system("poetry  env info -p 2> /dev/null"))
    if venv ~= "" then
      return vim.fs.joinpath(venv, "bin", "python")
    end
  end
  return ""
end

local function check_venv(workspace)
  local match = vim.fn.glob(vim.fs.joinpath(workspace, ".venv"))
  if match ~= "" then
    vim.api.nvim_set_current_dir(workspace)
    return vim.fs.joinpath(match, "bin", "python")
  end
  return ""
end

function export.get_python_path()
  workspace = vim.fn.expand("%:p")
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv via poetry in workspace directory.
  if workspace ~= "" then
    while workspace ~= "" do
      local poetry = check_poetry(workspace)
      if poetry ~= "" then
        return poetry
      end
      local venv = check_venv(workspace)
      if venv ~= "" then
        return venv
      end
      workspace = shorten_path(workspace)
    end
  end

  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

return export
