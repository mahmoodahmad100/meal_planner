exit if !Rails.env.development?

puts "deleting all the data"
Recipe.delete_all
User.delete_all


puts "create new user"
user = FactoryBot.create(:user, email: 'test@example.com')

puts "create new recipes"

30.times do
	FactoryBot.create(:recipe, user: user)
end