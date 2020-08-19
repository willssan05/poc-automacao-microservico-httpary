describe 'Cadastrar' do
    # método responsavel por fazer o login, informando um usuário e senha fixos.
    def login(field_email, field_password)
        @body = {
            session: {
                email: field_email,
                password: field_password
            }
        }.to_json
        @login = Login.post('/sessions', body:@body)
    end
    context 'tarefa' do
        # antes de executar os testes informar o usuario e senha
        before { login('brunobatista66@gmail.com', '123456') }
        it 'com sucesso' do
            # configuração para passar o token do usuário para cadastrar uma tarefa
            @header = {
                'Content-Type': 'application/json',
                 Accept: 'application/vnd.tasksmanager.v2',
                 Authorization: @login.parsed_response['data']['attributes']['auth-token']
            }
            # corpo que sera enviado para a requisição
            @body = {
                task: {
                    title: 'Criei Tarefa 122',
                    description: 'Descrição criei tarefa 122',
                    deadline: '2020-08-18 11:14:00',
                    done: true
                }
            }.to_json
            # variavel @tarefas esta recebendo o post com os parametros da requisição
            @tarefa = Cadastrar.post('/tasks', body: @body, headers: @header)
            # retorna o id da tarefa cadastrada.
            puts @tarefa.parsed_response['data']['id']
            expect(@tarefa.parsed_response['data']['attributes']['title']).to eq 'Criei Tarefa 122'
        end
    end
end