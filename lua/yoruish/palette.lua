local Util = require("yoruish.util")

---@class Palette
local palette = {
    -- Surfaces, dark to darkest
    bg = "#141416",
    bg_alt = "#1c1c1e",
    bg_soft = "#1f1f21",
    bg_plum = "#302028",
    bg_delete = "#40000a",
    surface = "#333333",
    selection = "#384048",
    border = "#404040",
    float_bg = "#403c41",

    -- Greys, dim to bright. True neutral (sat=0) except grey_warm, kept intentionally warm.
    grey_warm = "#605958",
    comment = "#3e3e43",
    grey = "#575757",
    grey_mid = "#757575",
    grey_light = "#989898",
    grey_pale = "#b8b8b8",
    silver = "#c7c7c7",
    fg = "#e4e4e8",
    fg_bright = "#f0f0f0",
    cream = "#f0e0d6",

    -- Foundation
    black = "#161717",
    white = "#ffffff",

    -- Accents -- the actual identity of this theme. Four hues, one concept each.
    keyword = "#de8f78", -- keywords, numbers, builtin types, macros (weight, not hue, sets macros apart)
    func = "#6791c9",    -- function/method calls
    type = "#de7c6b",    -- types, traits, constants, JSX/TSX tags
    string = "#87c7a1",  -- string literals, regex
    signal = "#df5b61",  -- warm UI cue, not a syntax color: search/jump-target bg, git-change, dashboard keys

    -- Diagnostics, ranked by urgency (all 6.9-9.0 contrast against bg)
    error = "#df5b61",
    warning = "#d9a35a",
    info = "#70b9cc",
    hint = "#b09080",
    ok = "#87c7a1",

    none = "NONE",
}

palette.number = palette.keyword -- alias, not a copy: numeric literals share the keyword accent

palette.cursor_line = { bg = "#1b1b1d" }
palette.cursor_line_nr = { fg = palette.silver }
palette.line_nr = Util.blend_bg(palette.grey_warm, 0.45, palette.bg)

-- Whole-line diff backgrounds are subtle tints of the same hue as the fg,
-- so DiffAdd/DiffChange/DiffDelete read as one family instead of flat grey.
-- `text` (word-level diff, e.g. DiffText) gets a stronger tint since it marks
-- the exact changed span within an already-tinted DiffChange line.
palette.git = {
    add = { fg = palette.ok, bg = Util.blend_bg(palette.ok, 0.14, palette.bg) },
    delete = { fg = palette.error, bg = palette.bg_delete },
    change = { fg = palette.warning, bg = Util.blend_bg(palette.warning, 0.10, palette.bg) },
    text = { fg = palette.fg_bright, bg = Util.blend_bg(palette.signal, 0.30, palette.bg) },
}

palette.diag = {
    error = palette.error,
    warning = palette.warning,
    info = palette.info,
    hint = palette.hint,
    ok = palette.ok,
}

palette.visual = palette.border
palette.float_border = palette.border

return palette
