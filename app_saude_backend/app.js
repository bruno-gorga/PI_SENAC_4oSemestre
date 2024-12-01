const express = require('express');
const connectDB = require('./config/database.js');
const dotenv = require('dotenv');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const Usuario = require('./models/Usuario.js'); // Modelo de usuário
const exameRoutes = require('./routes/exames.js'); // Rotas de exames

dotenv.config();
connectDB();

const app = express();
app.use(express.json());

// Rota de registro de usuário
app.post('/api/register', async (req, res) => {
  const { nome, email, senha } = req.body;

  try {
    // Verificar se o usuário já existe
    const usuarioExistente = await Usuario.findOne({ email });
    if (usuarioExistente) {
      return res.status(400).json({ message: "Usuário já existe" });
    }

    // Criar novo usuário
    const novoUsuario = new Usuario({ nome, email, senha });
    await novoUsuario.save();

    res.status(201).json({ message: "Usuário registrado com sucesso" });
  } catch (error) {
    res.status(500).json({ message: "Erro ao registrar usuário", error: error.message });
  }
});

// Rota de login
app.post('/api/login', async (req, res) => {
  const { email, senha } = req.body;

  try {
    // Verificar se o usuário existe
    const usuario = await Usuario.findOne({ email });
    if (!usuario) {
      return res.status(401).json({ message: "Credenciais inválidas" });
    }

    // Verificar a senha
    const senhaValida = await bcrypt.compare(senha, usuario.senha);
    if (!senhaValida) {
      return res.status(401).json({ message: "Credenciais inválidas" });
    }

    // Gerar token JWT
    const token = jwt.sign({ id: usuario._id }, process.env.JWT_SECRET, { expiresIn: '1h' });

    // Retornar o nome do usuário e o token
    res.json({ nome: usuario.nome, token });
  } catch (error) {
    res.status(500).json({ message: "Erro ao realizar login", error: error.message });
  }
});

// Rotas protegidas de exames
app.use('/api/exames', exameRoutes);

// Iniciar o servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));



