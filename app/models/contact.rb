class Contact < ApplicationRecord
  belongs_to :kind

  def author 
    "jackson aquino"
  end

  def kind_description
    self.kind.description
  end

  def as_json(options={})
    super(
      methods: [:author, :kind_description], 
      root: true,
    )
  end
end
