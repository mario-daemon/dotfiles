local translations = {
  es = "Nota",
  en = "Note"
}

-- We use a global variable to store the language
local doc_lang = "en" 

-- This function is guaranteed to run BEFORE the Div function
function Meta(meta)
  if meta.lang then
    doc_lang = pandoc.utils.stringify(meta.lang)
  end
  return meta
end

function Div(el)
  if el.classes:includes("textbox") then
    -- Look up the translation based on what Meta found
    local title = translations[doc_lang] or "Lang Error"
    
    return {
      pandoc.RawBlock('tex', '\\begin{textbox}{' .. title .. '}'),
      el,
      pandoc.RawBlock('tex', '\\end{textbox}')
    }
  end
end

-- This ensures the Meta function runs first in the filter's execution plan
return {{Meta = Meta}, {Div = Div}}