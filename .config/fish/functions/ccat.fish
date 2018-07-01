function ccat
	cat $argv[1] | pygmentize | nl -ba | less -r
end
