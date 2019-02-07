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

class Node < ApplicationRecord
  has_closure_tree order: :sort_order
end
