const axios = require('axios')
const { exec } = require("child_process");

axios.get('https://api.github.com/users/saracalihan/repos')
  .then(res => res.data)
  .then(data => data.map(r => `${r.html_url}.git`))
  .then(r => {
    r.forEach(repo => {
      exec(`cd /home/saracalihan/Desktop/projects  && git clone ${repo}`, (err, stdout, stderr) => {
        stdout ? console.log('stdout: ' + stdout) : null
        stderr ? console.log('stderr: ' + stderr) : null
        err ? console.log('err' + err) : null
      })
    });
  })
