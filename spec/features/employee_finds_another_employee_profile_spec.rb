require 'rails_helper'

feature 'employee finds another employee profile' do
  scenario 'successfully' do
    user  = User.create!(full_name: 'Rogério Terciotte', social_name: 'Rogério', 
                            birth_date: '01/01/1983', occupation: 'Vendedor', department: 'Vendas', company_name: 'Campus Code',
                            email: 'rogerio@email.com', password: '12345678')
    another_user  = User.create!(full_name: 'John Doe', social_name: 'John', 
                            birth_date: '01/01/1983', occupation: 'Vendedor', department: 'Vendas', company_name: 'Campus Code',
                            email: 'mail@test.com', password: '12345678')                        

    login_as :user
    
    click_on 'Log in'
    fill_in 'Busca de Perfil', with: 'John Doe'
    click_on 'Buscar Perfil'
    click_on 'John Doe'
    expect(page).to have_content('John Doe')
    expect(page).to have_content('mail@test.com')
    expect(page).to have_content('Vendedor')
    expect(page).to have_content('Vendas')
    expect(page).to have_content('Campus Code')
  end
  xscenario 'unsuccessfully' do

  end
end