-- OS-independent path resolution using Pandoc's global state
if PANDOC_STATE and PANDOC_STATE.user_data_dir then
    -- PANDOC_STATE.user_data_dir is a string, so we just append to it
    package.path = package.path .. ";" .. PANDOC_STATE.user_data_dir .. "/filters/?.lua"
end


-- Import shared logic from locale-lib.lua
local locale = require("locale-lib") 

function Meta(meta)
  -- 1. If we are converting to LaTeX or Beamer, exit.
  -- The LaTeX template handles \today natively using the \date{} command.
  if FORMAT:match('latex') or FORMAT:match('beamer') then
    return meta
  end

  -- 2. Determine the language using the shared module
  local lang = locale.get_lang(meta)
  local config = locale.translations[lang] or locale.translations["en"]

  -- 3. Check the current date metadata
  local date_str = ""
  if meta.date then
    date_str = pandoc.utils.stringify(meta.date)
  end

  -- 4. If date is missing or contains the LaTeX command \today...
  if not meta.date or date_str == "\\today" then
    -- Generate the date string from the system using the localized format
    local today = os.date(config.date_format)
    
    -- 5. Special handling for Spanish months (since Lua os.date is usually English)
    if lang == "es" then
      local months = {
        January="enero", February="febrero", March="marzo", April="abril",
        May="mayo", June="junio", July="julio", August="agosto",
        September="septiembre", October="octubre", November="noviembre", December="diciembre"
      }
      for eng, esp in pairs(months) do
        today = today:gsub(eng, esp)
      end
    end
    
    -- 6. Inject the formatted string back into the metadata as a Pandoc object
    meta.date = pandoc.MetaInlines({pandoc.Str(today)})
  end
  
  return meta
end