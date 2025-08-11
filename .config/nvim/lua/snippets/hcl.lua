local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("resource", {
		t('resource "'), i(1), t('" "'), i(2), t('" {'),
		t({ "", "\t" }), i(0), t({ "", "}" }),
	}),
	s("data", {
		t('data "'), i(1), t('" "'), i(2), t('" {'),
		t({ "", "\t" }), i(0), t({ "", "}" }),
	}),
}

