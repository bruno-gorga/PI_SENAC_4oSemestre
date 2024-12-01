const Exame = require('../models/Exame.js');

// Criar um novo exame
// Adicionar código aqui
exports.createExame = async (req, res) => {
  const { nome, data, descricao } = req.body;

  try {
    console.log("Recebendo requisição:", req.body);

    if (!nome || !data || !descricao) {
      console.log("Erro: Campos obrigatórios ausentes.");
      return res.status(400).json({ message: "Todos os campos são obrigatórios" });
    }

    const parsedDate = new Date(data);
    if (isNaN(parsedDate)) {
      console.log("Erro: Formato de data inválido.");
      return res.status(400).json({ message: "Formato de data inválido. Use YYYY-MM-DD" });
    }

    const novoExame = new Exame({ nome, data: parsedDate, descricao });
    const savedExame = await novoExame.save();
    console.log("Exame salvo com sucesso:", savedExame);

    res.status(201).json(savedExame);
  } catch (error) {
    console.error("Erro ao criar exame:", error.message);
    res.status(500).json({ message: "Erro ao criar exame", error: error.message });
  }
};




// Adicionar código aqui
// Obter todos os exames
exports.getExames = async (req, res) => {
  try {
    const exames = await Exame.find();
    res.status(200).json(exames);
  } catch (error) {
    res.status(500).json({ message: "Erro ao buscar exames", error: error.message });
  }
};

// Atualizar um exame
exports.updateExame = async (req, res) => {
  const { id } = req.params;
  const { nome, data, descricao } = req.body;

  try {
    let parsedDate = null;
    if (data) {
      parsedDate = new Date(data);
      if (isNaN(parsedDate)) {
        return res.status(400).json({ message: "Formato de data inválido. Use YYYY-MM-DD" });
      }
    }

    const exameAtualizado = await Exame.findByIdAndUpdate(
      id,
      { nome, data: parsedDate, descricao },
      { new: true }
    );

    if (!exameAtualizado) {
      return res.status(404).json({ message: "Exame não encontrado" });
    }

    res.status(200).json(exameAtualizado);
  } catch (error) {
    res.status(500).json({ message: "Erro ao atualizar exame", error: error.message });
  }
};

// Excluir um exame
exports.deleteExame = async (req, res) => {
  const { id } = req.params;

  try {
    const exameExcluido = await Exame.findByIdAndDelete(id);
    if (!exameExcluido) {
      return res.status(404).json({ message: "Exame não encontrado" });
    }

    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: "Erro ao excluir exame", error: error.message });
  }
};



