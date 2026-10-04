-- File: quarto/kennsluakademia.lua
-- Sets `numbered-affiliations` when there is more than one affiliation, so the
-- templates only print affiliation numbers when they are needed.
-- ::: {.ka-callout title="..."} becomes \callout{title}{body} in LaTeX (see the class),
-- and a titled box in the conference colours in HTML.

function Div(el)
  if not el.classes:includes("ka-callout") then
    return nil
  end
  local title = el.attributes.title or ""
  local title_inlines = pandoc.utils.blocks_to_inlines(pandoc.read(title, "markdown").blocks)

  if quarto.doc.is_format("latex") then
    local title_tex = pandoc.write(pandoc.Pandoc({ pandoc.Plain(title_inlines) }), "latex")
    local blocks = pandoc.Blocks{ pandoc.RawBlock("latex", "\\callout{" .. title_tex .. "}{%") }
    blocks:extend(el.content)
    blocks:insert(pandoc.RawBlock("latex", "}"))
    return blocks
  end

  if quarto.doc.is_format("html") then
    el.attributes.title = nil
    el.content:insert(1, pandoc.Div(pandoc.Plain(title_inlines), { class = "ka-callout-title" }))
    return el
  end
end

function Meta(meta)
  local affs = meta.affiliations or meta["by-affiliation"]
  if affs and #affs > 1 then
    meta["numbered-affiliations"] = true
  end
  return meta
end
