return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmta = require("luasnip.extras.fmt").fmta
    ls.add_snippets("yaml", {
      s(
        "kust_cm_env",
        fmta(
          [[
      configMapGenerator:
        - name: <name>
          envs:
            - .env
          behavior: replace
      <finish>
      ]],
          {
            name = i(1, "name"),
            finish = i(0),
          }
        )
      ),
    })
  end,
}
