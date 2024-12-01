const mongoose = require('mongoose');

const ExameSchema = new mongoose.Schema({
  nome: {
    type: String,
    required: true,
  },
  data: {
    type: Date, // Define o campo como tipo Date
    required: true,
  },
  descricao: {
    type: String,
    required: true,
  },
});

module.exports = mongoose.model('Exame', ExameSchema);



