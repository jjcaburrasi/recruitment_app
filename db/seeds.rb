# #Create a admin sample user.
User.create!(name: "AdminUser", 
             email: "admin@railstutorial.org", 
             password: "123456",
             admin: true)

# Generate a bunch of additional users.
100.times do |n|
      title  = Faker::Job.title

      description = "We need a #{Faker::Job.seniority} #{Faker::Job.position}.
      You will work in #{Faker::Job.field} sector. Very important to have nice
      #{Faker::Job.key_skill}, #{Faker::Job.key_skill} and #{Faker::Job.key_skill}
      skills.
      This will be a #{Faker::Job.employment_type} contract, and we need a minimum education 
      level of #{Faker::Job.education_level}"

      Job.create!(title:  title,
                  description: description)
end