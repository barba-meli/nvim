-- return {
--   formatCommand = 'prettier --find-config-path --stdin-filepath ${INPUT}',
--   formatStdin = true
-- }
return {
    formatCommand = ([[
        $([ -n "$(command -v node_modules/.bin/prettier)" ] && echo "node_modules/.bin/prettier" || echo "prettier")
        ${--config-precedence:configPrecedence}
        ${--tab-width:tabWidth}
        ${--single-quote:singleQuote}
        ${--trailing-comma:trailingComma}
    ]]):gsub("\n", "")
}
