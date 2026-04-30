const express = require("express");

const app=express
app.use(express.json());

app.post("/calcular", (req, res) => {
    const formula = req.body.formula;
    const resultado = eval(formula);
    res.json({ resultado });
});

const path = require("path");
const fs = require("fs");

app.get('/archivo', (req, res) => {
    const nombre = req.query.nombre;
    const ruta = path.join('/archivos', nombre);
    res.sendFile(ruta);
});

app.listen(3000, () => {
    console.log("Servidor escuchando en el puerto 3000");
});