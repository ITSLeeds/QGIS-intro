# alternative way to push updated book

# remove _book file
rm -Rv _book
# in powershell
git clone git@github.com:ITSLeeds/QGIS-intro
cd QGIS-intro
git checkout gh-pages
cd ..
mv QGIS-intro _book

# build book...
cd _book
git status
git add -A
git commit -m 'Update book'
git push
cd ..
