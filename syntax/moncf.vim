" Vim syntax file
" This is a GENERATED FILE. Please always refer to source file at the URI below.
" Language: Mon configuration (mon.cf)
" Maintainer: Unagi
" License: This file can be redistribued and/or modified under the same terms
"		as Vim itself.
" Last Change: 2012-11-05
" URL: https://github.com/unagi/
" Notes: 

" Setup
if version >= 600
	if exists("b:current_syntax")
		finish
	endif
else
	syntax clear
endif

" Base constructs
syn match moncfComment "^\s*#.*$"
syn region moncfString start=+"+ end=+"+ skip=+\\\\\|\\\"+

" Core and mpm
syn keyword moncfOption alertdir mondir statedir logdir basedir cfbasedir authfile authtype userfile pamservice serverbind trapbind dtlogfile monerrfile dtlogging histlength historicfile historictime serverport trapport pidfile maxprocs cltimeout randstart dep_recur_limit dep_behavior dep_memory syslog_facility startupalerts_on_reset monremote
syn keyword moncfSingleOption allow_empty_group unack_summary no_comp_alerts
syn keyword moncfOption interval failure_interval traptimeout trapduration randskew description exclude_hosts exclude_period depend dep_behavior alertdepend monitordepend hostdepend dep_memory redistribute alertevery alertafter numalerts startupalert upalertafter

syn match moncfGroup "watch\s\+\S\+" contains=moncfString,moncfLabel
syn keyword moncfString watch contained
syn match moncfLabel "watch" contained contains=NONE

syn match moncfGroup "hostgroup\s\+\S\+" contains=moncfIndex,moncfLabel
syn keyword moncfIndex hostgroup contained
syn match moncfLabel "hostgroup\s+" contained contains=NONE

syn keyword moncfIndex service

syn match moncfAlert "\smonitor\s\+\S\+" contains=moncfOption,moncfLabel
syn match moncfOption "\smonitor\s" contained
syn match moncfLabel "\smonitor\s+" contained contains=NONE

syn keyword moncfUnit period
syn match moncfOption "\s\+\(alert\|upalert\)\s\+"

" Define the default highlighting
if version >= 508 || !exists("did_moncf_syntax_inits")
	if version < 508
		let did_moncf_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

    HiLink moncfIndex Keyword
    HiLink moncfGroup Type
	HiLink moncfOption Function
	HiLink moncfSingleOption Number
    HiLink moncfAlert Special
	HiLink moncfValue Number
    HiLink moncfUnit Comment
	HiLink moncfComment Comment
	HiLink moncfMailaddr Type
	HiLink moncfString String

	delcommand HiLink
endif

let b:current_syntax = "moncf"
