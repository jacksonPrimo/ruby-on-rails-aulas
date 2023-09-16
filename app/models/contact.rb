class Contact < ApplicationRecord
  belongs_to :kind

  def author 
    "jackson aquino"
  end

  def as_json(options={})
    super(
      methods: :author, 
      root: true,
      include: { kind: { only: :description } }
    )
  end
end
