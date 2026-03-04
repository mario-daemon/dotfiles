-- locale_lib.lua
-- this is shared by other .lua filters to determine language used to translate certain elements
-- tweak the M.translations table to customize or add new elements
local M = {}

M.translations = {
  es = { note = "Nota", date_format = "%d de %B de %Y", page = "Página", of = "de" },
  en = { note = "Note", date_format = "%B %d, %Y", page = "Page", of = "of" }
}

function M.get_lang(meta)
  if meta.lang then
    return pandoc.utils.stringify(meta.lang):sub(1,2)
  end
  return "en" -- fallback
end

return M