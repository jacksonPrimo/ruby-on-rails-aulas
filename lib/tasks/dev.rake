namespace :dev do
  desc "Generate initial entities in dev environment"
  task setup: :environment do
    puts "........... reseting databse ..............."
    %x(rails db:drop db:create db:migrate)

    puts "........... creating kinds ..............."
    ["coordenador", "dono", "gerente"].each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "........... creating contacts ..............."
    10.times do
      Contact.create!({
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      })
    end

    puts "........... add relationship to contacts ..............."
    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
      Random.rand(5).times do 
        phone = Phone.create(number: Faker::PhoneNumber.cell_phone, contact: contact) 
        # contact.phones << phone
        # contact.save!
      end
    end
  end
end
