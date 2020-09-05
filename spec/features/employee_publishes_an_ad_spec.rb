require 'rails_helper'
feature 'Employee publishes an ad' do
    scenario 'successfully' do
        user  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', 
                            birth_date: '01/01/1983', occupation: 'Vendedor', department: 'Vendas', company_name: 'Campus Code',
                            email: 'rogerio@email.com', password: '12345678')
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'rogerio@email.com'
        fill_in 'Senha', with: '12345678'
        click_on 'Log in'

        expect(current_path).to eq root_path
        click_on 'Criar Anúncio'
        fill_in 'Nome', with: 'Guitarra'
        fill_in 'Categoria', with: 'Instrumento Musical'
        fill_in 'Foto', with: 'Guitarra.jpg'
        fill_in 'Descrição', with: 'Guitarra Gibson em ótimo estado'
        fill_in 'Preço', with: '1.000'
        fill_in 'Quantidade', with: '1'
        click_on 'Anunciar'
    end
end