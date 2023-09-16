namespace :dev do
  desc "Generate initial entities in dev environment"
  task setup: :environment do
    ["coordenador", "dono", "gerente"].each do |kind|
      Kind.create!(
        description: kind
      )
    end

    10.times do
      Contact.create!({
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      })
    end
  end
end
