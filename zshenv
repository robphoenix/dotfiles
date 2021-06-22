export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$PATH:$HOME/go/bin
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/Users/robphoenix/Library/Python/3.9/bin:$PATH"
export BAT_THEME=base16
export TERM=xterm

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

