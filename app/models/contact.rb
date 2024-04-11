class Contact < ApplicationRecord
  belongs_to :kind

  def author 
    "jackson aquino"
  end

  def kind_description
    self.kind.description
  end

  def hello
    I18n.t("hello")
  end

  # o método render json dos controllers chama o método as_json do model, podemos
  # sobreescrever este método passando options no seu argumento, chamando o super
  # para manter o chamada original e neste caso, estamos passando uma configuração
  # padrão para o método, que seria renderizar o método author e kind_description
  # assim como colocar todos os atributos dentro de uma chave com o nome do próprio
  # model com o root: true
  def as_json(options={})
    super(
      methods: [:author, :kind_description, :hello], 
      root: true,
    )
  end
end
