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


  if test -z $user; then

    echo install $package ...

    $set_https_proxy $set_http_proxy \

    cpanm $story_var $package  -q && echo install ok

  else

    echo install $package user $user ...

    su --shell `which bash` --login -c "$set_https_proxy $set_http_proxy \
    cpanm $story_var $package -q && echo install ok" $user

  fi

else


  if test -z $user; then
    echo install $package into $install_base ...
    $set_https_proxy $set_http_proxy \
    cpanm $story_var $package -q -l $install_base && echo install ok
  else
    echo install $package into $install_base user $user ...
    su --shell `which bash` --login -c "$set_https_proxy $set_http_proxy \
    cpanm $story_var $package -q  -l $install_base && echo install ok" $user
  fi

fi


