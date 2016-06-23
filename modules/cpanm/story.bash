install_base=$(config install-base)
package=$(story_var package)

if test -z $install_base; then
  echo install $package ...
  cpanm $story_var $package  -q && echo install ok
else
  echo install $package into $install_base ...
  cpanm $story_var $package  -l $install_base -q && echo install ok
fi
