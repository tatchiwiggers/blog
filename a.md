# intro
hospedagem é onde colocamos nosso aplicativo web online
o upload de imagens permite que o usuário do seu aplicativo faça upload de imagens

# ENVIRONMENT
vamos falar de environments

# DEVELOPMENT
Até agora temos trabalhado em modo de desenvolvimento
Temos nosso banco de dados local, nosso servidor local em execução,
e no navegador temos nosso localhost

# PRODUCTION
Até agora temos trabalhado em modo de desenvolvimento
Temos nosso banco de dados local, nosso servidor local em
execução e, no navegador, temos nosso host local

# PRODUCTION 2
então teremos nosso banco de dados e nosso servidor de trilhos em algum lugar
online -> e para isso precisaremos de um serviço

# PRODUCTION 3
e o serviço que vamos usar é HEROKU -
heroku envolverá nosso banco de dados e nosso servidor
e vai hospedar nosso aplicativo web online para que
outras pessoas possam visitar nosso aplicativo

# NO MORE SQLITE. SAY HELLO TO
ENTÃO chega de sqlite, ele não funciona bem com heroku e não é nada robusto. 
Ele consiste em um arquivo somente e nos serviu bem quando estávamos trabalhando
com pequenas tarefas quando estávamos aprendendo Active Record. 
Agora somos adultos !! Então a partir de hoje usar o POSTGRESQL 
- um banco de dados robusto, muito mais avançado além de todas
as vantagens que ele nos traz ele também é open source.

# INSTALL ON OS X
O postgresql já deve estar isntalado na maquina de vocês
desde a configuração do primeiro dia. Para verificar, vocês
podem rodar no terminal... caso não esteja sigam os passos 
da instalação no slide, se tiverem algum problema, so abrir um ticket.

# NEW RAILS APPLICATION
vou fazer todo o processo de rails new com vocês hoje principalmente
porque inclui o set up de JS no frontend.

hoje vocês vão continuar o watch list the ontem, mas nao sei se vocês
se lembram vcs usaram esse tag pra gerar o rails new de vcs com postgresql

# Look at your Gemfile -read
pg postgres gem vai estar la

# QUICK WAGON SETUP - read
do all of the set up together

# SCAFFOLD A POST MODEL
explain why we need to comment out jbuilder
***Then generate a scaffold of Article.***
CHANGE EVERYTHING TO ROOT
root to: 'articles#index'
change form, show and the redirect in the destroy controller

# HEROKU

# PRODUCTION
como eu disse antes, o heroku vai lidar com nosso servidor 
Rails e nosso banco de dados na nuvem

# SIGN UP
if you havent already, sign up

# HELP - read

# LOGIN
você pode fazer o login a partir do terminal ou simplesmente executar o heroku
para fazer o login atraves do browser e ele abrirá o navegador para você vincular sua conta

# CREATE AN HEROKU APP - read
para fazer um um plano gratuito, a única região que você pode escolher é eu

# WHAT HAPPENED?
explain git remote -v

GIT - HEROKU - ORIGEM - HEROKU
então temos um novo remote: localmente em nosso laptop, temos nosso repositório onde temos
um banco de dados local e um servidor local. Então a partir de aogra, 
teremos repositórios no heroku e no github - a coisa boa é que o heroku é integrado, ele usa git -
então o que vamos fazer é apenas mudar so comandos do nosso origin git para o heroku.

# LET'S DEPLOY - read
sempre que vcs forem deployar, vamos usar e abuasr desse comando que vai nos
deixar a par de tudo que está acontecendo com nosso processo:
heroku logs --tail

# DONE! - LETS DEPLOY ANTES DE MIGRATE!!
Explain the syntax
EXPLAIN ABOUT HEROKU RUN RAILS DB MIGRATE

# IMAGE UPLOAD
em algum ponto vocês vão querer que o usuário consiga fazer upload de suas
imagens em seu aplicativo - assim como o airbnb
por exemplo, onde o usuário, o host carrega fotos de seus apartamentos... e
assim por diante ... mas uma vez pushed to herokudo seu localhost, 
essas imagens deixarão de existir - heroku ele limpa tudo ... então
se você salvar essas fotos dentro de sua pasta no seu localhost, ele apagará tudo
- e isso acontece porque os dYnos do herokus são efêmeros, ou seja, eles são temporários... 

# UPLOADING / STORING TO HEROKU? - read
***dynos***
O que são DYNOS? Todos os aplicativos Heroku são executados em uma coleção
de contêineres Linux leves que são chamados de dynos, e esses dynos são temporários.
Mas se quiserem saber mais,deem uma olhada nesse link aqui do slide.
***dynos***

E - além disso, se você tiver milhares de usuários você tem milhares de fotos
dentro da pasta de ativos e seu aplicativo vai tirar para carregar para sempre - e não queremos isso.

# We need an external service

# CLOUDINARY

# CREATE A CLOUDINARY ACCOUNT
go on my account and show them

# WHERE DO WE PUT OUR SECRET KEYS? - read
explain what each line of the code does

# CLOUDINARY & ENVIRONMENT - read
always remember to restart de server after any config changes

# LET'S UPLOAD TWO PICTURES - read
upload in my console
show them in localhost

# LET'S DISPLAY THEM
<!-- app/views/articles/index.html.erb -->

# TRANSFORMATION REFERENCE - read explain

# You can upload also other file formats (PDFs, etc.)

# ACTIVE STORAGE
Até agora carregamos para duas fotos manualmente, mas o que o que queremos 
é que um usuário use um formulário para fazer upload de uma imagem, 
atravaes das imagens salvas em seu HD.
e para isso vamos usar o Active Storage gem o AS - costumava ser
uma gem, mas agora está incluída no rails v 5.2 e acima, razão pela qual
temos que pular o AS quando fizemos rails new na primeira semana de rails....
***ActiveStorage***
Então o que ele faz é conectar magicamente nossas imagens no CL 
aos modelos que temos em nosso aplicativo

# SETUP
Ele cria uma migração:
Ele cria duas tabelas no banco de dados para lidar com as associações
entre nossas imagens carregadas no Cloudinary e qualquer modelo em nosso aplicativo.

As 2 tabelas: active storega attachements
and active storage blobs - os activestorage blobs são os arquivos que fazemos upload
e os actiVe storage attachments é o join table entre nosso modelo e esses arquivos (blobs)
faz referência a essas 2 tabelas.

RUN RAILS RB MIGRATE

# CONFIG - read

# MODEL - read show on code

# VIEW & CONTROLLER

# DISPLAYING THE IMAGE
<!-- app/views/articles/show.html.erb -->

# USAGE IN BACKGROUND-IMAGE
if you wanna use an image as background...

# SEED - show them my seeds
Quando vocês quiserem fazer seeds, vocês podem anexar um arquivo do HD ou baixado de um URL enviado pelo usuário. Para fazer isso, basta fornece essa informação contendo pelo menos um objeto IO aberto e um nome de arquivo:

https://guides.rubyonrails.org/active_storage_overview.html#has-one-attached

# HELPFUL ACTIVE STORAGE METHODS
show them in the view HOW to do a conditional for photo.attached?
or not.

SHOW PAGE!!!!

<%# as an image %>

<% if @article.photo.attached? %>
  <%# @article.photo.purge %>
  <%= cl_image_tag @article.photo.key, height: 250, width: 260, crop: :fill %>
<% else %>
<%# raise %>
  <h5>You have not added any pics to your article :(</h5>
<% end %>

# MULTIPLE IMAGES - from here on read everything

# VIEW & CONTROLLER

# BEHIND THE SCENES (DB SCHEMA)
https://guiarails.com.br/association_basics.html#associacoes-polimorficas

nos temos duas tabelas extras vindas do Actice Storage - quando rodamos o installer ele gerou uma migração e apos rodar essa migração ele gerou essas tabelas, se lembram?
Aqui nos temos uma associação polimorfica: Nas associações polimórficas, um modelo pode pertencer a mais de uma tabela, em uma única associação. Por exemplo, você pode ter um model de articles que pertença a uma tabela Active Storage attachements. Atraves do record id identificamos o modelo a que ele se refere, ou podemos ter nosso modelo User, por exemplo, tambem sendo referido aqui atravaes desse record_type. Os blobs guardam os arquivos e suas informações e como join table temos os attachements que guardam todas as relações entre nosso cloudinary e o modelo.

# PRODUCTION
Importante lemnrar de adicionar a configuração CL correta para produção também. Para subirmos
noss app pro Heroku.

# GOING FURTHER - read