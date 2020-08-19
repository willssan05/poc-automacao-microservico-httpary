describe 'Alterar' do
    def login(field_email, field_password)
        @body = {
            session: {
                email: field_email,
                password: field_password
            }
        }.to_json
        @login = Login.post('/sessions', body:@body)
    end
    context 'Dados da' do

        before { login('brunobatista66@gmail.com', '123456') }
       #utilizado quando se precisar alterar todos os dados da API
        it 'tarefa usando put' do

            @header = {
                'Content-Type': 'application/json',
                 Accept: 'application/vnd.tasksmanager.v2',
                 Authorization: @login.parsed_response['data']['attributes']['auth-token']
            }
            @body_put = {
                    "task": {
                    "id": "465",
                    "title": "Tarefa 465 alterada",
                    "description": "Descrição da tarefa 465 alterada.",
                    "deadline": "2020-08-18 13:280:00",
                    "done": true
                }
            }.to_json

            @requisicao_put = Login.put('/tasks/465', headers: @header, body: @body_put)
            puts @requisicao_put
        end
        # utilizando quando queremos alterar apenas alguns dados da API
        it 'tarefa usando path' do
            @header = {
                'Content-Type': 'application/json',
                 Accept: 'application/vnd.tasksmanager.v2',
                 Authorization: @login.parsed_response['data']['attributes']['auth-token']
            }
            @body_patch = {
                    "task": {
                    "id": "465",
                    "title": "Tarefa 465 alterada usando o patch",
                    "description": "Descrição da tarefa 465 alterada com o patch."
                }
            }.to_json

            @requisicao_patch = Login.patch('/tasks/465', headers: @header, body: @body_patch)
            puts @requisicao_patch
        end
    end  
end