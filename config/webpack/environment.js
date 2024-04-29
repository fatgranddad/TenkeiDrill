const { environment } = require('@rails/webpacker')

// エントリポイントを追加
environment.config.set('entry', {
  application: './app/javascript/packs/application.js'
});

module.exports = environment