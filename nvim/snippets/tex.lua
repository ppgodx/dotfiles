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
  s("eq", fmt([[\begin{{equation}}
  {}
\end{{equation}}]], { i(1) })),

  s("align", fmt([[\begin{{align}}
  {}
\end{{align}}]], { i(1) })),

  s("gather", fmt([[\begin{{gather}}
  {}
\end{{gather}}]], { i(1) })),

  s("split", fmt([[\begin{{split}}
  {}
\end{{split}}]], { i(1) })),

  -- 数学符号
  s("frac", fmt([[\frac{{{1}}}{{{2}}}]], { i(1), i(2) })),
  s("sqrt", fmt([[\sqrt{{{1}}}]], { i(1) })),
  s("sum", fmt([[\sum_{{{1}}}^{{{2}}} {3}]], { i(1, "i=1"), i(2, "n"), i(3) })),
  s("prod", fmt([[\prod_{{{1}}}^{{{2}}} {3}]], { i(1, "i=1"), i(2, "n"), i(3) })),
  s("int", fmt([[\int_{{{1}}}^{{{2}}} {3} \,d{4}]], { i(1, "a"), i(2, "b"), i(3), i(4, "x") })),
  s("oint", fmt([[\oint_{{{1}}} {2} \,d{3}]], { i(1, "C"), i(2), i(3, "s") })),
  s("lim", fmt([[\lim_{{{1}}} {2}]], { i(1, "x \\to \\infty"), i(2) })),

  -- 三角函数
  s("sin", t("\\sin")),
  s("cos", t("\\cos")),
  s("tan", t("\\tan")),
  s("cot", t("\\cot")),
  s("sec", t("\\sec")),
  s("csc", t("\\csc")),
  s("arcsin", t("\\arcsin")),
  s("arccos", t("\\arccos")),
  s("arctan", t("\\arctan")),

  -- 双曲函数
  s("sinh", t("\\sinh")),
  s("cosh", t("\\cosh")),
  s("tanh", t("\\tanh")),

  -- 对数
  s("ln", t("\\ln")),
  s("log", fmt([[\log_{{{1}}} {2}]], { i(1, "10"), i(2) })),

  -- 集合符号
  s("in", t("\\in")),
  s("ni", t("\\ni")),
  s("notin", t("\\notin")),
  s("subset", t("\\subset")),
  s("subseteq", t("\\subseteq")),
  s("supset", t("\\supset")),
  s("supseteq", t("\\supseteq")),
  s("cup", t("\\cup")),
  s("cap", t("\\cap")),
  s("setminus", t("\\setminus")),
  s("emptyset", t("\\emptyset")),
  s("varnothing", t("\\varnothing")),

  -- 希腊字母
  s("alpha", t("\\alpha")),
  s("beta", t("\\beta")),
  s("gamma", t("\\gamma")),
  s("delta", t("\\delta")),
  s("epsilon", t("\\epsilon")),
  s("varepsilon", t("\\varepsilon")),
  s("zeta", t("\\zeta")),
  s("eta", t("\\eta")),
  s("theta", t("\\theta")),
  s("vartheta", t("\\vartheta")),
  s("iota", t("\\iota")),
  s("kappa", t("\\kappa")),
  s("lambda", t("\\lambda")),
  s("mu", t("\\mu")),
  s("nu", t("\\nu")),
  s("xi", t("\\xi")),
  s("omicron", t("\\omicron")),
  s("pi", t("\\pi")),
  s("varpi", t("\\varpi")),
  s("rho", t("\\rho")),
  s("varrho", t("\\varrho")),
  s("sigma", t("\\sigma")),
  s("varsigma", t("\\varsigma")),
  s("tau", t("\\tau")),
  s("upsilon", t("\\upsilon")),
  s("phi", t("\\phi")),
  s("varphi", t("\\varphi")),
  s("chi", t("\\chi")),
  s("psi", t("\\psi")),
  s("omega", t("\\omega")),

  -- 大写希腊字母
  s("Gamma", t("\\Gamma")),
  s("Delta", t("\\Delta")),
  s("Theta", t("\\Theta")),
  s("Lambda", t("\\Lambda")),
  s("Xi", t("\\Xi")),
  s("Pi", t("\\Pi")),
  s("Sigma", t("\\Sigma")),
  s("Upsilon", t("\\Upsilon")),
  s("Phi", t("\\Phi")),
  s("Psi", t("\\Psi")),
  s("Omega", t("\\Omega")),

  -- 物理符号和常数
  s("hbar", t("\\hbar")),
  s("ell", t("\\ell")),
  s("partial", t("\\partial")),
  s("nabla", t("\\nabla")),
  s("grad", t("\\nabla")),
  s("div", t("\\nabla \\cdot")),
  s("curl", t("\\nabla \\times")),
  s("laplacian", t("\\nabla^2")),

  -- 物理公式
  s("maxwell", fmt([[
\begin{{align}}
  \nabla \cdot \mathbf{{E}} &= \frac{{\rho}}{{\varepsilon_0}} \\
  \nabla \cdot \mathbf{{B}} &= 0 \\
  \nabla \times \mathbf{{E}} &= -\frac{{\partial \mathbf{{B}}}}{{\partial t}} \\
  \nabla \times \mathbf{{B}} &= \mu_0 \mathbf{{J}} + \mu_0 \varepsilon_0 \frac{{\partial \mathbf{{E}}}}{{\partial t}}
\end{{align}}
]], {})),

  s("schrodinger", fmt([[\hat{{H}} \Psi = i\hbar \frac{{\partial \Psi}}{{\partial t}}]], {})),
  s("timeindep", fmt([[\hat{{H}} \psi = E \psi]], {})),

  -- 向量和矩阵
  s("vec", fmt([[\vec{{{1}}}]], { i(1) })),
  s("mathbf", fmt([[\mathbf{{{1}}}]], { i(1) })),
  s("hat", fmt([[\hat{{{1}}}]], { i(1) })),
  s("dot", fmt([[\dot{{{1}}}]], { i(1) })),
  s("ddot", fmt([[\ddot{{{1}}}]], { i(1) })),
  s("overline", fmt([[\overline{{{1}}}]], { i(1) })),
  s("underline", fmt([[\underline{{{1}}}]], { i(1) })),
  s("tilde", fmt([[\tilde{{{1}}}]], { i(1) })),
  s("bar", fmt([[\bar{{{1}}}]], { i(1) })),

  -- 矩阵环境
  s("matrix", fmt([[\begin{{matrix}}
  {1}
\end{{matrix}}]], { i(1) })),

  s("pmatrix", fmt([[\begin{{pmatrix}}
  {1}
\end{{pmatrix}}]], { i(1) })),

  s("bmatrix", fmt([[\begin{{bmatrix}}
  {1}
\end{{bmatrix}}]], { i(1) })),

  s("vmatrix", fmt([[\begin{{vmatrix}}
  {1}
\end{{vmatrix}}]], { i(1) })),

  -- 关系符号
  s("leq", t("\\leq")),
  s("geq", t("\\geq")),
  s("neq", t("\\neq")),
  s("approx", t("\\approx")),
  s("equiv", t("\\equiv")),
  s("sim", t("\\sim")),
  s("simeq", t("\\simeq")),
  s("propto", t("\\propto")),
  s("perp", t("\\perp")),
  s("parallel", t("\\parallel")),

  -- 箭头
  s("to", t("\\to")),
  s("mapsto", t("\\mapsto")),
  s("leftarrow", t("\\leftarrow")),
  s("rightarrow", t("\\rightarrow")),
  s("leftrightarrow", t("\\leftrightarrow")),
  s("Leftarrow", t("\\Leftarrow")),
  s("Rightarrow", t("\\Rightarrow")),
  s("Leftrightarrow", t("\\Leftrightarrow")),

  -- 数学字体
  s("mathbb", fmt([[\mathbb{{{1}}}]], { i(1) })),
  s("mathcal", fmt([[\mathcal{{{1}}}]], { i(1) })),
  s("mathfrak", fmt([[\mathfrak{{{1}}}]], { i(1) })),
  s("mathscr", fmt([[\mathscr{{{1}}}]], { i(1) })),
  s("mathrm", fmt([[\mathrm{{{1}}}]], { i(1) })),
  s("mathit", fmt([[\mathit{{{1}}}]], { i(1) })),

  -- 常用数学符号
  s("infty", t("\\infty")),
  s("pm", t("\\pm")),
  s("mp", t("\\mp")),
  s("times", t("\\times")),
  s("div", t("\\div")),
  s("cdot", t("\\cdot")),
  s("bullet", t("\\bullet")),
  s("circ", t("\\circ")),
  s("star", t("\\star")),
  s("ast", t("\\ast")),

  -- 特殊函数
  s("exp", t("\\exp")),
  s("det", t("\\det")),
  s("tr", t("\\tr")),
  s("rank", t("\\rank")),
  s("dim", t("\\dim")),
  s("ker", t("\\ker")),
  s("im", t("\\text{Im}")),
  s("re", t("\\text{Re}")),

  -- 量子力学
  s("ket", fmt([[|{1}\\rangle]], { i(1) })),
  s("bra", fmt([[\\langle{1}|]], { i(1) })),
  s("braket", fmt([[\\langle{1}|{2}\\rangle]], { i(1), i(2) })),
  s("ketbra", fmt([[|{1}\\rangle\\langle{2}|]], { i(1), i(2) })),

  -- 物理单位（需要siunitx包）
  s("si", fmt([[\si{{{1}}}]], { i(1) })),
  s("num", fmt([[\num{{{1}}}]], { i(1) })),
  s("SI", fmt([[\SI{{{1}}}{{{2}}}]], { i(1), i(2) })),

  -- 化学（需要mhchem包）
  s("ce", fmt([[\ce{{{1}}}]], { i(1) })),
}