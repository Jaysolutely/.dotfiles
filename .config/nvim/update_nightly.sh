#! /bin/sh


if [ ! -w /opt ] || [ ! -w /usr/local/bin ]; then
	echo "needs write acces to /opt and /usr/local/bin" && exit 1
fi

echo -n "- create tmp directory ..."
tmpdir=$(mktemp -d)
echo " OK"
echo "- download nvim:"
wget -P $tmpdir -q --show-progress https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
echo "- download checksum: "
wget -P $tmpdir -q --show-progress https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz.sha256sum
echo -n "- test checksum ... "
sha256sum --check $tmpdir/nvim-linux64.tar.gz.sha256sum || exit 1
echo -n "- unpack tar gz ... "
tar --directory $tmpdir --totals -xzf $tmpdir/nvim-linux64.tar.gz
if [ -d /opt/nvim ]; then
	echo -n "- remove old installation ..."
	rm -rf /opt/nvim
  echo " OK"
fi
echo -n "- install files to /opt/nvim ..."
cp -r $tmpdir/nvim-linux64 /opt/nvim
echo " OK"
echo -n "- link bin to /usr/local/bin/nvim ..."
ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim
echo " OK"
echo -n "- delete tmp directory ..."
rm -rf $tmpdir
echo " OK"
