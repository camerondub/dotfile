alias jsbs=' \
    npm init -y && \
    cp ~/.config/cw/dotfile/js/.eslint.json .eslintrc.json && \
    cp ~/.config/cw/dotfile/js/.jshint.json .jshintrc && \
    npm install prettier eslint typescript --save-dev && \
    npm install eslint-config-prettier jshint --save-dev && \
    npm install eslint-plugin-jest --save-dev'
