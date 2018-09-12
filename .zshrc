# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias mtaile='multitail -CS php --mergeall /var/log/httpd/$1*-error_log'
alias sshw='ssh will@will.neadwerx.com -p 22232'
alias ll="ls -la"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias aa=applyalters
alias party="~/terminal-parrot/./parrot -delay 50"
alias gadd="git add . && git status"
alias gdiff="git diff --cached"
alias clear="clear; git status; ls"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --stat"
alias top="htop"
alias aa_ava="su -c '~/linux_utils/apply_alters/apply_alters.pl --webroot=/var/www/vhosts/avalon.will.neadwerx.com --apply_all_unversioned --automate'"
alias aa_mlx="su -c '~/linux_utils/apply_alters/apply_alters.pl --webroot=/var/www/vhosts/mlx.will.neadwerx.com --apply_all_unversioned --automate'"
alias aa_scy="su -c '~/linux_utils/apply_alters/apply_alters.pl --webroot=/var/www/vhosts/scythe.will.neadwerx.com --apply_all_unversioned --automate'"
alias aa_pan="su -c '~/linux_utils/apply_alters/apply_alters.pl --webroot=/var/www/vhosts/pandemic.will.neadwerx.com --apply_all_unversioned --automate'"
alias beth="sudo puppet agent -t"
alias dbex="./auxutils/db_explorer.pl"
alias install_sch="sudo ./perl/scheduler/install_scheduler.sh --auto"
alias clkear="clear"

function applyalters()
{
    # Grab the webroot: webroot must end in '.com'
    local path=$( echo $PWD | sed 's/\(com\/\).*/\1/g')
    local test_file=""

    # Check if file path was passed in for running test mode
    if [ $1 ]; then
        test_file="--test $1"
    fi

    ~/linux_utils/apply_alters/./apply_alters.pl \
        --dbhost $( echo $( sed '1q;d' $path/.db ) ) \
        --dbname $( echo $( sed '3q;d' $path/.db ) ) \
        --new_branch $( echo $( git rev-parse --abbrev-ref HEAD ) ) \
        --path_to_sql $( echo $path/sql ) \
        --customer $( sed '1q;d' $path/.customer ) \
        --dbport $( echo $( sed '2q;d' $path/.db ) ) \
        --apply_all_unversioned \
        $test_file
}
<<<<<<< Updated upstream

# JS fix fixes all of the files marked by the file path for you so you don't have
# to write out the entire function yourself
# Auto fixes javascript files marked by the neadwerx syntax and style checker for eslint.
#
# Called: `jsfix <file>`
function jsfix () {
    fix_file="$1"
    neadpath="/etc/profile.d/vimrc/plugins/syntastic_checkers/eslintrc.js"
    eslint --fix "$neadpath" "$fix_file"
}

# With no parameters, changes into vhosts directory
# With one parameter, changes into a subdirectory of the vhosts
# directory that starts with that string
# e.g.: v ises   (changes into /var/www/vhosts/ises.*.neadwerx.com)
function v () {
    setopt local_options SH_WORD_SPLIT

    if [ -n "$1" ] ; then
        cd /var/www/vhosts/$1*
    else
        cd /var/www/vhosts
    fi
    [ -d .git ] && {
        if [ $UID -ne 0 ] ; then
            git_pull
        fi
        g status
    }
}

=======
>>>>>>> Stashed changes
# Tail access log of site starting with a string
# e.g.: taila ises   (tails access log of ises.*.neadwerx.com)
function taila () {
    setopt local_options SH_WORD_SPLIT

    tail -f /var/log/httpd/$1*-access_log
}

# Tail error log of site starting with a string
# e.g.: taile ises   (tails error log of ises.*.neadwerx.com)
function taile () {
    setopt local_options SH_WORD_SPLIT

    tail -f /var/log/httpd/$1*-error_log
}

function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

#updates .db and .customer files (credit to David Wright for inspiration)
#usage: cust {customer} {db version OR ticket (if a ticket DB exists)}
#if no second argument is supplied, uses customer named DB
function cust() {
    first_char="$(echo $2 | head -c 1)"

    #versioned databases default to {customer}_XERP-{ticket #}
    if [ $# == 1 ]; then
        argument_version=$( printf "%s" $1 )
    elif [ "$first_char" == "X" ]; then
        argument_version=$( printf "%s" $1 "_" $2)
    else
        #gets version by year
        version=$(($(date +'%Y') - 2012))
        version=$((10#${version}))
        #parses release to two characters
        release=$(printf %02d $2)
        argument_version=$( printf "%s" $1 "_v" $version "." $release)
    fi

    current_customer=$1
    current_db="athena\n5432\n$argument_version"

    #if db and customer files exist, write them
    if [ -f ./.customer ]; then
        printf "$current_customer" > ".customer"
    fi

    if [ -f ./.db ]; then
        printf "$current_db" > ".db"
    fi
}

# Idk what this does but it's important
[[ -s "/home/will/.gvm/scripts/gvm" ]] && source "/home/will/.gvm/scripts/gvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Extract all tarballs
function extract () {
    # usage
    if [[ -z "$1" ]] ; then
        echo "usage: extract <file> [<dest>]"
        echo "       Extract the file based on the extension."
    elif [[ -f "$1" ]] ; then
        # get the basename of the file based on extension
        case ${(L)1} in
            *.tar.xz)  bname=$(basename -s .tar.xz  $1) ;;
            *.tar.bz2) bname=$(basename -s .tar.bz2 $1) ;;
            *.tar.gz)  bname=$(basename -s .tar.gz  $1) ;;
            *.tar)     bname=$(basename -s .tar     $1) ;;
            *.tbz2)    bname=$(basename -s .tbz2    $1) ;;
            *.tgz)     bname=$(basename -s .tgz     $1) ;;
            *.jar)     bname=$(basename -s .jar     $1) ;;
            *.zip)     bname=$(basename -s .zip     $1) ;;
            *.7z)      bname=$(basename -s .7z      $1) ;;
            *.bz)      bname=$(basename -s .bz      $1) ;;
            *.bz2)     bname=$(basename -s .bz2     $1) ;;
            *.gz)      bname=$(basename -s .gz      $1) ;;
            *.rar)     bname=$(basename -s .rar     $1) ;;
            *.z)       bname=$(basename -s .z       $1) ;;
            *)         bname="$1"
        esac

        # determine the output directory
        if [[ -z "$2" ]] ; then
            # no dest supplied, use the bname and current directory
            dir="$bname"
        else
            # dest supplied, use that + the bname
            dir="$2/$bname"
        fi

        # ensure the directory exists for extraction
        mkdir -p $dir

        # extract
        case ${(L)1} in
            *.tar.xz)   tar --extract --verbose --directory $dir --file $1 ;;
            *.tar.bz2)  tar --extract --verbose --directory $dir --file $1 ;;
            *.tar.gz)   tar --extract --verbose --directory $dir --file $1 ;;
            *.tar)      tar --extract --verbose --directory $dir --file $1 ;;
            *.tbz2)     tar --extract --verbose --directory $dir --file $1 ;;
            *.tgz)      tar --extract --verbose --directory $dir --file $1 ;;
            *.jar)      unzip -d $dir                                   $1 ;;
            *.zip)      unzip -d $dir                                   $1 ;;
            *.7z)       7za e -o $dir                                   $1 ;;
            *.(bz2|bz)) bunzip2                                         $1 ;;
            *.gz)       gunzip                                          $1 ;;
            *.rar)      unrar x                                         $1 ;;
            *.z)        uncompress                                      $1 ;;
            *)          color_echo red "Unable to extract '$1' :: Unknown extension"
        esac
    else
        color_echo red "File '$1' does not exist!"
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
