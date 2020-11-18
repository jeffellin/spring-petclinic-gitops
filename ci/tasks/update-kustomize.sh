ls -la
cp -r source-code-gitops/. gitops

FILE=gitops/app/kustomization.yml

if [ -f $FILE ]; then
  echo "file already exists"
  rm $FILE
fi

cd gitops/app
ytt version
cp kustomization.tmpl temp.yml
ytt -f temp.yml -f locks > kustomization.yml 
rm temp.yml
git config --global user.name "Councourse CI"
git config --global user.email "none@none.com"
git add -A
git commit -m "update by ci" || true