"" Ack requires ack command
"if executable("ack")
"  " use default config
"elseif executable("ack-grep")
"  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
"elseif executable("ag")
"  let g:ackprg="ag --vimgrep --nocolor --nogroup --column"
"else
"  " TODO: something to disable the plugin
"endif

