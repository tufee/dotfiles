local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load("settings")
load("keymaps")
load("plugins")
load("themes")
