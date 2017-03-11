# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PeepgApi.Repo.insert!(%PeepgApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias PeepgApi.User
alias PeepgApi.Post
alias PeepgApi.Repo
alias PeepgApi.Department
alias PeepgApi.Organization



# for _ <- 1..50 do
#   Repo.insert!(%Organization{
#     name_main: Faker.Company.name,
#     phone_main: Faker.Phone.EnUs.phone,
#     phone_main_ext: Faker.Phone.EnUs.extension,
#     phone_secondary: Faker.Phone.EnUs.phone,
#     phone_secondary_ext: Faker.Phone.EnUs.extension,
#     email: Faker.Internet.safe_email,
#     status: ["active", "locked"] |> Enum.take_random(1) |> hd,
#     comments: Faker.Lorem.sentence,
#   })
# end
 
# for _ <- 1..600 do
#   Repo.insert!(%Department{
#     name: Faker.Commerce.department,
#     phone_main: Faker.Phone.EnUs.phone,
#     phone_main_ext: Faker.Phone.EnUs.extension,
#     email: Faker.Internet.safe_email,
#     status: ["active", "locked"] |> Enum.take_random(1) |> hd,    
#     comments: Faker.Lorem.sentence,
#     organization_id: :rand.uniform(50)
#   })
# end

# for _ <- 1..600 do
#   Repo.insert!(%Department{
#     name: Faker.Commerce.department,
#     phone_main: Faker.Phone.EnUs.phone,
#     phone_main_ext: Faker.Phone.EnUs.extension,
#     email: Faker.Internet.safe_email,
#     status: ["active", "locked"] |> Enum.take_random(1) |> hd,    
#     comments: Faker.Lorem.sentence,
#     organization_id: :rand.uniform(50)
#   })
# end

# for _ <- 1..600 do
#   Repo.insert!(%Department{
#     name_first: Faker.Name.first_name,
#     name_last: Faker.Name.last_name,
#     phone_main: Faker.Phone.EnUs.phone,
#     phone_main_ext: Faker.Phone.EnUs.extension,
#     email: Faker.Internet.safe_email,
#     status: ["active", "locked"] |> Enum.take_random(1) |> hd,    
#     role: ["master", "admin", "lead", "user", "limited"] |> Enum.take_random(1) |> hd, 
#     department_id: :rand.uniform(600)
#   })
# end

 
# for _ <- 1..10 do
#   Repo.insert!(%Post{
#     title: Faker.Lorem.sentence,
#     body: Faker.Lorem.paragraph,
#     user_id: [1, 2] |> Enum.take_random(1) |> hd
#   })
# end


