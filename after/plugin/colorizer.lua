require'colorizer'.setup({'css', "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescript.tsx", "typescriptreact", "lua"}, {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = false, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = false -- Enable all CSS *functions*: rgb_fn, hsl_fn
})
