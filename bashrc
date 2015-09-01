# ==========================================================================
# annabel.lee
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;4;32'

# export PS1="\[\e[1;33m\]$(ppwd \l)\u:\[\e[1;31m\]\w> \[\e[0m\]"
# export PS1="\[\e[1;33m\]\u:\[\e[1;31m\]\w\n> \[\e[0m\]"
export PS1="\[\e[1;36m\]\u:\[\e[1;31m\]\w\n> \[\e[0m\]"

# colorful man page
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[01;36m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;35m'



export LANG=en_US.UTF-8
# export LANG=C

sedprint()
{
    if [ "$3"x == x ]
    then
        sed -n "${1}p" $2
    else
        sed -n "${1}, ${2}p" $3
    fi
}

findname()
{
    if [ "$1"x == x ]
    then
        echo "input the name"
    else
        find  . -name "$1"
    fi
}

function fordo()
{
    if ! [ $# -eq 2 ]
    then
        echo "Usage: fordo <filename> <command> "
        return
    fi
    filename=$1
    halfcmd=$2
    for f in $(cat ${filename})
    do
        command=${halfcmd}" "$f 
        eval ${command} 
    done
}

function shellmake()
{
    if ! [ $# -eq 1 ]
    then
        echo "Usage: shellmake <cfile> "
        return
    fi
    cfile=$1
    if [ ! -f ${cfile} ]
    then
        echo "${cfile} is not exist"
        return
    fi
    # ofile=${cfile/.c/.o}
    # efile=${cfile/.c/.elf}
    ofile=$(echo ${cfile} | sed -n 's/\.c$/.o/Ip')
    efile=$(echo ${cfile} | sed -n 's/\.c$/.elf/Ip')
    gcc -o ${ofile} -c ${cfile} 
    gcc -o ${efile} ${ofile}
}

LS_COLORS='rs=0:di=01;36:ln=01;30:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;ls
31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

# find  . -iname "*.[c|h]" | xargs -n1 -I "ZZZZZ" astyle --style=ansi --indent=spaces=8 --indent-switches --pad-oper --pad-header --add-brackets --suffix=none  "ZZZZZ"
alias gitcolocal='git checkout $(git branch | grep -v "master" ) && git branch -av '

# Make data base, printed on\|# Finished Make data base on

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE=cd:ls:bg:fg:exit


