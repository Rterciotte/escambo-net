require 'rails_helper'

feature 'employee buys a product' do
    scenario 'successfully' do
        buyer  = User.create!(full_name: 'Fulano Sicrano', social_name: 'Fulano', birth_date: '01/01/1983', occupation: 'Vendedor', 
                              department: 'Vendas', company_name: 'Campus Code', email: 'fulano@email.com', password: '12345678')

        seller  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', birth_date: '01/01/1983', occupation: 'Vendedor', 
                               department: 'Vendas', company_name: 'Campus Code', email: 'rogerio@email.com', password: '12345678')

        ad = Ad.create!(name: 'Guitarra', category: 'Instrumento Musical', description: 'Guitarra Les Paul bem conservada', 
                        photo: 'Guitarra.jpg', price: '1000', quantity: '1', status: 0, user: seller)
                                                    
        visit root_path
        click_on 'Login'
        fill_in 'Email', with: 'fulano@email.com'
        fill_in 'Senha', with: '12345678'
        click_on 'Log in'
        click_on 'Anúncios'
        fill_in 'Busca de anúncio', with: 'Guitarra'
        click_on 'Buscar'
        click_on 'Guitarra'

        click_on 'Comprar'
        ad.reload

        expect(ad.status).to eq 'on_hold'
    end
end