# Molecule Semantic Search Repository
This is a monorepo containing the hackathon development environment setup, documentation, code, pitch, and all relevant content for the Molecule Semantic Search project, to be demonstrated at the Samsung NEXT hackathon.

TODO: Further information, documentation, and explanation of project.

## Contributing & Development Environment Setup
1. Read [CONTRIBUTING.md](CONTRIBUTING.md)
1. As your first pull request, both to validate you have setup your development environment correctly, as well as to make further pull requests, add your name to the bottom of [CONTRIBUTOR-AGREEMENT.md](CONTRIBUTOR-AGREEMENT.md)

## Project Directory Structure
```
molecule-semantic-search/       
├── linux-config/               # Contains all linux configuration scripts for a uniform development environment
│ ├── install-all.sh            # Script which runs all other scripts in this directory
│ └── ...
├── jupyterlab/                 # Jupyterlab configuration & setup scripts
│ ├── symlink-jupyterlab.sh     # Installs 'jupyterlab' which runs jupyter lab in open directory
│ └── ...
├── jupyter-notebooks/          # Contains all Jupyter Notebooks for the project 
│ ├── templates/                # Contains boilerplate and jupyter notebook templates
│ └── ...
├── CONTRIBUTING.md             # Instructions for contributing to the project and setting up dev environment
├── CONTRIBUTOR-AGREEMENT.md    # Agreement required for contributing to the project 
├── README.md
└── ...
```
