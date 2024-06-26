local co = require("minimalist.colors")

local theme = {}

theme.loadSyntax = function ()
    -- Syntax highlight groups
  local syntax = {
    Type =           { fg = co.bright_bg_1_2, stye = 'bold' }, -- int, long, char, etc.
    StorageClass =   { fg = co.bright_bg_1_2 }, -- static, register, volatile, etc.
    Structure =      { fg = co.bright_bg_1_2 }, -- struct, union, enum, etc.
    Constant =       { fg = co.fg }, -- any constant
    Character =      { fg = co.standout_more }, -- any character constant: 'c', '\n'
    Number =         { fg = co.standout_more }, -- a number constant: 5
    Boolean =        { fg = co.standout_more }, -- a boolean constant: TRUE, false
    Float =          { fg = co.standout_more }, -- a floating point constant: 2.3e10
    Statement =      { fg = co.standout_less }, -- any statement
    Label =          { fg = co.bright_bg_1_2 }, -- case, default, etc.
    Operator =       { fg = co.bright_bg_1_2 }, -- sizeof", "+", "*", etc.
    Exception =      { fg = co.bright_bg_1_2 }, -- try, catch, throw
    PreProc =        { fg = co.standout }, -- generic Preprocessor
    Include =        { fg = co.standout_special_1 }, -- preprocessor #include
    Define =         { fg = co.bright_bg_1_2 }, -- preprocessor #define
    Macro =          { fg = co.bright_bg_1_2 }, -- same as Define
    Typedef =        { fg = co.bright_bg_1_2 }, -- A typedef
    PreCondit =      { fg = co.bg_1 }, -- preprocessor #if, #else, #endif, etc.
    Special =        { fg = co.fg }, -- any special symbol
    SpecialChar =    { fg = co.bg_1 }, -- special character in a constant
    Tag =            { fg = co.fg }, -- you can use CTRL-] on this
    Delimiter =      { fg = co.bg_1 }, -- character that needs attention like , or .
    SpecialComment = { fg = co.standout_less }, -- special things inside a comment
    Debug =          { fg = co.standout }, -- debugging statements
    Underlined =     { fg = co.standout_more, bg = co.none, style = 'underline' }, -- text that stands out, HTML links
    Ignore =         { fg = co.dark_bg_2 }, -- left blank, hidden
    Error =          { fg = co.standout_special_1, bg = co.error_bg, style = 'bold' }, -- any erroneous construct TODO
    Todo =           { fg = co.bg_1, bg = co.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- Help docs
    helpHeadLine       = { fg = co.bright_bg_1_2, style = 'bold' },
    helpCommand        = { fg = co.standout_less },
    helpHyperTextEntry = { fg = co.standout },
    helpHyperTextJump  = { fg = co.standout_more },
    helpSectionDelim   = { fg = co.bg_2 },
    manSectionHeading  = { fg = co.standout, style = 'bold' },
    manSubHeading      = { fg = co.standout, style = 'bold' },
    manOptionDesc      = { fg = co.standout_more, style = 'bold' },

    -- R syntax

    rNamespace           = { fg = co.standout_less, style = 'bold' },
    rType                = { fg = co.standout_less },
    rFunctionName        = { fg = co.standout },
    rKeywordFunction     = { fg = co.bright_bg_1_2, style = 'bold' },
    rCommentKey          = { fg = co.dark_bg_1 },
    rCodeSection         = { fg = co.standout, style = 'bold' },
    rCodeSectionEndDelim = { fg = co.bg_2 },
    rNotOperator         = { fg = co.standout_more },  -- Override `!` operator from default `rOperator` highlight group

    -- Doc
    rOTitle      = { fg = co.bright_bg_1, style = 'bold' },
    rOTitleBlock = { fg = co.bright_bg_1 },
    rOBlock      = { fg = co.bright_bg_1 },
    rOTag        = { fg = co.standout_special_3 },
    rOCommentKey = { fg = co.dark_bg_1 },

    -- Julia syntax

    juliaSymbol              = { fg = co.fg },
    juliaCommentDelim        = { fg = co.dark_bg_1 },
    juliaCommentKey          = { fg = co.dark_bg_1 },
    juliaCodeSection         = { fg = co.standout, style = 'bold' },
    juliaCodeSectionEndDelim = { fg = co.bg_2 },

    -- Literal `function`, `macro`, `struct`, etc
    juliaBlKeywordStart_1 = { fg = co.bright_bg_1_2, style = 'bold' },
    juliaBlKeywordStart_2 = { fg = co.standout },
    juliaBlKeywordEnd = { fg = co.bg_2 },  -- TODO Previously, bg_1 is used

    juliaKeyword = { fg = co.standout_special_1 },
    juliaFunctionName = { fg = co.standout },
    juliaMacro = { fg = co.standout_special_1_2 },
    -- juliaConditional = { fg = co.standout },  -- TODO No need?
    juliaException = { fg = co.standout },
    juliaFunctionCall = { fg = co.standout_less },
    juliaParDelim = { fg = co.bg_1 },
    juliaComma = { fg = co.bg_1 },
    juliaSemicolon = { fg = co.standout_special_1 },  -- NOTE It's brighter than other operators
    juliaInfixKeyword = { fg = co.bright_bg_1_2 },
    juliaComprehensionFor = { fg = co.standout },
    juliaBlKeyword = { fg = co.standout },
    juliaStringDelim = { fg = co.bg_1 },  -- String's quotes
    juliaStringPrefixed = { fg = co.standout_less },  -- R's func, etc
    -- Doc
    juliaDocStringDelim = { fg = co.dark_bg_1 },
    juliaDocString = { fg = co.bright_bg_1 },
    juliacocCode = { fg = co.fg },
    helpExample = { fg = co.standout_less },

    -- SQL
    sqlStatement = { fg = co.standout },
    sqlKeyword   = { fg = co.standout },

    -- Vim
    vimLet        = { fg = co.bg_1 },
    vimFunc       = { fg = co.standout },  -- Custom hl group `function`
    vimKeywordEnd = { fg = co.bg_1 },  -- end, endfunction, endif, endfu, etc
    vimNotFunc    = { fg = co.standout },  -- if, while, return, etc
    vimOption     = { fg = co.standout_less },
    vimSynType    = { fg = co.standout_less },
    vimGroupName  = { fg = co.fg },
    vimSynReg     = { fg = co.standout_less },
    vimGroup      = { fg = co.fg },

    -- Lua
    luaFunction   = { fg = co.standout },
    luaStatement  = { fg = co.standout },  -- TODO Override `Statement`. R'syntax is wrong?
    luaTable      = { fg = co.bg_1 },
    luaKeywordEnd = { fg = co.bg_1 },

    -- bib
    bibKey               = { fg = co.standout, style = 'bold' },
    bibVariable          = { fg = co.standout_special_0 },
    bibEntryKw           = { fg = co.standout_special_0 },
    bibBrace             = { fg = co.standout_less },  -- Brace and its content
    bibField             = { fg = co.bg_1 },  -- "Equal" sign
    bibEntryData         = { fg = co.bg_1 },  -- Comma
    -- bibType              = { fg = co. },
    -- bibNSEntryKw         = { fg = co. },
    -- bibUnescaptedSpecial = { fg = co. },
    -- bibComment           = { fg = co. },
    -- bibComment2          = { fg = co. },
    -- bibComment3          = { fg = co. },

    -- Pandoc
    pandocAtxStart  = { fg = co.standout, style = "bold" },
    pandocAtxHeader = { fg = co.standout_special_0, style = "bold" },  -- Title
    pandocDelimitedCodeBlockStart = { fg = co.bg_1 },
    pandocDelimitedCodeBlockLanguage = { fg = co.bg_1 },
    pandocStrong = { fg = co.standout_more, style = 'bold' },
    pandocEmphasis = { fg = co.standout_more, style = 'italic' },  -- Italicized text
    pandocNoFormatted = { fg = co.standout_less },  -- Code block
    pandocReferenceDefinition = { fg = co.bright_bg_1, style = 'italic' },  -- Concealed link title. Use brighter color because it's concealed
    pandocBlockquote = { fg = co.standout_less },


    -- Markdown. NOTE This also affects other filetype e.g. R

    -- mkdHeading =   { fg = co.standout, style = "bold" },
    -- htmlH1 =   { fg = co.standout, style = "bold" },
    -- htmlH2 =   { fg = co.standout, style = "bold" },
    -- htmlH3 =   { fg = co.standout, style = "bold" },
    -- htmlH4 =   { fg = co.standout, style = "bold" },
    -- htmlH5 =   { fg = co.standout, style = "bold" },
    -- htmlH6 =   { fg = co.standout, style = "bold" },
    -- markdownH1 = { fg = co.standout_less, style = "bold" },
    -- markdownH2 = { fg = co.standout, style = "bold" },
    -- markdownH3 = { fg = co.standout_more, style = "bold" },
    -- markdownH1Delimiter = { fg = co.standout_less },
    -- markdownH2Delimiter = { fg = co.standout },
    -- markdownH3Delimiter = { fg = co.standout_more },

    -- mkdBold = { fg = co.dark_bg_1 },
    -- htmlBold = { fg = co.standout_more, style = 'bold' },
    -- mkdItalic = { fg = co.dark_bg_1 },
    -- htmlItalic = { fg = co.standout_more, style = 'italic' },

    -- mkdDelimiter = { fg = co.bg_1 },
    -- mkdCodeDelimiter = { fg = co.bg_1 },
    -- mkdCode = { fg = co.standout_less },
    -- htmlLink = { fg = co.dark_standout_less_2, style = "italic" },
    -- mkdUrl = { fg = co.bg_1, style = 'italic' },

    -- JSON
    jsonKeyword     = { fg = co.standout, style = 'bold' },
    jsonString      = { fg = co.standout_more },
    jsonQuote       = { fg = co.bg_1 },
    jsonCommentTodo = { fg = co.bg_1, bg = co.none, style = 'bold,italic' },

    -- TOML
    tomlKey    = { fg = co.standout_less },
    tomlString = { fg = co.fg },

    -- XML
    xmlTag     = { fg = co.dark_bg_1 },
    xmlTagName = { fg = co.bg_1 },

    -- Obsidian
    ObsidianBullet        = { fg = co.bg_2 },
    ObsidianRefText       = { fg = co.link_url, underline = true },
    ObsidianExtLinkIcon   = { fg = co.folder_icon, },
    ObsidianHighlightText = { bg = '#75662e' },
    ObsidianTodo          = { fg = '#f78c6c', bold = true },
    ObsidianDone          = { fg = '#89ddff', bold = true },
    ObsidianRightArrow    = { fg = '#f78c6c', bold = true },
    ObsidianTilde         = { fg = '#ff5370', bold = true },
    ObsidianTag           = { fg = '#89ddff', italic = true },

  }

  	-- Italic comments
	if vim.g.minimalist_italic == true then
		syntax.Conditional =		{ fg = co.standout, bg = co.none, style = 'italic' } -- italic if, then, else, endif, switch, etc.
		syntax.Keyword =			{ fg = co.standout, bg = co.none, style = 'italic' } -- italic for, do, while, etc.
		syntax.Repeat =				{ fg = co.standout, bg = co.none, style = 'italic' } -- italic any other keyword
		syntax.Comment =		{ fg = co.bg_2, bg = co.none, style = 'italic' } -- italic comments
		syntax.Function =		{ fg = co.standout_less, bg = co.none, style = 'italic' } -- italic funtion names
		syntax.Identifier =		{ fg = co.standout_less, bg = co.none, style = 'italic' }; -- any variable name
    syntax.String = { fg = co.standout_more, bg = co.none, style= 'italic' } -- any string
	else
		syntax.Comment =		{fg = co.bg_2} -- normal comments
		syntax.Conditional =		{ fg = co.standout } -- normal if, then, else, endif, switch, etc.
		syntax.Keyword =			{ fg = co.standout } -- normal for, do, while, etc.
		syntax.Repeat =				{ fg = co.standout } -- normal any other keyword
		syntax.Function =		{ fg = co.standout_less} -- normal function names
		syntax.Identifier =		{ fg = co.standout_less}; -- any variable name
    syntax.String = { fg = co.standout_more } -- any string
	end

  return syntax

end


theme.loadEditor = function ()
    -- Editor highlight groups

  local editor = {
    MsgArea =          { fg = co.fg },  -- Command line
    NormalFloat =      { fg = co.fg, bg = co.bg }, -- normal text and background color
    FloatBorder =      { fg = co.dark_bg_1, bg = co.bg },  -- TODO Need?
    ColorColumn =      { fg = co.none, bg = co.dark_bg_2 }, --  used for the columns set with 'colorcolumn'
    Conceal =          { fg = co.bg_1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor =           { fg = co.cursor_fg, bg = co.cursor_bg, style = 'reverse' }, -- the character under the cursor
    CursorIM =         { fg = co.cursor_fg, bg = co.cursor_bg, style = 'reverse' }, -- the character under the cursor
    TermCursor =       { fg = co.cursor_fg, bg = co.cursor_bg, style = 'reverse' }, -- the character under the cursor
    TermCursorNC =     { fg = co.cursor_fg, bg = co.cursor_bg, style = 'reverse' }, -- the character under the cursor
    Directory =        { fg = co.bright_bg_1, bg = co.none }, -- directory names (and other special names in listings)

    DiffAdd    = { fg = co.none, bg = co.git_add, },
    DiffChange = { fg = co.none, bg = co.git_change, },
    DiffDelete = { fg = co.none, bg = co.git_delete, },
    DiffText   = { fg = co.none, bg = co.git_change, },  -- Changed text within a changed line TODO Correct?

    EndOfBuffer =      { fg = co.bg },  -- Filler lines `~`
    ErrorMsg =         { fg = co.none },
    Folded =           { fg = co.standout_less, bg = co.fold_bg  },
    FoldColumn =       { fg = co.bright_bg_1 },
    LineNr =           { fg = co.dark_bg_1 },
    MatchParen =       { fg = co.standout, bg = co.none },
    ModeMsg =          { fg = co.standout_more },
    MoreMsg =          { fg = co.standout_more },
    NonText =          { fg = co.standout_special_1 },  -- TODO Telescope's status text. Source is at pickers.lua: virt_text = { { text, "NonText" } }
    Pmenu =            { fg = co.fg, bg = co.bg },
    PmenuSel =         { fg = co.standout, bg = co.slightly_lighter_bg },
    PmenuSbar =        {                      bg = co.bg },
    PmenuThumb =       {                      bg = co.dark_bg_1 },
    Question =         { fg = co.standout_more },
    QuickFixLine =     { fg = co.fg, co.bg_1, style = 'reverse' },
    qfLineNr =         { fg = co.fg, co.bg_1, style = 'reverse' },
    Search =           { fg = co.none, bg = co.standout_special_2 },
    IncSearch =        { fg = co.none, bg = co.standout_special_2_2 },
    CurSearch =        { fg = co.none, bg = co.standout_special_2_2 },
    SpecialKey =       { fg = co.bright_bg_1_2 },
    SpellBad =         { fg = co.standout, bg = co.none, style = 'italic,undercurl' },
    SpellCap =         { fg = co.bright_bg_1, bg = co.none, style = 'italic,undercurl' },
    SpellLocal =       { fg = co.standout_less, bg = co.none, style = 'italic,undercurl' },
    SpellRare =        { fg = co.bright_bg_1_2, bg = co.none, style = 'italic,undercurl' },
    StatusLine =       { fg = co.bg_3, bg = co.slightly_lighter_bg },
    StatusLineNC =     { fg = co.bg_3, bg = co.slightly_lighter_bg },  -- Hacky way to create a separator with very subtle color
    StatusLineTerm =   { fg = co.bg_3, bg = co.bg },
    StatusLineTermNC = { fg = co.bg_3, bg = co.bg },
    TabLineFill =      { fg = co.fg },
    TablineSel =       { fg = co.standout_less, bg = co.standout },
    Tabline =          { fg = co.fg },
    Title =            { fg = co.standout, bg = co.none },
    Visual =           { fg = co.none, bg = co.dark_bg_2 },
    VisualNOS =        { fg = co.none, bg = co.dark_bg_2 },
    WarningMsg =       { fg = co.standout_more },
    WildMenu =         { fg = co.diff_mode_added_line, bg = co.none, style = 'bold' },
    CursorColumn =     { fg = co.none, bg = co.cursorlinefg },
    CursorLineNr =     { fg = co.dark_bg_1, bg = co.slightly_darker_bg },  -- 'Disable' fg by setting it to the same as LineNr
    CursorLine =       { bg = co.cursorline_bg },
    ToolbarLine =      { fg = co.fg, bg = co.dark_bg_2 },
    ToolbarButton =    { fg = co.fg, bg = co.none, style = 'bold' },
    NormalMode =       { fg = co.fg, bg = co.none, style = 'reverse' },
    InsertMode =       { fg = co.standout_more, bg = co.none, style = 'reverse' },
    ReplacelMode =     { fg = co.standout, bg = co.none, style = 'reverse' },
    VisualMode =       { fg = co.bright_bg_1_2, bg = co.none, style = 'reverse' },
    CommandMode =      { fg = co.fg, bg = co.none, style = 'reverse' },
    Warnings =         { fg = co.standout_more },

    healthError =   { fg = co.standout },
    healthSuccess = { fg = co.standout_more },
    healthWarning = { fg = co.standout_more },

    -- Custom highlight group
    VimHighlight = { fg = co.none, bg = co.standout_special_2_3 },  -- vim.highlight

    -- dashboard
    DashboardShortCut = { fg = co.bright_bg_1 },
    DashboardHeader =   { fg = co.bright_bg_1_2 },
    DashboardCenter =   { fg = co.standout_less },
    DashboardFooter =   { fg = co.standout_more, style = "italic" },
  }

  -- Options:

  --Set transparent background
  if vim.g.minimalist_disable_background then
    editor.Normal =     { fg = co.fg, bg = co.none } -- normal text and background color
    editor.SignColumn = { fg = co.fg, bg = co.none }
  else
    editor.Normal =     { fg = co.fg, bg = co.bg } -- normal text and background color
    editor.SignColumn = { fg = co.fg, bg = co.bg }
  end

  -- Remove window split borders
  if vim.g.minimalist_borders then
    editor.WinSeparator = { fg = co.dark_bg_1 }
    editor.VertSplit    = { fg = co.dark_bg_1 }
  else
    editor.WinSeparator = { fg = co.bg }
    editor.VertSplit    = { fg = co.bg }
  end

  return editor
end

theme.loadTerminal = function ()
  -- *cterm-colors*
  -- NR-16   NR-8    COLOR NAME ~
  -- 0	    0	    Black
  -- 1	    4	    DarkBlue
  -- 2	    2	    DarkGreen
  -- 3	    6	    DarkCyan
  -- 4	    1	    DarkRed
  -- 5	    5	    DarkMagenta
  -- 6	    3	    Brown, DarkYellow
  -- 7	    7	    LightGray, LightGrey, Gray, Grey
  -- 8	    0*	    DarkGray, DarkGrey
  -- 9	    4*	    Blue, LightBlue
  -- 10	    2*	    Green, LightGreen
  -- 11	    6*	    Cyan, LightCyan
  -- 12	    1*	    Red, LightRed
  -- 13	    5*	    Magenta, LightMagenta
  -- 14	    3*	    Yellow, LightYellow
  -- 15	    7*	    White

  vim.g.terminal_color_0 = co.dark_bg_1
  vim.g.terminal_color_1 = co.standout_more
  vim.g.terminal_color_2 = co.dark_standout_less_2  -- TODO Bold missing

  vim.g.terminal_color_3 = co.standout_more
  vim.g.terminal_color_4 = co.standout_less  -- TODO Bold missing
  vim.g.terminal_color_5 = co.standout
  vim.g.terminal_color_6 = co.dark_standout_less
  vim.g.terminal_color_7 = co.dark_standout_less
  vim.g.terminal_color_8 = co.bg_2
  vim.g.terminal_color_9 = co.bright_standout_less
  vim.g.terminal_color_10 = co.dark_standout_less_2
  vim.g.terminal_color_11 = co.standout
  vim.g.terminal_color_12 = co.standout_less
  vim.g.terminal_color_13 = co.standout_more -- TODO What is this?
  vim.g.terminal_color_14 = co.standout
  vim.g.terminal_color_15 = co.fg

end

theme.loadTreeSitter = function ()
  -- TreeSitter highlight groups

  local treesitter = {
    TSAnnotation =        { fg = co.diff_mode_added_line },    -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
    TSCharacter=          { fg = co.standout_more },    -- For characters.
    TSConstructor =       { fg = co.bright_bg_1_2 }, -- For constructor calls and definitions: `=                                                                          { }` in Lua, and Java constructors.
    TSConstant =          { fg = co.bg_1 },    -- For constants
    TSFloat =             { fg = co.standout_more },    -- For floats
    TSNumber =            { fg = co.standout_more },    -- For all number
    TSString =            { fg = co.standout_more },    -- For strings.

    TSAttribute =         { fg = co.standout_more },    -- (unstable) TODO: docs
    TSBoolean=            { fg = co.standout_more },    -- For booleans.
    TSConstBuiltin =      { fg = co.bright_bg_1 },    -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro =        { fg = co.bright_bg_1 },    -- For constants that are defined by macros: `NULL` in C.
    TSError =             { fg = co.standout },    -- For syntax/parser errors.
    TSException =         { fg = co.standout_more },    -- For exception related keywords.
    TSField =             { fg = co.fg }, -- For fields.
    TSFuncMacro =         { fg = co.bright_bg_1 },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude =           { fg = co.bright_bg_1_2 },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSLabel =             { fg = co.standout_more }, -- For labels: `label:` in C and `:label:` in Lua.
    TSNamespace =         { fg = co.fg},    -- For identifiers referring to modules and namespaces.
    TSOperator =          { fg = co.bright_bg_1_2 }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter =         { fg = co.param }, -- For parameters of a function.
    TSParameterReference= { fg = co.param },    -- For references to parameters of a function.
    TSProperty =          { fg = co.param }, -- Same as `TSField`.
    TSPunctDelimiter =    { fg = co.standout_less }, -- For delimiters ie: `.`
    TSPunctBracket =      { fg = co.standout_less }, -- For brackets and parens.
    TSPunctSpecial =      { fg = co.standout_less }, -- For special punctutation that does not fall in the catagories before.
    TSStringRegex =       { fg = co.bright_bg_1 }, -- For regexes.
    TSStringEscape =      { fg = co.dark_bg_2 }, -- For escape characters within a string.
    TSSymbol =            { fg = co.standout_more },    -- For identifiers referring to symbols or atoms.
    TSType =              { fg = co.bright_bg_1_2},    -- For types.
    TSTypeBuiltin =       { fg = co.bright_bg_1_2},    -- For builtin types.
    TSTag =               { fg = co.fg },    -- Tags like html tag names.
    TSTagDelimiter =      { fg = co.standout_more },    -- Tag delimiter like `<` `>` `/`
    TSText =              { fg = co.fg },    -- For strings considenord11_gui text in a markup language.
    TSTextReference =     { fg = co.standout_more }, -- FIXME
    TSEmphasis =          { fg = co.param },    -- For text to be represented with emphasis.
    TSUnderline =         { fg = co.fg, bg = co.none, style = 'underline' },    -- For text to be represented with an underline.
    TSTitle =             { fg = co.param, bg = co.none, style = 'bold' },    -- Text that is part of a title.
    TSLiteral =           { fg = co.fg },    -- Literal text.
    TSURI =               { fg = co.standout_more },    -- Any URI like a link or email.        TSAnnotation =                                                                  { fg = co.standout },    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.


  -- TODO ----------------------------------------------------------------------------------------

    -- -- These groups are for the Neovim tree-sitter highlights.
    -- ["@annotation"] = { link = "PreProc" },
    -- ["@attribute"] = { link = "PreProc" },
    -- ["@boolean"] = { link = "Boolean" },
    -- ["@character"] = { link = "Character" },
    -- ["@character.special"] = { link = "SpecialChar" },
    -- ["@comment"] = { link = "Comment" },
    -- ["@keyword.conditional"] = { link = "Conditional" },
    -- ["@constant"] = { link = "Constant" },
    -- ["@constant.builtin"] = { link = "Special" },
    -- ["@constant.macro"] = { link = "Define" },
    -- ["@keyword.debug"] = { link = "Debug" },
    -- ["@keyword.directive.define"] = { link = "Define" },
    -- ["@keyword.exception"] = { link = "Exception" },
    -- ["@number.float"] = { link = "Float" },
    -- ["@function"] = { link = "Function" },
    -- ["@function.builtin"] = { link = "Special" },
    -- ["@function.call"] = { link = "@function" },
    -- ["@function.macro"] = { link = "Macro" },
    -- ["@keyword.import"] = { link = "Include" },
    -- ["@keyword.coroutine"] = { link = "@keyword" },
    -- ["@keyword.operator"] = { link = "@operator" },
    -- ["@keyword.return"] = { link = "@keyword" },
    -- ["@function.method"] = { link = "Function" },
    -- ["@function.method.call"] = { link = "@function.method" },
    -- ["@namespace.builtin"] = { link = "@variable.builtin" },
    -- ["@none"] = {},
    -- ["@number"] = { link = "Number" },
    -- ["@keyword.directive"] = { link = "PreProc" },
    -- ["@keyword.repeat"] = { link = "Repeat" },
    -- ["@keyword.storage"] = { link = "StorageClass" },
    -- ["@string"] = { link = "String" },
    ["@markup.link.label"] = { fg = co.link_url, style = 'underline' },
    ["@markup.link.label.symbol"] = { fg = co.link_url },
    ["@markup.link.url"] = { fg = co.fg },
    -- ["@tag"] = { link = "Label" },
    -- ["@tag.attribute"] = { link = "@property" },
    -- ["@tag.delimiter"] = { link = "Delimiter" },
    ["@markup"] = { link = "@none" },
    ["@markup.raw.block"] = { bg = co.code_block },  -- Codeblock
    ["@markup.raw.markdown_inline"] = { fg = co.standout_more, bg = co.code_block },  -- Inline codeblock
    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "Type" },
    ["@markup.raw"] = { link = 'String' },
    ["@markup.math"] = { link = "Special" },
    ["@markup.strong"] = { fg = co.strong, style = 'bold' },
    ["@markup.emphasis"] = { fg = co.standout_more, style = 'italic' },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = co.standout, style = 'bold' },
    -- ["@comment.note"] = { fg = c.hint },
    -- ["@comment.error"] = { fg = c.error },
    -- ["@comment.hint"] = { fg = c.hint },
    -- ["@comment.info"] = { fg = c.info },
    -- ["@comment.warning"] = { fg = c.warning },
    -- ["@comment.todo"] = { fg = c.todo },
    -- ["@type"] = { link = "Type" },
    -- ["@type.definition"] = { link = "Typedef" },
    -- ["@type.qualifier"] = { link = "@keyword" },

    -- --- Misc
    -- -- TODO:
    -- -- ["@comment.documentation"] = { },
    -- ["@operator"] = { fg = c.blue5 }, -- For any operator: `+`, but also `->` and `*` in C.

    -- --- Punctuation
    -- ["@punctuation.delimiter"] = { fg = c.blue5 }, -- For delimiters ie: `.`
    -- ["@punctuation.bracket"] = { fg = c.fg_dark }, -- For brackets and parens.
    -- ["@punctuation.special"] = { fg = c.blue5 }, -- For special symbols (e.g. `{}` in string interpolation)
    -- ["@markup.list"] = { fg = c.blue5 }, -- For special punctutation that does not fall in the catagories before.
    ["@markup.list.markdown"] = { fg = co.bg_2, bold = true },  -- Ordered list

    -- --- Literals
    -- ["@string.documentation"] = { fg = c.yellow },
    -- ["@string.regexp"] = { fg = c.blue6 }, -- For regexes.
    -- ["@string.escape"] = { fg = c.magenta }, -- For escape characters within a string.

    -- --- Functions
    -- ["@constructor"] = { fg = c.magenta }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    -- ["@variable.parameter"] = { fg = c.yellow }, -- For parameters of a function.
    -- ["@variable.parameter.builtin"] = { fg = util.lighten(c.yellow, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    -- --- Keywords
    -- ["@keyword"] = { fg = c.purple, style = options.styles.keywords }, -- For keywords that don't fall in previous categories.
    -- ["@keyword.function"] = { fg = c.magenta, style = options.styles.functions }, -- For keywords used to define a fuction.

    -- ["@label"] = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.

    -- --- Types
    -- ["@type.builtin"] = { fg = util.darken(c.blue1, 0.8) },
    -- ["@variable.member"] = { fg = c.green1 }, -- For fields.
    -- ["@property"] = { fg = c.green1 },

    -- --- Identifiers
    -- ["@variable"] = { fg = c.fg, style = options.styles.variables }, -- Any variable name that does not have another highlight.
    -- ["@variable.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    -- ["@module.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.

    -- --- Text
    -- -- ["@markup.raw.markdown"] = { fg = c.blue },
    -- ["@markup.raw.markdown_inline"] = { bg = c.terminal_black, fg = c.blue },
    -- ["@markup.link"] = { fg = c.teal },

    -- ["@markup.list.unchecked"] = { fg = '#ff0000' }, -- For brackets and parens.
    -- ["@markup.list.checked"] = { fg = '#ff0000' }, -- For brackets and parens.

    -- ["@diff.plus"] = { link = "DiffAdd" },
    -- ["@diff.minus"] = { link = "DiffDelete" },
    -- ["@diff.delta"] = { link = "DiffChange" },

    -- ["@module"] = { link = "Include" },

    -- -- tsx
    -- ["@tag.tsx"] = { fg = c.red },
    -- ["@constructor.tsx"] = { fg = c.blue1 },
    -- ["@tag.delimiter.tsx"] = { fg = util.darken(c.blue, 0.7) },

    -- -- LSP Semantic Token Groups
    -- ["@lsp.type.boolean"] = { link = "@boolean" },
    -- ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    -- ["@lsp.type.comment"] = { link = "@comment" },
    -- ["@lsp.type.decorator"] = { link = "@attribute" },
    -- ["@lsp.type.deriveHelper"] = { link = "@attribute" },
    -- ["@lsp.type.enum"] = { link = "@type" },
    -- ["@lsp.type.enumMember"] = { link = "@constant" },
    -- ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    -- ["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
    -- ["@lsp.type.generic"] = { link = "@variable" },
    -- ["@lsp.type.interface"] = { fg = util.lighten(c.blue1, 0.7) },
    -- ["@lsp.type.keyword"] = { link = "@keyword" },
    -- ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
    -- ["@lsp.type.namespace"] = { link = "@module" },
    -- ["@lsp.type.number"] = { link = "@number" },
    -- ["@lsp.type.operator"] = { link = "@operator" },
    -- ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    -- ["@lsp.type.property"] = { link = "@property" },
    -- ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    -- ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    -- ["@lsp.type.string"] = { link = "@string" },
    -- ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    -- ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.error },
    -- ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    -- ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    -- ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    -- ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    -- ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    -- ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    -- ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
    -- ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    -- ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    -- ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    -- ["@lsp.typemod.string.injected"] = { link = "@string" },
    -- ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
    -- ["@lsp.typemod.type.defaultLibrary"] = { fg = util.darken(c.blue1, 0.8) },
    -- ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = util.darken(c.blue1, 0.8) },
    -- ["@lsp.typemod.variable.callable"] = { link = "@function" },
    -- ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    -- ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    -- ["@lsp.typemod.variable.static"] = { link = "@constant" },
    -- -- NOTE: maybe add these with distinct highlights?
    -- -- ["@lsp.typemod.variable.globalScope"] (global variables)

  -- END TODO ----------------------------------------------------------------------------------------

  }

  treesitter.TSComment=          { fg = co.bg_2 }
  treesitter.TSConditional =     { fg = co.bright_bg_1_2 }   -- For keywords related to conditionnals.
  treesitter.TSKeyword =         { fg = co.bright_bg_1_2 } -- For keywords that don't fall in previous categories.
  treesitter.TSRepeat =          { fg = co.bright_bg_1_2 }    -- For keywords related to loops.
  treesitter.TSKeywordFunction = { fg = co.standout_less }
  treesitter.TSFunction =        { fg = co.standout_less }    -- For fuction (calls and definitions).
  treesitter.TSMethod =          { fg = co.bright_bg_1 }    -- For method calls and definitions.
  treesitter.TSFuncBuiltin =     { fg = co.standout_less }
  treesitter.TSVariable =        { fg = co.fg }-- Any variable name that does not have another highlight.
  treesitter.TSVariableBuiltin = { fg = co.fg }

  return treesitter

end

theme.loadLSP = function ()
  -- Lsp highlight groups

  local lsp = {

    DiagnosticError            = { fg = co.lsp_diag_error },
    DiagnosticSignError        = { fg = co.lsp_diag_error },
    DiagnosticFloatingError    = { fg = co.lsp_diag_error },
    DiagnosticVirtualTextError = { fg = co.lsp_diag_error, bg = co.lsp_diag_error_bg },
    DiagnosticUnderlineError   = { fg = co.lsp_diag_error },

    DiagnosticWarn             = { fg = co.lsp_diag_warn },
    DiagnosticSignWarn         = { fg = co.lsp_diag_warn },
    DiagnosticFloatingWarn     = { fg = co.lsp_diag_warn },
    DiagnosticVirtualTextWarn  = { fg = co.lsp_diag_warn, bg = co.lsp_diag_warn_bg },
    DiagnosticUnderlineWarn    = { fg = co.lsp_diag_warn },

    DiagnosticInfo             = { fg = co.lsp_diag_info },
    DiagnosticSignInfo         = { fg = co.lsp_diag_info },
    DiagnosticFloatingInfo     = { fg = co.lsp_diag_info },
    DiagnosticVirtualTextInfo  = { fg = co.lsp_diag_info, bg = co.lsp_diag_info_bg },
    DiagnosticUnderlineInfo    = { fg = co.lsp_diag_info },

    DiagnosticHint             = { fg = co.lsp_diag_hint },
    DiagnosticSignHint         = { fg = co.lsp_diag_hint },
    DiagnosticFloatingHint     = { fg = co.lsp_diag_hint },
    DiagnosticVirtualTextHint  = { fg = co.lsp_diag_hint, bg = co.lsp_diag_hint_bg },
    DiagnosticUnderlineHint    = { fg = co.lsp_diag_hint },

    LspDiagnosticsDefaultError           = { fg = co.standout }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsSignError              = { fg = co.standout }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError          = { fg = co.standout }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextError       = { fg = co.standout }, -- Virtual text "Error"
    LspDiagnosticsUnderlineError         = { style = 'undercurl', sp = co.standout }, -- used to underline "Error" diagnostics.

    LspDiagnosticsDefaultWarning         = { fg = co.standout_more}, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning            = { fg = co.standout_more}, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning        = { fg = co.standout_more}, -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextWarning     = { fg = co.standout_more}, -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning       = { style = 'undercurl', sp = co.standout_more }, -- used to underline "Warning" diagnostics.

    LspDiagnosticsDefaultInformation     = { fg = co.param }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsSignInformation        = { fg = co.param },  -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation    = { fg = co.param }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextInformation = { fg = co.param }, -- Virtual text "Information"
    LspDiagnosticsUnderlineInformation   = { style = 'undercurl', sp = co.param }, -- used to underline "Information" diagnostics.

    LspDiagnosticsDefaultHint            = { fg = co.bright_bg_1_2  },  -- used for "Hint" diagnostic virtual text
    LspDiagnosticsSignHint               = { fg = co.bright_bg_1_2  }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint           = { fg = co.bright_bg_1_2  }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextHint        = { fg = co.bright_bg_1_2  }, -- Virtual text "Hint"
    LspDiagnosticsUnderlineHint          = { style = 'undercurl', sp = co.param }, -- used to underline "Hint" diagnostics.

    LspReferenceText  = { fg = co.fg, bg = co.dark_bg_2 }, -- used for highlighting "text" references
    LspReferenceRead  = { fg = co.fg, bg = co.dark_bg_2 }, -- used for highlighting "read" references
    LspReferenceWrite = { fg = co.fg, bg = co.dark_bg_2 }, -- used for highlighting "write" references
  }

  return lsp

end

theme.loadPlugins = function()
  -- Plugins highlight groups

  local plugins = {

    -- Spectre
    SpectreFileDirectory = { fg = co.bg_2 },
    SpectreFileName = { fg = co.standout, style = 'bold' },
    SpectreUI      = { fg = co.bg_3, style = 'italic' },
    SpectreSearch  = { fg = co.standout_more },
    SpectreReplace = { bg = co.SpectreReplace_bg },
    SpectreBorder  = { fg = co.dark_bg_1 },

    -- toggleterm
    ToggleTermBorder = { fg = co.dark_bg_1 },

    -- aerial
    AerialLine          = { bg = co.cursorline_bg, fg = co.standout, style = 'bold' },  -- Line in outline and line in buffer
    AerialLineNC        = { bg = co.cursorline_bg, fg = co.standout, style = 'bold' },
    AerialEvent         = { fg = co.outline_event },  -- NOTE `Event` is my custom branch of {languageserver}

    AerialInterfaceIcon = { fg = co.dark_bg_1 },  -- Markdown's heading icon. Changed to `│`
    AerialFunction      = { fg = co.standout_less },
    AerialFunctionIcon  = { fg = co.standout_less },

    -- lightspeed

    LightspeedGreyWash = { fg = co.bg_1 },

    LightspeedUniqueChar     = { fg = co.fg, style = 'bold' },
    LightspeedMaskedChar     = { fg = co.lightspeed_masked_char },
    LightspeedUnlabeledMatch = { fg = co.fg, style = 'bold' },

    LightspeedOneCharMatch           = { fg = co.lightspeed_label, style = 'bold' },
    LightspeedLabel                  = { fg = co.lightspeed_label, style = 'bold' },
    LightspeedLabelOverlapped        = { fg = co.lightspeed_label_overlapped },
    LightspeedLabelDistant           = { fg = co.lightspeed_label_distance, style = 'bold' },
    LightspeedLabelDistantOverlapped = { fg = co.lightspeed_label_distance_overlapped },
    LightspeedShortcut               = { fg = co.lightspeed_shortcut, style = 'bold' },
    LightspeedShortcutOverlapped     = { fg = co.lightspeed_shortcut, style = 'bold' },

    LightspeedPendingOpArea       = { fg = co.lightspeed_label },
    LightspeedPendingChangeOpArea = { fg = co.lightspeed_label, style = 'strikethrough' },

    -- LspTrouble
    LspTroubleText =   { fg = co.fg },
    LspTroubleCount =  { fg = co.bright_bg_1_2, bg = co.param },
    LspTroubleNormal = { fg = co.fg, bg = co.sidebar },

    -- Diff
    diffAdded =     { fg = co.standout_more },
    diffRemoved =   { fg = co.standout },
    diffChanged =   { fg = co.standout_more },
    diffOldFile =   { fg = co.yelow },
    diffNewFile =   { fg = co.diff_mode_added_line },
    diffFile =      { fg = co.bright_bg_1 },
    diffLine =      { fg = co.standout },
    diffIndexLine = { fg = co.bright_bg_1_2 },

    -- Neogit

    NeogitHunkHeader           = { fg = co.bg_1, style = 'underline' },
    NeogitHunkHeaderHighlight  = { fg = co.bg_1, bg = co.slightly_darker_bg, style = 'underline' },
    NeogitDiffContextHighlight = { fg = co.none, bg = co.slightly_darker_bg },
    NeogitDiffAdd              = { fg = co.fg, bg = co.git_add },
    NeogitDiffAddHighlight     = { fg = co.fg, bg = co.git_add },
    NeogitDiffDelete           = { fg = co.fg, bg = co.git_delete },
    NeogitDiffDeleteHighlight  = { fg = co.fg, bg = co.git_delete },
    NeogitBranch               = { fg = co.param },
    NeogitRemote               = { fg = co.bright_bg_1_2 },

    NeogitStagedChanges   = { fg = co.bright_bg_1_2, style = 'bold,italic,underline' },
    NeogitUnstagedChanges = { fg = co.standout_special_1, style = 'bold,italic,underline' },
    -- NeogitStash =

    NeogitCommitViewHeader = { fg = co.standout_special_1, bg = co.slightly_lighter_bg },
    NeogitFilePath = { fg = co.standout_more },

    NeogitNotificationInfo    = { fg = co.standout_less },
    NeogitNotificationWarning = { fg = co.standout_more },
    NeogitNotificationError   = { fg = co.standout },

    -- GitGutter TODO
    GitGutterAdd =    { fg = co.red  , bg = co.red}, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = co.red  , bg = co.red}, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = co.blue , bg = co.red}, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsChange =   { fg = co.git_gutter_change }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeNr = { fg = co.bg_1, bg = co.git_change }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeLn = { bg = co.git_change }, -- diff mode: Changed line |diff.txt|
    GitSignsAdd =      { fg = co.git_gutter_add }, -- diff mode: Added line |diff.txt|
    GitSignsAddNr =    { fg = co.bg_1, bg = co.git_add }, -- diff mode: Added line |diff.txt|
    GitSignsAddLn =    { bg = co.git_add }, -- diff mode: Added line |diff.txt|
    GitSignsDelete =   { fg = co.git_gutter_delete }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteNr = { fg = co.bg_1, bg = co.git_delete }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteLn = { bg = co.git_delete }, -- diff mode: Deleted line |diff.txt|
    -- Word diff in previews
    GitSignsAddInline          = { bg = co.git_add_emph },
    GitSignsChangeInline       = { bg = co.git_change_emph },
    GitSignsDeleteInline       = { bg = co.git_delete_emph },
    -- Word diff in buffer
    GitSignsAddLnInline        = { bg = co.git_add_emph },
    GitSignsChangeLnInline     = { bg = co.git_change_emph },
    GitSignsDeleteLnInline     = { bg = co.git_delete_emph },
    -- Word diff in virtual lines (e.g. show_deleted)
    GitSignsAddVirtLnInline    = { bg = co.git_add_emph },
    GitSignsChangeVirtLnInline = { bg = co.git_change_emph },
    GitSignsDeleteVirtLnInline = { bg = co.git_delete_emph },

    -- Telescope

    TelescopeNormal         = { fg = co.fg },
    TelescopeSelection      = { bg = co.selection_bg },
    TelescopeMatching       = { fg = co.standout },
    TelescopePromptPrefix   = { fg = co.dark_bg_1 },
    TelescopeSelectionCaret = { fg = co.bright_bg_1_2 },
    TelescopeBorder         = { fg = co.dark_bg_1 },
    TelescopePromptBorder   = { fg = co.dark_bg_1 },
    TelescopeResultsBorder  = { fg = co.dark_bg_1 },
    TelescopePreviewBorder  = { fg = co.dark_bg_1 },
    TelescopeMultiSelection = { bg = co.dark_bg_1 },  -- multi_icon disabled

    TelescopeResultsClass      = { fg = co.standout_special_1 },
    TelescopeResultsConstant   = { fg = co.bright_bg_1 },
    TelescopeResultsField      = { fg = co.bright_bg_1 },
    TelescopeResultsFunction   = { fg = co.standout_less },
    TelescopeResultsMethod     = { fg = co.standout_less },
    TelescopeResultsOperator   = { fg = co.standout_more },
    TelescopeResultsStruct     = { fg = co.standout_special_1 },
    TelescopeResultsVariable   = { fg = co.standout_special_1 },
    TelescopeResultsDiffChange = { fg = co.git_delete_emph, bg = co.none },

    -- harpoon
    HarpoonBorder = { fg = co.dark_bg_1 },

    -- NvimTree
    NvimTreeCursorLine        = { bg = co.cursorline_bg, fg = co.standout },
    NvimTreeRootFolder =        { fg = co.standout_special_1 },
    NvimTreeGitDirty =          { fg = co.standout_more },
    NvimTreeGitNew =            { fg = co.standout_more },
    NvimTreeImageFile =         { fg = co.standout_more },
    NvimTreeExecFile =          { fg = co.standout_more },
    NvimTreeSpecialFile =       { fg = co.standout_special_1 },
    NvimTreeFolderName=         { fg = co.standout_less },
    NvimTreeEmptyFolderName=    { fg = co.dark_bg_2 },
    NvimTreeFolderIcon=         { fg = co.folder_icon },
    NvimTreeFolderArrowOpen =   { fg = co.folder_icon },
    NvimTreeFolderArrowClosed = { fg = co.folder_icon },
    NvimTreeIndentMarker =      { fg = co.indent_marker },
    NvimTreeWindowPicker =      { fg = co.standout, bg = co.standout_special_2, style = 'bold' },
    LspDiagnosticsError =       { fg = co.standout },
    LspDiagnosticsWarning =     { fg = co.standout_more },
    LspDiagnosticsInformation = { fg = co.param },
    LspDiagnosticsHint =        { fg = co.bright_bg_1_2 },

    -- WhichKey
    WhichKey =          { fg = co.standout_more , style = 'bold'},
    WhichKeyGroup =     { fg = co.standout },
    WhichKeyDesc =      { fg = co.bright_bg_1 },
    WhichKeySeperator = { fg = co.fg },
    WhichKeyFloating =  { bg = co.bg },
    WhichKeyFloat =     { bg = co.bg },

    -- Compe
    CmpDocumentation         = { fg = co.fg, bg = co.bg },
    CmpDocumentationBorder   = { fg = co.dark_bg_1, bg = co.bg },
    CmpItemMenu              = { fg = co.bg_2 },
    CmpItemAbbrMatch         = { fg = co.standout_more },
    CmpItemAbbrMatchFuzzy    = { fg = co.standout_more },
    CmpItemAbbrDeprecated    = { fg = co.bg_2 },
    CmpItemKindField         = { fg = co.standout_special_0 },
    -- CmpItemKindProperty      = { fg =  },
    -- CmpItemKindEvent         = { fg =  },
    CmpItemKindText          = { fg = co.dark_bg_1 },
    -- CmpItemKindEnum          = { fg =  },
    -- CmpItemKindKeyword       = { fg =  },
    -- CmpItemKindConstant      = { fg =  },
    -- CmpItemKindConstructor   = { fg =  },
    -- CmpItemKindReference     = { fg =  },
    CmpItemKindFunction      = { fg = co.standout },
    -- CmpItemKindStruct        = { fg =  },
    -- CmpItemKindClass         = { fg =  },
    -- CmpItemKindModule        = { fg =  },
    -- CmpItemKindOperator      = { fg =  },
    CmpItemKindVariable      = { fg = co.lightspeed_shortcut },
    -- CmpItemKindFile          = { fg =  },
    -- CmpItemKindUnit          = { fg =  },
    CmpItemKindSnippet       = { fg = co.bg_2 },
    -- CmpItemKindFolder        = { fg =  },
    -- CmpItemKindMethod        = { fg =  },
    -- CmpItemKindValue         = { fg =  },
    -- CmpItemKindEnumMember    = { fg =  },
    -- CmpItemKindInterface     = { fg =  },
    -- CmpItemKindColor         = { fg =  },
    -- CmpItemKindTypeParameter = { fg =  },

    -- headlines
    -- bg = (10 * nord0 + fg) / 11
    -- Quote     = { fg = '#ff0000' },
    -- CodeBlock = { bg = co.slightly_lighter_bg },
    -- Dash      = { co = '#ff0000', bold = true },
    Headline1 = { fg = "#D08770",  bg = "#3d3c44", bold = true },
    Headline2 = { fg = '#EBCB8B', bg = "#3f4247", bold = true },
    Headline3 = { fg = '#A3BE8C', bg = "#394147", bold = true },
    Headline4 = { fg = '#81A1C1', bg = "#363e4c", bold = true },
    Headline5 = { fg = '#B48EAD', bg = "#3a3c4a", bold = true },
    Headline6 = { fg = '#D8DEE9', bg = "#3d434f", bold = true },


    -- LspSaga: TODO https://github.com/glepnir/lspsaga.nvim/pull/198/files

    LspFloatWinNormal        = { bg = co.bg },
    LspSagaFinderSelection   = { fg = co.standout },
    LspSagaCodeActionContent = { fg = co.param },
    DefinitionIcon           = { fg = co.bright_bg_1 },
    ReferencesIcon           = { fg = co.bright_bg_1 },
    TargetWord               = { fg = co.standout_less },

    LspSagaBorderTitle = { fg = co.standout_less },

    DefinitionPreviewTitle = { fg = co.bright_bg_1_2 },
    LspSagaCodeActionTitle = { fg = co.bright_bg_1_2 },
    LspSagaCodeActionTitle = { fg = co.bright_bg_1_2 },
    LspSagaDiagnosticHeader = { fg = co.bright_bg_1_2 },

    ReferencesCount = { fg = co.bright_bg_1_2 },
    DefinitionCount = { fg = co.bright_bg_1_2 },

    LspFloatWinBorder          = { fg = co.dark_bg_1 },
    LspSagaSignatureHelpBorder = { fg = co.dark_bg_1 },
    LspSagaHoverBorder         = { fg = co.dark_bg_1 },
    LspSagaRenameBorder        = { fg = co.dark_bg_1 },
    LspSagaLspFinderBorder     = { fg = co.dark_bg_1 },
    LspSagaDefPreviewBorder    = { fg = co.dark_bg_1 },
    LspSagaCodeActionBorder    = { fg = co.dark_bg_1 },
    LspSagaDiagnosticBorder    = { fg = co.dark_bg_1},

    LspSagaDiagnosticTruncateLine = {fg = co.dark_bg_1 },
    ProviderTruncateLine          = {fg = co.dark_bg_1},
    LspSagaShTruncateLine         = {fg = co.dark_bg_1},
    LspSagaDocTruncateLine        = {fg = co.dark_bg_1},
    LineDiagTuncateLine           = {fg = co.dark_bg_1},
    LspSagaCodeActionTruncateLine = {fg = co.dark_bg_1},

    -- trouble
    TroubleCount    = { fg = co.standout, bg = co.slightly_lighter_bg },
    TroubleFoldIcon = { fg = co.indent_marker },
    TroubleFile     = { fg = co.bright_bg_1_2, style = 'bold,underline' },

    -- Indent Blankline
    IndentBlanklineChar =        { fg = co.standout },
    IndentBlanklineContextChar = { fg = co.standout },

    -- Illuminate
    illuminatedWord =    { bg = co.standout },
    illuminatedCurWord = { bg = co.standout },

    -- DevIcon
    DevIconR         = { fg = co.DevIconR },
    DevIconRmd       = { fg = co.DevIconRmd },
    DevIconMarkdown  = { fg = co.DevIconMarkdown },
    DevIconJulia     = { fg = co.DevIconJulia },  -- TODO Not working
    DevIconVim       = { fg = co.DevIconVim },
    DevIconGitIgnore = { fg = co.DevIconGitIgnore },

    -- Noice
    NoiceVirtualText                   = { fg = co.lsp_diag_info, bg = co.bg },
    -- NoiceCmdline                       = {  },  -- Normal for the classic cmdline area at the bottom
    -- NoiceCmdlinePopup                  = {  },  -- Normal for the cmdline popup
    -- NoiceCmdlineIcon                   = {  },  -- This overrides other modes' icons?
    NoiceCmdlinePopupTitle             = { fg = co.dark_bg_1 },
    NoiceCmdlineIconCmdline            = { fg = co.dark_bg_1 },
    NoiceCmdlinePopupBorder            = { fg = co.dark_bg_1 },
    NoiceCmdlinePopupBorderCmdline     = { fg = co.dark_bg_1 },
    NoiceCmdlineIconSearch             = { fg = co.dark_bg_1 },
    NoiceCmdlinePopupBorderSearch      = { fg = co.dark_bg_1 },
    -- NoiceCmdlineIconHelp               = {  },
    -- NoiceCmdlinePopupBorderHelp        = {  },
    -- NoiceCmdlineIconFilter             = {  },
    -- NoiceCmdlineIconIncRename          = {  },
    -- NoiceCmdlinePopupBorderFilter      = {  },
    -- NoiceCmdlinePopupBorderIncRename   = {  },
    -- NoiceCmdlineIconInput              = {  },
    -- NoiceCmdlinePopupBorderInput       = {  },
    -- NoiceCmdlineIconLua                = {  },
    -- NoiceCmdlinePopupBorderLua         = {  },
    -- NoiceCmdlineIconCalculator         = {  },
    -- NoiceCmdlinePopupBorderCalculator  = {  },
    -- NoiceCmdlinePrompt                 = {  },
    -- NoiceCompletionItemKindClass       = {  },
    -- NoiceCompletionItemKindColor       = {  },
    -- NoiceCompletionItemKindConstant    = {  },
    -- NoiceCompletionItemKindConstructor = {  },
    -- NoiceCompletionItemKindDefault     = {  },
    -- NoiceCompletionItemKindEnum        = {  },
    -- NoiceCompletionItemKindEnumMember  = {  },
    -- NoiceCompletionItemKindField       = {  },
    -- NoiceCompletionItemKindFile        = {  },
    -- NoiceCompletionItemKindFolder      = {  },
    -- NoiceCompletionItemKindFunction    = {  },
    -- NoiceCompletionItemKindInterface   = {  },
    -- NoiceCompletionItemKindKeyword     = {  },
    -- NoiceCompletionItemKindMethod      = {  },
    -- NoiceCompletionItemKindModule      = {  },
    -- NoiceCompletionItemKindProperty    = {  },
    -- NoiceCompletionItemKindSnippet     = {  },
    -- NoiceCompletionItemKindStruct      = {  },
    -- NoiceCompletionItemKindText        = {  },
    -- NoiceCompletionItemKindUnit        = {  },
    -- NoiceCompletionItemKindValue       = {  },
    -- NoiceCompletionItemKindVariable    = {  },
    -- NoiceCompletionItemMenu            = {  },
    -- NoiceCompletionItemWord            = {  },
    -- NoiceConfirm                       = {  },
    -- NoiceConfirmBorder                 = {  },
    -- NoiceCursor                        = {  },
    -- NoiceFormatConfirm                 = {  },
    -- NoiceFormatConfirmDefault          = {  },
    -- NoiceFormatDate                    = {  },
    -- NoiceFormatEvent                   = {  },
    -- NoiceFormatKind                    = {  },
    -- NoiceFormatLevelDebug              = {  },
    -- NoiceFormatLevelError              = {  },
    -- NoiceFormatLevelInfo               = {  },
    -- NoiceFormatLevelOff                = {  },
    -- NoiceFormatLevelTrace              = {  },
    -- NoiceFormatLevelWarn               = {  },
    -- NoiceFormatProgressDone            = {  },
    -- NoiceFormatProgressTodo            = {  },
    -- NoiceFormatTitle                   = {  },
    -- NoiceLspProgressClient             = {  },
    -- NoiceLspProgressSpinner            = {  },
    -- NoiceLspProgressTitle              = {  },
    NoiceMini                          = { fg = co.standout_special_0 },
    -- NoicePopup                         = {  },
    -- NoicePopupBorder                   = {  },
    -- NoicePopupmenu                     = {  },
    -- NoicePopupmenuBorder               = {  },
    -- NoicePopupmenuMatch                = {  },
    -- NoicePopupmenuSelected             = {  },
    -- NoiceScrollbar                     = {  },
    -- NoiceScrollbarThumb                = {  },
    -- NoiceSplit                         = {  },
    -- NoiceSplitBorder                   = {  },

    -- Notify (also used by Noice)

    -- NotifyBackground       = {  },
    NotifyERRORBorder      = { fg = co.dark_bg_1 },
    NotifyWARNBorder       = { fg = co.dark_bg_1 },
    NotifyINFOBorder       = { fg = co.dark_bg_1 },
    NotifyDEBUGBorder      = { fg = co.dark_bg_1 },
    NotifyTRACEBorder      = { fg = co.dark_bg_1 },
    -- NotifyERRORIcon        = {  },
    -- NotifyWARNIcon         = {  },
    NotifyINFOIcon         = { fg = co.dark_bg_1 },
    -- NotifyDEBUGIcon        = {  },
    -- NotifyTRACEIcon        = {  },
    -- NotifyERRORTitle       = {  },
    -- NotifyWARNTitle        = {  },
    NotifyINFOTitle        = { fg = co.dark_bg_1 },
    -- NotifyDEBUGTitle       = {  },
    -- NotifyTRACETitle       = {  },

    NotifyERRORBody = { fg = co.standout_special_0 },
    NotifyWARNBody  = { fg = co.standout_special_0 },
    NotifyINFOBody  = { fg = co.standout_special_0 },
    NotifyDEBUGBody = { fg = co.standout_special_0 },
    NotifyTRACEBody = { fg = co.standout_special_0 },

    -- NotifyLogTime  = {  },
    -- NotifyLogTitle = {  },

    -- indent-blankline
    IblIndent     = { fg = co.dark_bg_1 },
    IblWhitespace = { fg = co.dark_bg_1 },
    -- IblScope  = {  },

  }
  -- Options:

  -- Disable nvim-tree background
  if vim.g.minimalist_disable_background then
    plugins.NvimTreeNormal = { fg = co.fg, bg = co.none }
  else
    plugins.NvimTreeNormal = { fg = co.fg, bg = co.sidebar }
  end

  if vim.g.minimalist_enable_sidebar_background then
    plugins.NvimTreeNormal = { fg = co.fg, bg = co.sidebar }
  else
    plugins.NvimTreeNormal = { fg = co.fg, bg = co.none }
  end

  return plugins

end

return theme
