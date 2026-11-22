const {handleApi} = require('../server');

module.exports = (req, res) => {
  const url = new URL(req.url || '/', 'https://promptshield.local');
  return handleApi(req, res, url.pathname);
};
