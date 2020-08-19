# modulo responsavel para cadastrar onde passamos a url e o formato json
module Cadastrar
    include HTTParty
    base_uri 'https://api-de-tarefas.herokuapp.com'
    format :json    
end