const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
  const token = req.header('Authorization');

  if (!token) {
    return res.status(401).json({ message: "Sem token, acesso negado" });
  }

  try {
    // Remover o prefixo 'Bearer ' do token
    const jwtToken = token.split(' ')[1];
    const decoded = jwt.verify(jwtToken, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (error) {
    res.status(401).json({ message: "Token inválido" });
  }
};



