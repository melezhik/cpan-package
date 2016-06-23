# SYNOPSIS

CPAN modules installer


# Prerequisites

cpanm client ( as it used to install cpan modules )


# INSTALL

    $ sparrow plg install cpan-package


# USAGE

## Manually

    $ sparrow plg run --param list="'CGI DBI Moose'"

## Via sparrowdo

    task_run  %(
      task => 'install some modules',
      plugin => 'cpan-package',
      parameters => %( 
        list => 'CGI DBI Moose',
        install-base => '/var/app/'
      )
    );
    

# Plugin parameters

## list

Should be space separated list of packages to install. For example:

    list CGI DBI Moose

## install-base

Specify the install base to install modules. See also `-l` parameter for cpanm client.

Optional parameter.


# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)


