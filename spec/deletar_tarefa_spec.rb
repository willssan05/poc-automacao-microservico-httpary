describe 'Deletar' do
    def login(field_email, field_password)
        @body = {
            session: {
                email: field_email,
                password: field_password
            }
        }.to_json
        @login = Login.post('/sessions', body:@body)
    end
    context 'dados' do
        before { login('brunobatista66@gmail.com', '123456') }
        it 'tarefa' do
            @header = {
                'Content-Type': 'application/json',
                 Accept: 'application/vnd.tasksmanager.v2',
                 Authorization: @login.parsed_response['data']['attributes']['auth-token']
            }
                       
            @tarefa = Login.delete('/tasks/465', headers: @header)
            puts @tarefa
        end        
    end
end