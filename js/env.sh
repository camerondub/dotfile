alias jsbs=' \
    npm init -y && \
    cp ~/.config/cw/dotfile/js/.eslint.json .eslintrc.json && \
    cp ~/.config/cw/dotfile/js/.jshint.json .jshintrc && \
    npm install prettier eslint typescript --save-dev && \
    npm install eslint-config-prettier jshint --save-dev && \
    npm install eslint-plugin-jest --save-dev'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
