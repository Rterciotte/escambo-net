require 'rails_helper'
feature 'Employee publishes an ad' do
    scenario 'successfully' do
        visit root_path
        login_as :user
        click_on 'Criar Anúncio'
        fill_in 'Nome', with: 'Guitarra'
        fill_in 'Categoria', with: 'Instrumento Musical'
        fill_in 'Fotos', with: 'Guitarra.jpg'
        fill_in 'Descrição', with: 'Guitarra Gibson em ótimo estado'
        fill_in 'Valor de venda', with: '1.000'
        click_on 'Anunciar'
    end
end