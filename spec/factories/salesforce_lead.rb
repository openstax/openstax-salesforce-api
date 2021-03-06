require 'faker'

FactoryBot.define do
  factory :salesforce_lead, class: OpenStax::Salesforce::Remote::Lead do
    skip_create
    id {Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3)}
    name {Faker::Name.name }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    salutation { Faker::Name.suffix }
    subject { [:biology, :chemistry, :psychology, :economics].sample }
    school { Faker::University.name }
    phone { Faker::PhoneNumber.cell_phone }
    website { Faker::Internet.url(host: 'example.com')}
    status { ['Needs School', 'Needs Contact', 'Needs Opportunity', 'Needs FV', 'Needs Partner', 'converted'].sample }
    email { Faker::Internet.safe_email }
    source { ['Customer Service Ticket', 'Phone', 'Chat', 'OSC Faculty', 'Conference'].sample }
    newsletter { false }
    newsletter_opt_in { false }
    adoption_status { ['Confirmed Adoption Won', 'Confirmed Adoption Recommend', 'High Interest In Using', 'Not Using'].sample }
    num_students  { (1..300).to_a.sample }
    os_accounts_id { Faker::Number.number(digits: 10) }
    accounts_uuid { Faker::Internet.uuid }
    application_source { ['Tutor Signup', 'OS Web', 'Accounts', 'Formsite'].sample }
    role { ['student', 'faculty', 'other', 'administrator', 'librarian', 'adjunct faculty', 'instructional designer', 'home school teacher' ].sample }
    who_chooses_books { ['instructor','committee', 'coordinator'].sample }
    verification_status { ['pending_faculty', 'confirmed_faculty', 'rejected_faculty'].sample }
    finalize_educator_signup { false }
  end
end
