#!/usr/local/bin/fish
# pip3 install pdfCropMargins
set mendeley_dir = "/tmp/put_mendeley_location_here"
pushd .
cd $mendeley_dir
for author in (ls .)
    for journal in (ls $author)
        for paper in (ls $author/$journal)
            cd $author/$journal
            pdf-crop-margins --gsFix -mo $paper # gsFix (needed for osx ghostscript) -mo (modify original - and save a backup as <fname>_uncropped.pdf)
            cd $mendeley_dir
        end
    end
end
popd
