# jupyterlab-ubuntu-local
Toby's JupyterLab deployment designed for use on a non-web facing Ubuntu instance.

# Clone This Repo
```
# If you don't need write permissions to this repo
git clone https://github.com/tobkin/jupyterlab-ubuntu-local.git

# Or, if you're using ssh
git clone git@github.com:tobkin/jupyterlab-ubuntu-local.git
```

# One-time Setup
```
git pull # Updates this repo
chmod +x *.sh
./symlink-jupyterlab.sh
```

# Running JupyterLab
  Set your directory to your jupyter notebook, and run ``jupyterlab``.

# Removing JupyterLab
```
  rm ~/bin/jupyterlab
```
