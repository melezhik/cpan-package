for p in $(config list)
do
    run_story cpanm package $p
done

set_stdout cpan-package-done

