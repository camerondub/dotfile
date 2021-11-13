alias jsbs=' \
    npm init -y && \
    cp ~/.config/reosource/dotfile/javascript/.eslint.json .eslintrc.json && \
    cp ~/.config/reosource/dotfile/javascript/.jshint.json .jshintrc && \
    npm install prettier eslint typescript && \
    npm install eslint-config-prettier jshint'
