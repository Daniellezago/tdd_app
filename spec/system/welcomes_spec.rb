require 'rails_helper'

RSpec.describe "Welcomes", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "Mostra a mensagem de Seja Bem-vindo!!!" do
    visit('/')
    expect(page).to have_content('Bem-vindo')
  end

  it "Verificar Link Cadastro de Clientes" do
    visit(root_path)
    expect(find('ul li')).to have_link('Cadastro de Clientes')
  end
end
