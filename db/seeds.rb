# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

root = Node.create(name: 'root(3)')
child = root.children.create(name: 'child')
child.children.create(name: 'grandchild')

root2 = Node.create(name: 'root(1)')

root100 = Node.create(name: 'root(100)')
9.times do |x|
  c = root100.children.create(name: Faker::Address.country)
  9.times do |y|
    c.children.create(name: Faker::Address.city)
  end
end

root1000 = Node.create(name: 'root(1000)')
9.times do |x|
  c = root1000.children.create(name: Faker::Address.country)
  9.times do |y|
    gc = c.children.create(name: Faker::Address.city)
    9.times do |z|
      ggc = gc.children.create(name: Faker::Address.street_address)
    end
  end
end

root10000 = Node.create(name: 'root(10000)')
9.times do |x|
  c = root1000.children.create(name: Faker::Address.country)
  9.times do |y|
    gc = c.children.create(name: Faker::Address.city)
    9.times do |z|
      ggc = gc.children.create(name: Faker::Address.street_address)
      9.times do |u|
        gggc = ggc.children.create(name: Faker::Name.name)
      end
    end
  end
end
