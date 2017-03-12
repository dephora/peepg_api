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
# alias PeepgApi.Post
alias PeepgApi.Repo
alias PeepgApi.Department
alias PeepgApi.Organization
alias PeepgApi.BillingCode
alias PeepgApi.Plan
alias PeepgApi.Subscription
alias PeepgApi.Image
alias PeepgApi.AnalysisInfo
alias PeepgApi.AnalysisPreset

# Should be seeded in the order below

# for _ <- 1..5 do
#   Repo.insert!(%Organization{
#     name_main: Faker.Company.name,
#     name_secondary: ["East", "North", "West", "South"] |> Enum.take_random(1) |> hd,
#     phone_main: Faker.Phone.EnUs.phone,
#     phone_main_ext: Faker.Phone.EnUs.extension,
#     phone_secondary: Faker.Phone.EnUs.phone,
#     phone_secondary_ext: Faker.Phone.EnUs.extension,
#     email_main: Faker.Internet.safe_email,
#     email_secondary: Faker.Internet.safe_email,
#     status: ["active", "locked"] |> Enum.take_random(1) |> hd,
#     comments: Faker.Lorem.sentence,
#   })
# end

# for _ <- 1..5 do
#   Repo.insert!(%BillingCode{
#     name: Faker.Commerce.color,
#     organization_id: :rand.uniform(5)
#   })
# end

# for _ <- 1..25 do
#   Repo.insert!(%Department{
#     name_main: Faker.Commerce.department,
#     phone_main: Faker.Phone.EnUs.phone,
#     phone_main_ext: Faker.Phone.EnUs.extension,
#     email: Faker.Internet.safe_email,
#     status: ["active", "locked"] |> Enum.take_random(1) |> hd,    
#     comments: Faker.Lorem.sentence,
#     organization_id: :rand.uniform(5),
#     billing_code_id: :rand.uniform(5)
#   })
# end

# for _ <- 1..250 do
#   Repo.insert!(%User{
#     email: Faker.Internet.safe_email,
#     name_first: Faker.Name.first_name,
#     name_last: Faker.Name.last_name,
#     phone_main: Faker.Phone.EnUs.phone,
#     phone_main_ext: Faker.Phone.EnUs.extension,
#     status: ["active", "locked"] |> Enum.take_random(1) |> hd,    
#     # role: ["master", "admin", "lead", "user", "limited"] |> Enum.take_random(1) |> hd, 
#     comments: Faker.Lorem.sentence,
#     password_hash: Faker.Code.isbn,
#     roles_mask: :rand.uniform(5),
#     sign_in_count: :rand.uniform(15),
#     department_id: :rand.uniform(25)
#   })
# end

# for _ <- 1..25 do
#   Repo.insert!(%Department{
#     name_main: Faker.Commerce.department,
#     phone_main: Faker.Phone.EnUs.phone,
#     phone_main_ext: Faker.Phone.EnUs.extension,
#     email: Faker.Internet.safe_email,
#     status: ["active", "locked"] |> Enum.take_random(1) |> hd,    
#     comments: Faker.Lorem.sentence,
#     organization_id: :rand.uniform(5),
#     billing_code_id: :rand.uniform(5)
#   })
# end

# for _ <- 1..5 do
#   Repo.insert!(%Subscription{
#     start_date: Timex.to_date({2017, 6, 24}),
#     end_date: Timex.to_date({2018, 6, 24}),
#     organization_id: :rand.uniform(5),
#     plan_id: [2, 3, 4, 5] |> Enum.take_random(1) |> hd,
#   })
# end

# for _ <- 1..25 do
#   Repo.insert!(%Image{
#     name_original: Faker.File.file_name,
#     name_processed: Faker.File.file_name,
#     filename_original: Faker.File.file_name,
#     processing_stage: ["Done", "Not Started", "In Progress"] |> Enum.take_random(1) |> hd, 
#     state: ["Done", "Not Started", "In Progress"] |> Enum.take_random(1) |> hd, 
#     metadata: Faker.File.mime_type,
#     analysis_type: ["Renal Tumor", "FISH", "Prostate"] |> Enum.take_random(1) |> hd, 
#     user_id: :rand.uniform(100),
#     billing_code_id: :rand.uniform(5)
#   })
# end

# for _ <- 1..5 do
#   Repo.insert!(%AnalysisInfo{
#     total_parts: :rand.uniform(30000),
#     analyzed_parts: :rand.uniform(30000),
#     metadata: Faker.File.mime_type,
#     approval_status: ["Approved", "Not Approved", "Awaiting Approval"] |> Enum.take_random(1) |> hd, 
#     approval_updated_at: Timex.now,
#     final_grade: :rand.uniform(5),
#     image_id: :rand.uniform(25),
#   })
# end

# will break due to random on name and unique in db, but should it be unique?
# for _ <- 1..3 do
#   Repo.insert!(%AnalysisPreset{
#     name: ["Renal Tumor", "FISH", "Prostate"] |> Enum.take_random(1) |> hd, 
#     settings: Faker.File.mime_type,
#     billing_code_id: :rand.uniform(5)
#   })
# end