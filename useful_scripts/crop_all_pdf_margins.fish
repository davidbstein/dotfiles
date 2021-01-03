#!/usr/local/bin/fish
# pip3 install pdfCropMargins
set mendeley_dir /Users/stein/Dropbox/_Law/Documents\ and\ Adminitrata/Mendeley/
pushd .
cd $mendeley_dir
for author in (ls .)
    for journal in (ls $author)
        for paper in (ls $author/$journal)
            cd $author/$journal
            if count *_uncropped.pdf >/dev/null
              echo "skipping $paper"
            else
              # gsFix (needed for osx ghostscript) -mo (modify original - and save a backup as <fname>_uncropped.pdf)
              echo "CROPPING $paper"
              pdf-crop-margins --gsFix -mo $paper
            end
            cd $mendeley_dir
        end
    end
end
popd
