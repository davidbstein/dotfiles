# Useful FISH loops

## Mass rename files

```fish
for FILE_NAME in *
    mv $FILE_NAME (echo $FILE_NAME | sed "s/PATTERN/REPLACE/g")
end
```
