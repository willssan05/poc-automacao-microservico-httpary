# modulo responsável por passar o cabeçalho da requisição e a url que iremos acessar.
module Login
    include HTTParty
    base_uri 'https://api-de-tarefas.herokuapp.com'
    format :json
    headers Accept: 'application/vnd.tasksmanager.v2',
                    'Content-Type': 'application/json'
end