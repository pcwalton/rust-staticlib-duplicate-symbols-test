#!/bin/bash
if [ "$1" = clean ]; then
    rm -rf a/target b/target
    exit
fi

cd a || exit 1
cargo build || ( cd .. && exit 1 )
cargo rustc -- --crate-type=staticlib || ( cd .. && exit 1 )
cp target/debug/deps/liba-*.a target/debug/liba.a || ( cd .. && exit 1 )
cd ..

cd b || exit 1
cargo build || ( cd .. && exit 1 )
cd ..

# This line should fail to link:
gcc -o c -La/target/debug -Lb/target/debug c.c -la -lb
