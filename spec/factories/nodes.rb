# == Schema Information
#
# Table name: nodes
#
#  id         :integer          not null, primary key
#  name       :string
#  sort_order :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :root, class: Node do
    name { "root" }
  end
end
