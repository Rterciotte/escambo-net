require 'rails_helper'

feature 'employee manages a sale' do
    scenario 'accepting the sale' do
        seller  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', birth_date: '01/01/1983', occupation: 'Vendedor', 
                               department: 'Vendas', company_name: 'Campus Code', email: 'rogerio@email.com', password: '12345678')

        ad = Ad.create!(name: 'Guitarra', category: 'Instrumento Musical', description: 'Guitarra Les Paul bem conservada', 
                        photo: 'Guitarra.jpg', price: '1000', quantity: '1', status: 1, user: seller)
                                                    
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'rogerio@email.com'
        fill_in 'Senha', with: '12345678'
        click_on 'Log in'
        click_on 'Anúncios'
        click_on 'Guitarra'
        click_on 'Confirmar venda'
        ad.reload
        expect(ad.status).to eq 'finished'
    end
    scenario 'cancels sale' do
        seller  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', birth_date: '01/01/1983', occupation: 'Vendedor', 
                               department: 'Vendas', company_name: 'Campus Code', email: 'rogerio@email.com', password: '12345678')

        ad = Ad.create!(name: 'Guitarra', category: 'Instrumento Musical', description: 'Guitarra Les Paul bem conservada', 
                        photo: 'Guitarra.jpg', price: '1000', quantity: '1', status: 1, user: seller)
                                                    
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'rogerio@email.com'
        fill_in 'Senha', with: '12345678'
        click_on 'Log in'
        click_on 'Anúncios'
        click_on 'Guitarra'
        click_on 'Cancelar venda'
        ad.reload
        expect(ad.status).to eq 'active'
    end
end