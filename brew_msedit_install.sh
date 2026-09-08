# 1. Install system prerequisites (requires sudo once for apt)
sudo apt-get update && sudo apt-get install -y build-essential procps curl file git

# 2. Download and run the official Homebrew installer script (run as your standard user)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Add Homebrew to your shell environment (for standard bash shells)
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew --version

# 4. Install msedit using Homebrew
brew install msedit

# Launch the editor using its binary name (edit):
edit --version

brew --version
brew --version

edit --version
edit --version

