package.path = package.path .. ";ao/?.lua"
package.cpath = package.cpath .. ";ao/?.so"

-- redefin pcall, use 'unsafe_pcall'
function pcall(f, arg1, ...)
  return unsafe_pcall(f, arg1, ...)
end