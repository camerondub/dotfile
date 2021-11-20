alias jsbs=' \
    npm init -y && \
    cp ~/.config/cw/dotfile/javascript/.eslint.json .eslintrc.json && \
    cp ~/.config/cw/dotfile/javascript/.jshint.json .jshintrc && \
    npm install prettier eslint typescript && \
    npm install eslint-config-prettier jshint'
