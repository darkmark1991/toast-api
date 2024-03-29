express = require 'express'
fs = require 'fs'
clc = require 'cli-color'
{ Translate } = require '@google-cloud/translate'

# Set up translator
translate = new Translate { projectId: 'toast-api' }

# Define port
port = 8080

# Toasts array
toasts = []

# TODO move toasts to mongodb & fetch randomly from there
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

app.get '/api/toast/ka/random/:res_type?', (req, res) ->
  toast = randToast()
  log lime "GET #{req.url} : Toast id: #{toast.id}"
  if req.params and req.params.res_type == 'text'
    res.setHeader 'Content-type', 'text/plain'
    res.send toast.toast
  else
    res.setHeader 'Content-type', 'application/json;charset=utf-8'
    res.json toast

app.get '/api/toast/en/random/:res_type?', (req, res) ->
  toast = randToast()
  log lime "GET #{req.url} : Toast id: #{toast.id}"

  # TODO once mongodb is implemented save translated toasts and serve them from db next time
  translate
    .translate toast.toast, 'en'
    .then (results) ->
      toast.language = 'English'
      toast.toast = results[0]

      if req.params and req.params.res_type == 'text'
        res.setHeader 'Content-type', 'text/plain'
        res.send toast.toast
      else
        res.setHeader 'Content-type', 'application/json;charset=utf-8'
        res.json toast

    .catch (err) ->
      log orange err
      res.json { toast: 'Couldn\'t translte' }

  # DONE add google translate api to translate toasts on the fly


app.listen port
console.log green "Caffeine in dock #{port}"