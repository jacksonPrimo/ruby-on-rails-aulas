class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address
  # accepts_nested_attributes_for allow create contact with phones during register by phones_attributes
  # Contact.create({name: "jack", email: "jack@jack", birthdate: Date.today, kind_id: 1, phones_attributes: [{number: "87878"}]})

  # allow_destroy allow delete phone inside contact by nested_attributes
  # PATCH {name: "changed_name", phones_attributes: [{id: 1, _destroy: 1}]}

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
      # methods: [:author, :kind_description, :hello], 
      # root: true,
      include: [:phones, :address]
    )
  end
end
