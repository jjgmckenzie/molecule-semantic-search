# Contributing to Molecule Semantic Search Repository

## Setup `git`
If you have already setup your git identity, then you can skip this.

Run the following commands to configure your identity. Replace the username and email with your own.
```
git config --global user.name "firstname lastname"
git config --global user.email "youremail@domain.com"
```

## Setup SSH Key For Your GitHub Account on Ubuntu Linux

1. **Open Terminal**
2. **Generate SSH Key**: Generate a new SSH key by running the following command. Replace `your_email@example.com` with your GitHub email.
    ```bash
    EMAIL="your_email@example.com"
    ssh-keygen -t rsa -b 4096 -C $EMAIL
    ```
3. **Save SSH Key**: When prompted to enter a file to save the key, press Enter to accept the default file location.
4. **Add SSH Key to SSH-Agent**: Start the SSH agent and add your key to it.
    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ```
5. **Copy SSH Key to Clipboard**: Install `xclip` if it's not already installed, and copy the public SSH key to your clipboard.
    ```bash
    sudo apt-get install xclip
    xclip -sel clip < ~/.ssh/id_rsa.pub
    ```
6. **Add SSH Key to GitHub Account**: 
    - Go to GitHub and log into your account.
    - Click on your profile picture -> Settings -> SSH and GPG keys.
    - Click on the "New SSH key" button and paste your copied public SSH key into the "Key" field.

## Make Changes to the `main` Branch via Pull Requests from a Fork

### Why Use Pull Requests?
The `main` branch in the "molecule-semantic-search" repository is protected to maintain the integrity of the code. Direct pushes to this branch are restricted. All changes must be submitted via pull requests to ensure code review and quality control. 

### Merging Strategy
The repository uses a "Squash and Merge" strategy to keep the commit history clean. This strategy combines all the commits from a feature branch into a single commit, which is then added to the main branch.

### Approvals
At least one approver is required to review and approve a pull request before it can be merged into the main branch.

To request an approval, tag Toby and James in the [LinkedIn Group Chat](https://www.linkedin.com/messaging/thread/2-MjJjYTA2NjMtZDYyYS00Y2RhLWE3YzYtNjAwNjQyNzBlZWM4XzAxMw==/).

### How to Make a Pull Request from a Fork

1. **Fork the Repository**: Navigate to the "molecule-semantic-search" GitHub page and click on the "Fork" button at the top-right corner.
2. **Clone Your Fork**: You only need to do this once. Replace `tobkin` with your GitHub username.
    ```bash
    YOUR_USERNAME="tobkin"
    mkdir -p ~/src/valuestreamai
    cd ~/src/valuestreamai
    git clone git@github.com:$YOUR_USERNAME/molecule-semantic-search.git
    ```
    
3. **Add Remote Upstream**: Add the original repository as a remote called "upstream".
    ```bash
    cd ~/src/valuestreamai/molecule-semantic-search
    git remote add upstream git@github.com:valuestreamai/molecule-semantic-search.git
    ```
4. **Fetch Latest Changes**: Sync your fork with the original repository.
    ```bash
    git checkout main
    git fetch upstream
    git merge upstream/main
    ```
5. **Create a New Feature Branch**: Create and check out a new branch named after your associated Linear Issue, e.g., VSA-16.
    ```bash
    BRANCH="VSA-16"
    git checkout -b $BRANCH
    ```
6. **Make Changes**: Edit files as needed for your feature or fix.
7. **Add and Commit Changes**: 
    ```bash
    git add .
    git commit -m "Description of changes"
    ```
8. **Push Changes to Your Fork**: 
    ```bash
    git push origin $BRANCH
    ```
9. **Create a Pull Request**: 
    - Navigate to your fork on GitHub.
    - Click on "Pull Requests" -> "New Pull Request."
    - Choose the base and compare branches, then click "Create Pull Request."
10. **Request Review**: Github will enforce a reviewer requirement to merge your pull request. Tag Toby and James in the [LinkedIn Group Chat](https://www.linkedin.com/messaging/thread/2-MjJjYTA2NjMtZDYyYS00Y2RhLWE3YzYtNjAwNjQyNzBlZWM4XzAxMw==/) to request code review.

11. **Squash and Merge**: Once your pull request is approved, perform a "Squash and Merge" to combine your changes into a single commit before adding them to the main branch.

By following these instructions, you're adhering to the repository's policy of using pull requests to make all changes, ensuring code quality and maintainability.

