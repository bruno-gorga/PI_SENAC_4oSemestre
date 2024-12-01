const express = require('express');
const router = express.Router();
const ExameController = require('../controllers/ExameController.js'); // Certifique-se de que este caminho está correto
const authMiddleware = require('../middlewares/auth.js'); // Middleware de autenticação

// Rotas de exames
router.post('/', authMiddleware, ExameController.createExame); // Criar exame
router.get('/', authMiddleware, ExameController.getExames); // Obter exames
router.put('/:id', authMiddleware, ExameController.updateExame); // Atualizar exame
router.delete('/:id', authMiddleware, ExameController.deleteExame); // Excluir exame

module.exports = router;




