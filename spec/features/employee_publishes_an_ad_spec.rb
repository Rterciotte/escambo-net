require 'rails_helper'
feature 'Employee publishes an ad' do
    scenario 'successfully' do
        user  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', 
                            birth_date: '01/01/1983', occupation: 'Vendedor', department: 'Vendas', company_name: 'Campus Code',
                            email: 'rogerio@email.com', password: '12345678')
        visit root_path
        login_as :user
        expect(current_path).to eq root_path
        click_on 'Criar Anúncio'
        fill_in 'Nome', with: 'Guitarra'
        fill_in 'Categoria', with: 'Instrumento Musical'
        fill_in 'Fotos', with: 'Guitarra.jpg'
        fill_in 'Descrição', with: 'Guitarra Gibson em ótimo estado'
        fill_in 'Valor de venda', with: '1.000'
        click_on 'Anunciar'
    end
end