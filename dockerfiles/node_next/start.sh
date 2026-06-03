#!/bin/bash
cd /home/eliel/frontend
npm install
npm run build   
#archivos estáticos compilados por el puerto 5173
npx serve -s dist -l 5173