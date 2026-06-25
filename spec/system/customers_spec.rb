require 'rails_helper'

RSpec.describe "Customers", type: :system do

  it "Verifica Link Cadastro de Clientes" do
    visit(root_path)
    expect(page).to have_link('Cadastro de Clientes')
  end

  it "Verifica Link de Novo Cliente" do
    visit(root_path)
    click_on('Cadastro de Clientes')
    expect(page).to have_content('Listando Clientes')
    expect(page).to have_link('Novo Cliente')
  end

  it 'Verifica Formulário de Novo Cliente' do
    visit(customers_path)
    click_on('Novo Cliente')
    expect(page).to have_content('Novo Cliente')
  end

  it 'Cadastra um cliente válido' do
    visit (new_customer_path) 
    customer_name = Faker::Name.name
    customer_email = Faker::Internet.email
    
    fill_in('Nome', with: customer_name)
    fill_in('Email', with: customer_email)
    fill_in('Telefone', with: Faker::PhoneNumber.phone_number)
    attach_file('Foto do Perfil', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['S', 'N'].sample)
    click_on('Criar Cliente')
    expect(page).to have_content('Cliente cadastrado com sucesso!')
    expect(Customer.last.name).to eq(customer_name)
    expect(Customer.last.email).to eq(customer_email)
  end

  it 'Não cadastra um cliente inválido' do
    visit(new_customer_path)
    click_on('Criar Cliente')
    expect(page).to have_content('não pode ficar em branco')
  end

  it 'Mostra um cliente' do
    customer = create(:customer)

    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
  end

  it 'Testando a Index' do
    customer1 = create(:customer)

    customer2 = create(:customer)

    visit(customers_path)
    expect(page).to have_content(customer1.name).and have_content(customer2.name)
  end

  it 'Atualiza  um cliente' do
    customer = create(:customer)

    new_name = Faker::Name.name
    visit(edit_customer_path(customer.id))
    fill_in('Nome', with: new_name)
    click_on('Atualizar Cliente')
    expect(page).to have_content('Cliente atualizado com sucesso!')
    expect(page).to have_content(new_name)
  end

  it 'Clica no Link Mostrar da Index' do
    customer = create(:customer)
    visit(customers_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[2]/a").click
    expect(page).to have_content("Mostrando Cliente")
  end

  it 'Clica no Link Editar da Index' do
    customer = create(:customer)

    visit(customers_path)
    find(:xpath, "/html/body/table/tbody/tr[1]/td[3]/a").click
    expect(page).to have_content("Editando Cliente")
  end

  it 'Apaga um cliente', js: true do
    customer = create(:customer)
    
    visit(customers_path)

    accept_confirm do
      click_link 'Excluir'
    end

    expect(page).to have_content('Cliente excluido com sucesso!')
  end
end