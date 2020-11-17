ls -la
cp -r source-code-gitops/. gitops

$FILE=gitops/app/kustomization.yml

if [ -f $FILE ]; then
  echo "file already exists"
  rm $FILE
fi

cd gitops/app
ytt -f kustomization.yml -f locks 

# git config --global user.name "YOUR NAME"
#git config --global user.email "none@none.com"
#git add .
#git commit -m "update by ci"