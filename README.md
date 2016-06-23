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
        list => 'CGI DBI Moose' 
      )
    );
    

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)


