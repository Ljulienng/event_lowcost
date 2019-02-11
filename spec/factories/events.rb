FactoryBot.define do
  factory :event do
    title {"DoeDoe"}
    price {1000}
    description {"Grosse reception soirée: fondu, tartiflette, raclette"}
    start_date {"2019-03-07 01:37:38 "}
    duration {5}
    admin_id {5}
    location {"somewhere"}

  end
end
