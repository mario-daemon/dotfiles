-- OS-independent path resolution using Pandoc's global state
if PANDOC_STATE and PANDOC_STATE.user_data_dir then
    -- PANDOC_STATE.user_data_dir is a string, so we just append to it
    package.path = package.path .. ";" .. PANDOC_STATE.user_data_dir .. "/filters/?.lua"
end


-- page.lua
local locale = require("locale-lib")

function Meta(meta)
  local lang = locale.get_lang(meta)
  local t = locale.translations[lang] or locale.translations["en"]

  -- Create the variables that the LaTeX template expects
  meta.page_word = t.page
  meta.of_word = t.of
  
  return meta
end