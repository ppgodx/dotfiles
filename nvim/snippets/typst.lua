local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  -- 基本数学环境
  s("eq", fmt([[$ {1} $]], { i(1) })),
  s("display", fmt([[$$ {1} $$]], { i(1) })),

  -- 分数和根号
  s("frac", fmt([[({1})/({2})]], { i(1), i(2) })),
  s("sqrt", fmt([[sqrt({1})]], { i(1) })),

  -- 求和、积分
  s("sum", fmt([[sum_({1})^({2}) {3}]], { i(1, "i=1"), i(2, "n"), i(3) })),
  s("prod", fmt([[product_({1})^({2}) {3}]], { i(1, "i=1"), i(2, "n"), i(3) })),
  s("int", fmt([[integral_({1})^({2}) {3} dif {4}]], { i(1, "a"), i2, "b"), i(3), i(4, "x") })),
  s("lim", fmt([[lim_({1}) {2}]], { i(1, "x -> infinity"), i(2) })),

  -- 三角函数
  s("sin", t("sin")),
  s("cos", t("cos")),
  s("tan", t("tan")),
  s("cot", t("cot")),
  s("sec", t("sec")),
  s("csc", t("csc")),

  -- 对数
  s("ln", t("ln")),
  s("log", fmt([[log_({1}, {2})]], { i(1, "10"), i(2) })),

  -- 希腊字母
  s("alpha", t("alpha")),
  s("beta", t("beta")),
  s("gamma", t("gamma")),
  s("delta", t("delta")),
  s("epsilon", t("epsilon")),
  s("zeta", t("zeta")),
  s("eta", t("eta")),
  s("theta", t("theta")),
  s("iota", t("iota")),
  s("kappa", t("kappa")),
  s("lambda", t("lambda")),
  s("mu", t("mu")),
  s("nu", t("nu")),
  s("xi", t("xi")),
  s("pi", t("pi")),
  s("rho", t("rho")),
  s("sigma", t("sigma")),
  s("tau", t("tau")),
  s("upsilon", t("upsilon")),
  s("phi", t("phi")),
  s("chi", t("chi")),
  s("psi", t("psi")),
  s("omega", t("omega")),

  -- 大写希腊字母
  s("Gamma", t("Gamma")),
  s("Delta", t("Delta")),
  s("Theta", t("Theta")),
  s("Lambda", t("Lambda")),
  s("Xi", t("Xi")),
  s("Pi", t("Pi")),
  s("Sigma", t("Sigma")),
  s("Upsilon", t("Upsilon")),
  s("Phi", t("Phi")),
  s("Psi", t("Psi")),
  s("Omega", t("Omega")),

  -- 向量和运算符
  s("vec", fmt([[arrow({1})]], { i(1) })),
  s("hat", fmt([[hat({1})]], { i(1) })),
  s("dot", fmt([[dot({1})]], { i(1) })),
  s("ddot", fmt([[dot.double({1})]], { i(1) })),
  s("tilde", fmt([[tilde({1})]], { i(1) })),
  s("bar", fmt([[overline({1})]], { i(1) })),

  -- 偏导数和梯度
  s("partial", t("diff")),
  s("nabla", t("nabla")),
  s("grad", t("nabla")),
  s("div", t("nabla dot")),
  s("curl", t("nabla times")),

  -- 矩阵
  s("matrix", fmt([[mat({1})]], { i(1) })),
  s("pmatrix", fmt([[mat({1})]], { i(1) })),
  s("bmatrix", fmt([[mat({1})]], { i(1) })),
  s("det", fmt([[mat(delim: "|", {1})]], { i(1) })),

  -- 关系符号
  s("leq", t("<=")),
  s("geq", t(">=")),
  s("neq", t("!=")),
  s("approx", t("≈")),
  s("equiv", t("≡")),
  s("sim", t("∼")),
  s("propto", t("prop")),
  s("perp", t("⊥")),
  s("parallel", t("∥")),

  -- 集合符号
  s("in", t("in")),
  s("notin", t("in.not")),
  s("subset", t("subset")),
  s("subseteq", t("subset.eq")),
  s("supset", t("supset")),
  s("supseteq", t("supset.eq")),
  s("cup", t("union")),
  s("cap", t("sect")),
  s("emptyset", t("emptyset")),

  -- 箭头
  s("to", t("->")),
  s("mapsto", t("|->")),
  s("leftarrow", t("<-")),
  s("rightarrow", t("->")),
  s("leftrightarrow", t("<->")),
  s("Leftarrow", t("<=")),
  s("Rightarrow", t("=>")),
  s("Leftrightarrow", t("<=>")),

  -- 特殊符号
  s("infty", t("infinity")),
  s("pm", t("+")),
  s("mp", t("∓")),
  s("times", t("times")),
  s("cdot", t("dot")),

  -- 量子力学
  s("ket", fmt([[|{1}⟩]], { i(1) })),
  s("bra", fmt([[⟨{1}|]], { i(1) })),
  s("braket", fmt([[⟨{1}|{2}⟩]], { i(1), i(2) })),

  -- 物理公式
  s("maxwell", fmt([[
$ 
nabla dot bold(E) &= rho / epsilon_0 \
nabla dot bold(B) &= 0 \
nabla times bold(E) &= - (diff bold(B)) / (diff t) \
nabla times bold(B) &= mu_0 bold(J) + mu_0 epsilon_0 (diff bold(E)) / (diff t)
$
]], {})),

  s("schrodinger", fmt([[$ hat(H) Psi = i hbar (diff Psi) / (diff t) $]], {})),
  s("timeindep", fmt([[$ hat(H) psi = E psi $]], {})),

  -- 文档结构
  s("title", fmt([[= {1}]], { i(1) })),
  s("section", fmt([[== {1}]], { i(1) })),
  s("subsection", fmt([[=== {1}]], { i(1) })),
  s("subsubsection", fmt([[==== {1}]], { i(1) })),

  -- 列表
  s("itemize", fmt([[
- {1}
- {2}
- {3}
]], { i(1), i(2), i(3) })),

  s("enumerate", fmt([[
+ {1}
+ {2}
+ {3}
]], { i(1), i(2), i(3) })),

  -- 代码块
  s("code", fmt([[
```{1}
{2}
```
]], { i(1), i(2) })),

  -- 图片
  s("image", fmt([[
#image("{1}", width: {2}%)
]], { i(1), i(2, "50") })),

  -- 表格
  s("table", fmt([[
#table(
  columns: {1},
  [*{2}*], [*{3}*],
  [{4}], [{5}],
)
]], { i(1, "2"), i(2, "Header 1"), i(3, "Header 2"), i(4, "Cell 1"), i(5, "Cell 2") })),

  -- 引用
  s("quote", fmt([[
#quote[{1}]
]], { i(1) })),

  -- 脚注
  s("footnote", fmt([[{1}#footnote[{2}]]], { i(1), i(2) })),
}