#Create a admin sample user.
User.create!(name: "AdminUser", 
             email: "admin@railstutorial.org", 
             password: "123456",
             admin: true)
User.create!(name: "Silvana", 
             email: "sil.lis@gmail.com", 
             password: "123456",
             description: "#{Faker::Job.education_level} level on #{Faker::Job.seniority.downcase}.
             Experienced in  #{Faker::Job.field.downcase} sector. My best soft skills are
             #{Faker::Job.key_skill.downcase}, #{Faker::Job.key_skill.downcase} and #{Faker::Job.key_skill.downcase}
             .
             Looking for a #{Faker::Job.employment_type.downcase} contract.",
             admin: false)
User.create!(name: "Jose", 
             email: "jjcaburrasi@gmail.com", 
             password: "123456",
             description: "#{Faker::Job.education_level} level on #{Faker::Job.seniority.downcase}.
             Experienced in  #{Faker::Job.field.downcase} sector. My best soft skills are
             #{Faker::Job.key_skill.downcase}, #{Faker::Job.key_skill.downcase} and #{Faker::Job.key_skill.downcase}
             .
             Looking for a #{Faker::Job.employment_type.downcase} contract.",
             admin: false)

# Generate a bunch of additional jobs.
      20.times do |n|
      title  = Faker::Job.title

      description = "We need a #{Faker::Job.seniority} #{Faker::Job.position}.
      You will work in #{Faker::Job.field} sector. Very important to have nice
      #{Faker::Job.key_skill}, #{Faker::Job.key_skill} and #{Faker::Job.key_skill}
      skills.
      This will be a #{Faker::Job.employment_type} contract, and we need a minimum education 
      level of #{Faker::Job.education_level}"

      j= Job.create!(title:  title,
                  description: description, status: "published")
      
     
            
     
    
      Stage.create(name: "Interview with the tech team", job: j)
      Stage.create(name: "Interview with the CEO", job: j)
      Stage.create(name: "Code challenge", job: j)
      Stage.create(name: "Final offer", job: j)
end
      