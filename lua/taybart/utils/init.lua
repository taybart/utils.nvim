local M = {
  commands = require('taybart/utils/commands'),
}

function M.file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function M.extract_path_end(path, depth)
  local components = {}
  for part in path:gmatch('[^/]+') do
    table.insert(components, part)
  end

  local result = {}
  for i = math.max(1, #components - depth + 1), #components do
    table.insert(result, components[i])
  end

  return table.concat(result, '/')
end

return M
