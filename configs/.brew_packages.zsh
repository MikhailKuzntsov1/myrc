# Brew packages list
# 
# Xclip is needed for yanking into clipboard & analyzing content of cliboard
# for insert IMG plugin
#
# Bear is needed to create compile_commands.json from make (bear -- make)
#
# LLVM package is needed just because it is nice to have it :)
#
brew_packages=(
    nvim # Neovim                   
	node # Node
	bear
	ctags
	tmux # Tmux
	shellcheck # Static analysis for bash
	xclip # integrates system clipboard with Vim (for pasting imgs into MD)
	clang-format 
    autoconf                gmp                     libksba                 luv                     python@3.10
    automake                gnu-sed                 libnghttp2              m4                      readline
    bdw-gc                  gnupg                   libtasn1                mpdecimal               sqlite
    ca-certificates         gnutls                  libtermkey            	msgpack               tinyxml2
    check                   guile                   libtool                 ncurses                 tldr
    lcov                    libunistring            nettle                  tree-sitter
    cmake                   libassuan               libusb                  npth                    unbound
    cppcheck                libevent                libuv                   openssl@1.1             unibilium
    gcovr                   libffi                  libzip                  p11-kit                utf8proc
    gdbm                    libgcrypt               lua                     pcre                    
    gettext                 libgpg-error            luajit-openresty        pinentry                xz
    gh                      libidn2                 luarocks                pkg-config              zstd
    pkg-config              llvm                    
    qt                       
    gnupg
)

