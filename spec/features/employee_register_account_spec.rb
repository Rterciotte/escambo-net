require 'rails_helper'

feature 'Employee register account' do
  scenario 'Employee visit home page' do

    visit root_path
 
    expect(current_path).to eq new_user_session_path
  end

  scenario 'and register account' do
    
    visit root_path
    click_on 'Registrar-se'
    fill_in 'Email', with: 'lorem@ipsum.com'
    fill_in 'Nome Completo', with: 'Lorem Ipsum'
    fill_in 'Nome Social', with: 'Lorem'
    fill_in 'Data de Nascimento', with: '01/01/1983'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    fill_in 'Cargo', with: 'Vendedor'
    fill_in 'Setor', with: 'Vendas'
    fill_in 'Empresa', with: 'Ipsum'
    click_on 'Sign up'
    expect(page).to have_content('Escambo Net')
  end
end