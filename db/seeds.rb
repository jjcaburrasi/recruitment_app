# #Create a admin sample user.
User.create!(name: "AdminUser", 
             email: "admin@railstutorial.org", 
             password: "123456",
             admin: true)
User.create!(name: "Silvana", 
             email: "sil.lis@gmail.com", 
             password: "123456",
             admin: false)
User.create!(name: "Jose", 
             email: "jjcaburrasi@gmail.com", 
             password: "123456",
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
                  description: description)
      
      st= rand(1..3)

      st.times do |st|
            str = ["Tell us about you", "Prepare coffee", "Wacth the LOTR Trilogy in one day (Extended version)", "Find the triforce", "100 meter dash", "Backflip with a glass of beer in the hand", "Name the full team of Spain WC Winner 2010"].shuffle[1]
            Stage.create(name: str, job: j)
            
     
      end
      Stage.create(name: "Interview", job: j)
      Stage.create(name: "Code challenge", job: j)
      Stage.create(name: "Final offer", job: j)
      


end