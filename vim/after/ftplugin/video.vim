silent execute "!xdg-open " . shellescape(expand("%:p")) . " &>/dev/null &" 
			\ | buffer# | bdelete# | redraw! | syntax on
