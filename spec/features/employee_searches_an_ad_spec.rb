require 'rails_helper'

feature 'employee seaches an ad' do
    scenario 'and find exact match' do
        user  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', birth_date: '01/01/1983', occupation: 'Vendedor', 
                             department: 'Vendas', company_name: 'Campus Code', email: 'rogerio@email.com', password: '12345678')

        another_user  = User.create!(full_name: 'Fulano Sicrano', social_name: 'Fulano', birth_date: '01/01/1983', occupation: 'Vendedor', 
                            department: 'Vendas', company_name: 'Campus Code', email: 'fulano@email.com', password: '12345678')

        ad = Ad.create!(name: 'Guitarra', category: 'Instrumento Musical', description: 'Guitarra Les Paul bem conservada', 
                        photo: 'Guitarra.jpg', price: '1000', quantity: '1', status: 0, user: another_user)

        another_ad = Ad.create!(name: 'Playstation 4', category: 'Consoles', description: 'Playstation 4 em ótimo estado', 
                                photo: 'ps4.jpg', price: '1000', quantity: '1', status: 0, user: another_user)                                            
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'rogerio@email.com'
        fill_in 'Senha', with: '12345678'
        click_on 'Log in'
        click_on 'Anúncios'
        fill_in 'Busca de anúncio', with: 'Guitarra'
        click_on 'Buscar'

        expect(page).to have_content('Guitarra')
        expect(page).not_to have_content('Playstation 4')
        click_on 'Guitarra'
        expect(page).to have_content(ad.name)
        expect(page).to have_content(ad.category)
        expect(page).to have_content(ad.description)
        expect(page).to have_content(ad.photo)
        expect(page).to have_content(ad.price)
        expect(page).to have_content(ad.quantity)
    end
    scenario 'and finds nothing' do
        user  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', birth_date: '01/01/1983', occupation: 'Vendedor', 
                             department: 'Vendas', company_name: 'Campus Code', email: 'rogerio@email.com', password: '12345678')

        another_user  = User.create!(full_name: 'Fulano Sicrano', social_name: 'Fulano', birth_date: '01/01/1983', occupation: 'Vendedor', 
                                     department: 'Vendas', company_name: 'Campus Code', email: 'fulano@email.com', password: '12345678')

        ad = Ad.create!(name: 'Guitarra', category: 'Instrumento Musical', description: 'Guitarra Les Paul bem conservada', 
                        photo: 'Guitarra.jpg', price: '1000', quantity: '1', status: 0, user: another_user)

        another_ad = Ad.create!(name: 'Playstation 4', category: 'Consoles', description: 'Playstation 4 em ótimo estado', 
                                photo: 'ps4.jpg', price: '1000', quantity: '1', status: 0, user: another_user)
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'rogerio@email.com'
        fill_in 'Senha', with: '12345678'
        click_on 'Log in'
        click_on 'Anúncios'
        fill_in 'Busca de anúncio', with: 'Senhor dos Anéis'
        click_on 'Buscar'

        expect(page).not_to have_content('Guitarra')
        expect(page).not_to have_content('Playstation 4')
    end

    scenario 'finds by partial name' do
        user  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', birth_date: '01/01/1983', occupation: 'Vendedor', 
                             department: 'Vendas', company_name: 'Campus Code', email: 'rogerio@email.com', password: '12345678')
                                   
        another_user  = User.create!(full_name: 'Fulano Sicrano', social_name: 'Fulano', birth_date: '01/01/1983', occupation: 'Vendedor', 
                                    department: 'Vendas', company_name: 'Campus Code', email: 'fulano@email.com', password: '12345678')                                   
        ad = Ad.create!(name: 'Guitarra', category: 'Instrumento Musical', description: 'Guitarra Les Paul bem conservada', 
                        photo: 'Guitarra.jpg', price: '1000', quantity: '1', status: 0, user: another_user)
        another_ad = Ad.create!(name: 'Playstation 4', category: 'Consoles', description: 'Playstation 4 em ótimo estado', 
                                photo: 'ps4.jpg', price: '1000', quantity: '1', status: 0, user: another_user)
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'rogerio@email.com'
        fill_in 'Senha', with: '12345678'
        click_on 'Log in'
        click_on 'Anúncios'
        fill_in 'Busca de anúncio', with: 'Gui'
        click_on 'Buscar'

        expect(page).to have_content('Guitarra')
        expect(page).not_to have_content('Playstation 4')
    end

    scenario 'finds only ads made by employees of same company' do

        user  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', birth_date: '01/01/1983', occupation: 'Vendedor', 
                            department: 'Vendas', company_name: 'Campus Code', email: 'rogerio@email.com', password: '12345678')

        another_user  = User.create!(full_name: 'Fulano Sicrano', social_name: 'Fulano', birth_date: '01/01/1983', occupation: 'Vendedor', 
                                    department: 'Vendas', company_name: 'Fulano Inc.', email: 'fulano@email.com', password: '12345678')

        ad = Ad.create!(name: 'Guitarra Gibson', category: 'Instrumento Musical', description: 'Guitarra Gibson bem conservada', 
                        photo: 'Guitarra.jpg', price: '1000', quantity: '1', status: 0, user: user)

        another_ad = Ad.create!(name: 'Guitarra Les Paul', category: 'Instrumento Musical', description: 'Guitarra Les Paul bem conservada', 
                        photo: 'Guitarra2.jpg', price: '1000', quantity: '1', status: 0, user: another_user)
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'rogerio@email.com'
        fill_in 'Senha', with: '12345678'
        click_on 'Log in'
        click_on 'Anúncios'
        fill_in 'Busca de anúncio', with: 'Gui'
        click_on 'Buscar'

        expect(page).to have_content('Guitarra Gibson')
        expect(page).not_to have_content('Guitarra Les Paul')
    end
end