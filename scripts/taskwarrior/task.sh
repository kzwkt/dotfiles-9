# taskwarrior
"\M-w":"clear && printf '\nThis Week\n' && task +WEEK\n"
"\C-s":"clear && printf '\nToday\n' && task +TODAY\n"
"\C-x":"clear && printf '\nTomorrow\n' && task +TOMORROW\n"
"\C-q":"clear && printf '\nToday & Tomorrow\n' && task +TODAY or +TOMORROW\n"
"\M-q":"clear && tasksh\n"

# readline
"ç":"ç"
"\C-o": kill-whole-line
"\M-o":"clear && exec "$BASH"\n"
"\M-e":"clear && tmux attach &>/dev/null\n"
# help
"\C-g":"clear && printf '\n   ## Taskwarrior ##\n\n   <C-s>: today\n   <C-x>: tomorrow\n   <M-w>: this week\n   <C-q>: today & tomorrow\n\n   t: task\n   ts: tasksh\n   a: task add\n   td: task delete\n   tm: task modify\n   Postpone: task <filter> modify due:due+1week\n\n   [s,e]od: [start,end] of day\n   [s,e]ow: [start,end] of week\n   [sow,eow]w: [start,end] of next week\n   [so,eo]cw: [start,end] of current week\n\n   ## Bash ##\n\n   <M-o>: exec bash\n   <M-e>: tmux attach\n   <c-g>: show this message\n\n '"
# }}}
