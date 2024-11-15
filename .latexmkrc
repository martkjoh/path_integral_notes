$go_mode = 3;
$bibtex_use = 2;
$out_dir = 'build';
set_tex_cmds("--synctex=1 -interaction=nonstopmode -file-line-error %O %S");
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S;';

# Thaks to Overleaf
#############
# metapost  #
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
