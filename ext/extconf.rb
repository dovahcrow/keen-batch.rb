require 'fileutils'
require 'mkmf'
include FileUtils

%x(curl -sf https://raw.githubusercontent.com/doomsplayer/multirust/master/blastoff.sh | sh -s -- --yes)
#print %x(multirust default nightly-2015-10-01), "\n"
print %x(echo rustc -v), "\n"
%x(git clone https://github.com/doomsplayer/keen_native)
Dir.chdir("keen_native")
print %x(cargo build --release), "\n"
mv("target/release/libkeen_native.so", "../../lib/")
Dir.chdir("../")
create_makefile(".")
