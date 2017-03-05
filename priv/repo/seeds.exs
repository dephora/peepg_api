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
 
# Repo.insert!(%User{
#   name_first: "Ryan",
#   name_last: "Daw",
#   phone_main: "835-262-2626",
#   phone_main_ext: "626",
#   email: "ryan@ryan.com",
#   status: "active",
#   role: "user"})

# Repo.insert!(%User{
#   name_first: "Rosie",
#   name_last: "Daw",
#   phone_main: "835-262-2626",
#   phone_main_ext: "623",
#   email: "rosie@rosie.com",
#   status: "active",
#   role: "admin"})  
 
# for _ <- 1..10 do
#   Repo.insert!(%Post{
#     title: Faker.Lorem.sentence,
#     body: Faker.Lorem.paragraph,
#     user_id: [1, 2] |> Enum.take_random(1) |> hd
#   })
# end

for _ <- 1..30 do
  Repo.insert!(%Department{
    name: Faker.Commerce.department,
    phone_main: Faker.Phone.EnUs.phone,
    phone_main_ext: Faker.Phone.EnUs.extension,
    email: Faker.Internet.safe_email,
    status: ["active", "locked"] |> Enum.take_random(1) |> hd,
    # user_id: [1, 2] |> Enum.take_random(1) |> hd,
    comments: Faker.Lorem.sentence,
  })
end