require 'rails_helper'

feature 'Employee register account' do
  scenario 'Employee visit home page' do

    visit root_path
 
    expect(page).to have_content('Escambo Net')
  end

  scenario 'and register account' do
    
    visit root_path
    click_on 'Registrar-se'
    fill_in 'Email', with: 'lorem@ipsum.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmação de senha', with: '123456'
    fill_in 'Empresa', with: 'Campus Code'
    fill_in 'Nome Completo', with: 'Lorem Ipsum'
    fill_in 'Nome Social', with: 'Lorem'
    fill_in 'Data de Nascimento', with: '01/01/1970'
    fill_in 'Cargo', with: 'Salesman'
    fill_in 'Setor', with: 'Sales'
    click_on 'Sign up'
    expect(page).to have_content('Editar perfil')
    click_on 'Logout'
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'lorem@ipsum.com'
    fill_in 'Senha', with: '123456'
    
    click_on 'Log in'
    expect(page).to have_content('Login efetuado com sucesso!')
  end
end