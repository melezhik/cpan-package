install_base=$(config install-base)
user=$(config user)
package=$(story_var package)

if test -z $install_base; then

  echo install $package ...

  if test -z $user; then
    cpanm $story_var $package  -q && echo install ok
  else
    su --shell `which bash` --login -c "cpanm $story_var $package -q && echo install ok" $user
  fi

else

  echo install $package into $install_base ...

  if test -z $user; then
    cpanm $story_var $package -q -l $install_base && echo install ok
  else
    su --shell `which bash` --login -c "cpanm $story_var $package -q  -l $install_base && echo install ok" $user
  fi

fi


