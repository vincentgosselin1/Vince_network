namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_relationships
  end
end

def make_users
    User.create!(name: "Example User",
                 email: "example@railstutorial.org")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      User.create!(name: name,
                   email: email)
    end
end

  def make_relationships
  users = User.all
  user  = users.first
  friends_users = users[2..50]
  friends      = users[3..40]
  friends_users.each { |friends_with| user.befriend!(friends_with) }
  friends.each      { |friends| friends.befriend!(user) }
end

