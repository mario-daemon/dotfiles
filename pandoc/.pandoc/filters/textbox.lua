-- OS-independent path resolution using Pandoc's global state
if PANDOC_STATE and PANDOC_STATE.user_data_dir then
    -- PANDOC_STATE.user_data_dir is a string, so we just append to it
    package.path = package.path .. ";" .. PANDOC_STATE.user_data_dir .. "/filters/?.lua"
end


-- Import shared logic from locale-lib.lua
local locale = require("locale-lib")
local doc_lang = "en"

function Meta(meta)
    -- Capture the language once from the metadata for use in Divs
    doc_lang = locale.get_lang(meta)
    return meta
end

function Div(el)
    -- Check if the current Div has the "textbox" class
    if el.classes:includes("textbox") then
        local config = locale.translations[doc_lang] or locale.translations["en"]
        local title_text = config.note

        if FORMAT:match('latex') or FORMAT:match('beamer') then
            -- No styling here; LaTeX handles it via its template
            return {
                pandoc.RawBlock('tex', '\\begin{textbox}{' .. title_text .. '}'),
                el,
                pandoc.RawBlock('tex', '\\end{textbox}')
            }
        else
            -- HTML/Other: Create a plain string and wrap it in a Span with a class
            -- This keeps it pure and allows CSS/Templates to handle the look
            local title_text_obj = pandoc.Str(title_text)
            local title_span = pandoc.Span({title_text_obj}, {class="textbox-title"})
            
            -- Wrap the span in a Paragraph (a Block) so it can go inside the Div
            local title_element = pandoc.Para({title_span})
            
            table.insert(el.content, 1, title_element)
            return el
        end
    end
end

return {{Meta = Meta}, {Div = Div}}