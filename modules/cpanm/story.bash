install_base=$(config install-base)
user=$(config user)
package=$(story_var package)
http_proxy=$(config http_proxy)
https_proxy=$(config https_proxy)

if test "${http_proxy}"; then
  set_http_proxy="export http_proxy=${http_proxy};"
fi 

if test "${https_proxy}"; then
  set_https_proxy="export https_proxy=${https_proxy};"
fi 

if test -z $install_base; then

  echo install $package ...

  if test -z $user; then

    $set_https_proxy $set_http_proxy \

    cpanm $story_var $package  -q && echo install ok

  else

    su --shell `which bash` --login -c "$set_https_proxy $set_http_proxy \
    cpanm $story_var $package -q && echo install ok" $user

  fi

else

  echo install $package into $install_base ...

  if test -z $user; then
    cpanm $story_var $package -q -l $install_base && echo install ok
  else
    su --shell `which bash` --login -c "cpanm $story_var $package -q  -l $install_base && echo install ok" $user
  fi

fi


