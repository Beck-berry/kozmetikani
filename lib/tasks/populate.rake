namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [User, Kezele, Idopont].each(&:delete_all)

    User.populate 10 do |person|
      person.name    = Faker::Name.name
      person.email   = Faker::Internet.email
      password       = Faker::Internet.password
      person.encrypted_password = User.new(:password => password).encrypted_password
    Kezele.populate 3 do |kezele|
      kezele.name = Populator.words(1..3).titleize
      kezele.minutes = [15, 20, 30, 40, 60, 90]
      kezele.price = [500, 750, 870, 1200, 1345, 1530, 2410, 3500, 4620]
      kezele.desc = Populator.sentences(2..10)
      Idopont.populate 1..3 do |idopont|
        idopont.user_id = person.id
        #idopont.todo = Array.new([kezele.name, kezele.name])
        #idopont.todo.fill(kezele.name)
        idopont.fromTime = 1.month.ago..1.month.from_now.to_datetime
        idopont.toTime = Time.at(idopont.fromTime.to_i + kezele.minutes*60).to_datetime
        idopont.created_at = 1.month.ago..Time.now
      end
    end
    end
  end
end