express = require 'express'
fs = require 'fs'
clc = require 'cli-color'

# Define port
port = 8080

# Define log colors
log = console.log
orange = clc.xterm 202
green = clc.green
lime = clc.xterm 190

# Initialize app
app = express()

app.get '/api/toast/random', (req, res) ->
  log lime 'GET /api/random'
  res.setHeader 'Content-type', 'application/json;charset=utf-8'
  res.json { title: 'Express with Coffee' }

app.get '/api/toast/random_eng', (req, res) ->
  log lime 'GET /api/random'
  res.setHeader 'Content-type', 'application/json;charset=utf-8'
  # TODO add google translate api to translate toasts on the fly
  res.json { toast: 'Toast under construction' }


app.listen port
console.log green "Caffeine in dock #{port}"