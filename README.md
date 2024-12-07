# PI_SENAC_4oSemestre
Repositório para mapear o desenvolvimento do Projeto Integrador do Grupo 32 do curso de Análise e Desenvolvimento de Sistemas do Senac, 4° Semestre.

# 1 - Escopo inicial do projeto e divisão de tarefas
O escopo do projeto é um aplicativo móvel que possui como foco a **saúde individual**. Nossa proposta de aplicativo é **um aplicativo de repositório de exames e guias médicas**, no qual o usuário-persona poderá fazer o upload e consultar seus exames e guias apenas pelo celular.

## As partes da primeira entrega foram divididas da seguinte forma:

- **Kevin Baltar**:
Visão geral da solução proposta: Contextualização e motivação. Apresentar o cenário e segmento de mercado no qual o produto se insere, no que busca melhorar e/ou aperfeiçoar - apresentar de maneira clara qual o objetivo que o produto deve alcançar.

- **Thiago Aleixo**
Ciclo de vida de Desenvolvimento: Apresentar e justificar um ciclo de vida de desenvolvimento, adaptando-o à solução proposta. Validar a interação e a experiência de uso a ser alcançada, descrevendo em linhas gerais o método a ser utilizado.

Os tópicos 3 e 4 descrevem que o desenvolvimento do aplicativo em HTML segue o Modelo Incremental, permitindo a entrega gradual de funcionalidades. Após o planejamento inicial e a criação de protótipos, o design da interface é validado com usuários, seguido pela implementação e testes em incrementos. A cada fase, são realizados testes de usabilidade e compatibilidade com dispositivos móveis. O lançamento é feito gradualmente, com feedback contínuo para ajustes e melhorias. O foco está em oferecer uma interface simples, intuitiva e segura, garantindo uma boa experiência ao usuário.

- **Carla Rodrigues**
Requisitos (descrição textual e classificação) / histórias de usuário: Elencar os requisitos ou as histórias do usuário referentes à solução proposta.

Aqui usamos para definir personas, suas características e necessidades. Utilizamos dois modelos demostrando a possobilidade de abranger realidades diferentes.

- **Bruno Gorga**
Planejamento (etapas, tarefas, ciclos de desenvolvimento): Descrever as etapas definidas para o desenvolvimento, tarefas e outros aspectos que envolvam o esclarecimento sobre como serão as fases de execução do projeto. Neste planejamento deve ser criado um repositório no Github (que é o presente repositório) para armazenamento e justificativa da evolução do projeto.

- **Gabriel Lira**
Arquitetura da solução de software: Apresentar um desenho no qual ilustre as partes que compõem a solução proposta, destacando as interações entre as partes.
Implementação do webservice e descrição dos serviços disponíveis: Baseado na ilustração proposta, detalhar como será desenvolvida cada parte no que diz respeito a tecnologias que serão utilizadas para o fornecimento da solução.

- **Leonardo Fróes e Tiago Carvalho: Contribuição direta para um ou mais módulos acima descritos, revisão geral dos tópicos, ajustes estruturais e proposição de novas ideias e diretrizes partir do estímulo de debate interno.**

# 2 - Planejamento (etapas de desenvolvimento)
Para a execução do projeto, foram definidas as seguintes etapas:
  - Brainstorm de ideias a respeito do escopo do projeto (público alvo, metas, dores a serem solucionadas);
  - Definição precisa de requisitos e funcionalidades a serem desenvolvidas no aplicativo;
  - Criação de histórias do usuário;
  - Criação do protótipo da aplicação (telas-modelo que serão utilizadas como template para o posterior desenvolvimento do front-end e do back-end da aplicação);
  - Discussão e testes sobre a viabilidade do projeto, considerando os requisitos;
  - Desenvolvimento do projeto no nível de código e ambiente de desenvolvimento mobile.

O presente repositório irá armazenar os logs de desenvolvimento do projeto, conforme sua evolução.

# 3 - Brainstorm de ideias a respeito do escopo do projeto

Nessa fase, os membros do grupo colocaram suas ideias para discussão e chegaram à conclusão de que, como público alvo, o melhor -- o mais abrangente -- seria que o aplicativo fosse útil para profissionais de saúde e pacientes. Anteriormente, foi colocada a ideia de ser orientado aos acompanhantes de cada usuário, porém o grupo chegou à conclusão de que, na prática, o "encaixe" de uma persona acompanhante seria praticamente a mesma da de um usuário comum. Com uma persona profissional de saúde, o grupo acredita que será possível mostrar melhor a utilidade do aplicativo para mais de um contexto.

# 4 - Definição precisa dos requisitos

A maioria dos membros do grupo é iniciante em programação, sendo assim, o grupo optou por manter as funcionalidades no nível básico, garantindo as funcionalidades do CRUD (métodos POST, GET, PUT e DELETE do protocolo HTTP), conforme requisitos de entrega, e as telas de login, cadastro e demais telas de navegação.

# 5 - Histórias de usuário

Para histórias de usuário, considerando o tempo disponível para apresentação, considerou-se apenas a história de usuário do paciente com comorbidade, conforme escopo original, e um profissional de saúde, no caso um médico que utilizaria a aplicação para armazenar dados de pacientes.

# 6 - Criação do protótipo da aplicação

Foi repensada a linguagem que seria utilizada para desenvolver a aplicação, tendo em vista o mencionado anteriormente sobre a pouca experiência da equipe com programação e técnicas de desenvolvimento mais elaboradas, que permitiriam uma aplicação mais dinâmica.

Foi escolhida a linguagem Dart para o front-end, e o framework Nodejs para o back-end. Depois de diversos testes e refatorações, o grupo chegou a um protótipo mais ou menos funcional da interface de usuário da aplicação.

## 6.1. Telas do front-end

### 6.1.1. Tela inicial

Tela que abre a sessão assim que o usuário inicializa o aplicativo. Nessa tela o usuário poderá decidir se deseja fazer o login ou cadastrar uma nova conta.

![](https://imgur.com/PKEqmVn.png)

### 6.1.2. Tela de cadastro

Caso o usuário selecione a opção Cadastrar, na tela anterior, será exibida a tela de cadastro, na qual o usuário irá digitar os dados.

![](https://imgur.com/r8yaFfj.png)

#### 6.1.2.1. Exemplo da Tela de Cadastro preenchida

Após o usuário preencher os dados e clicar em cadastrar, o aplicativo exibirá a tela inicial novamente.

![](https://imgur.com/OviaHSL.png)

### 6.1.3. Tela de Login

Caso o usuário selecione a opção "Login", na tela inicial, será exibida a Tela de Login, mostrada abaixo.

![](https://imgur.com/6Bxtiff.png)

#### 6.1.2.1. Exemplo da Tela de Login preenchida

Após o usuário preencher os dados e clicar em cadastrar, o aplicativo exibirá a tela de menu principal.

![](https://imgur.com/iwlUvme.png)

### 6.1.4. Tela de Menu Principal

Nessa tela o usuário pode acessar as principais funcionalidades: Cadastrar Exame, Consultar Exames cadastrados, Atualizar exame e Excluir exame.

![](https://imgur.com/NCPf0Ri.png)

### 6.1.5. Tela de Cadastrar Exame.

Caso clique no botão "Cadastrar Exame", o usuário será levado para essa tela.

![](https://imgur.com/0WXQDHR.png)

#### 6.1.2.1. Exemplo da Tela de Cadastro de Exame preenchida

Ao preencher os dados e clicar em "Adicionar Exame", o exame será adicionado e o usuário poderá consultá-lo na Tela de Consulta de Exames.

![](https://imgur.com/Wm9BNy4.png)

### 6.1.6. Tela de Consulta de Exames

Caso o usuário selecione a opção "Consultar Exames", será levado a essa tela onde ele poderá ver todos os exames cadastrados que possui.

![](https://imgur.com/mbHCAuS.png)


### 6.1.7. Tela de Atualizar Exames

O usuário pode clicar na opção Atualizar Exame, e ele poderá selecionar o exame que deseja atualizar.

![](https://imgur.com/aPP2MGC.png)

E, selecionando o exame, poderá alterar os dados.

![](https://imgur.com/h2Ub6sn.png)


O novo exame, com os dados alterados, poderá ser visto na tela de consulta.

![](https://imgur.com/OhDKck9.png)

### 6.1.8. Tela de Excluir Exames

Para excluir um exame, o usuário deverá selecionar a opção "Excluir Exames", e em seguida clicar na lixeira ao lado do exame que deseja excluir.

![](https://imgur.com/QYb7iSS.png)

O exame não irá mais aparecer na tela de consulta de exames.

![](https://imgur.com/FyMj90n.png)


