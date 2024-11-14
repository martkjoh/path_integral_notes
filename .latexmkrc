$go_mode = 3;
$bibtex_use = 2;
$out_dir = 'build';
set_tex_cmds("--synctex=1 -interaction=nonstopmode -file-line-error %O %S");
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S;';

# Thaks to Overleaf

##########
# feynmp #
##########
push(@file_not_found, '^dvipdf: Could not find figure file (.*); continuing.$');
add_cus_dep("mp", "1", 0, "mp_to_eps");
sub mp_to_eps {
    system("mpost --interaction nonstopmode $_[0]");
    return 0;
}


#############
# metapost  #  # from Overleaf v1
#############
add_cus_dep('mp', '1', 0, 'mpost');
sub mpost {
    my $file = $_[0];
    my ($name, $path) = fileparse($file);
    pushd($path);
    my $return = system "mpost --interaction nonstopmode $name";
    popd();
    return $return;
}
