export RUBY_YJIT_ENABLE=1
export CFLAGS="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L$(brew --prefix libyaml)/lib"
export RUBY_CONFIGURE_OPTS="--with-zlib-dir=$(brew --prefix zlib) --with-openssl-dir=$(brew --prefix openssl@3) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml) --with-gdbm-dir=$(brew --prefix gdbm)"
