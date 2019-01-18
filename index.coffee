express = require 'express'
fs = require 'fs'
clc = require 'cli-color'

# Define port
port = 8080

# Toasts array
toasts = []

# Read toasts from file
fs.readFile 'toasts.json', (err, data) ->
  if err
    throw err
  else
    toasts = JSON.parse data

# Function that returns random toast
randToast = () ->
  toasts[Math.floor(Math.random()*toasts.length)]

# Define log colors
log = console.log
orange = clc.xterm 202
green = clc.green
lime = clc.xterm 190

# Initialize app
app = express()

app.get '/api/toast/random', (req, res) ->
  res.setHeader 'Content-type', 'application/json;charset=utf-8'
  toast = randToast()
  log lime "GET #{req.url} : Toast id: #{toast.id}"
  res.json toast

app.get '/api/toast/random_eng', (req, res) ->
  log lime 'GET /api/random'
  res.setHeader 'Content-type', 'application/json;charset=utf-8'
  # TODO add google translate api to translate toasts on the fly
  res.json { toast: 'Toast under construction' }


app.listen port
console.log green "Caffeine in dock #{port}"