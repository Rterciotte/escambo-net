require 'rails_helper'

feature 'employee tries to login' do
  scenario 'successfully' do
    user  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', 
                            birth_date: '01/01/1983', occupation: 'Vendedor', department: 'Vendas', company_name: 'Campus Code',
                            email: 'rogerio@email.com', password: '12345678')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'rogerio@email.com'
    fill_in 'Senha', with: '12345678'
    
    click_on 'Log in'
    expect(page).to have_content('Editar perfil')
  end
  scenario 'unsuccessfully' do
    user  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', 
                            birth_date: '01/01/1983', occupation: 'Vendedor', department: 'Vendas', company_name: 'Campus Code',
                            email: 'rogerio@email.com', password: '12345678')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: ''
    fill_in 'Senha', with: ''
    
    click_on 'Log in'
    expect(page).not_to have_content('Editar perfil')
  end
end