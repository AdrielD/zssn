items_seed = [
  { name: 'Water', points: 4 },
  { name: 'Food', points: 3 },
  { name: 'Meds', points: 2 },
  { name: 'Ammo', points: 1 }
]

items_seed.each do |seed|
  Item.find_or_create_by(slug: seed[:slug]) do |item|
    item.name = seed[:name]
    item.points = seed[:points]
  end
end

user_seed = [
  { name: 'Joel', age: 56, gender: :male, lat: 43.396351, lng: -124.826765 },
  { name: 'Ellie', age: 19, gender: :female, lat: 25.395300, lng: -113.567377 },
  { name: 'Abby', age: 20, gender: :female, lat: 30.396339, lng: -116.467764 },
  { name: 'Jill Valentine', age: 33, gender: :female, lat: 12.12345, lng: 23.44556 },
  { name: 'Leon Kennedy', age: 34, gender: :male, lat: 67.54321, lng: 89.11223 },
  { name: 'Shaun', age: 43, gender: :male, lat: 1.44444, lng: 66.66666 },
]

user_seed.each do |seed|
  User.find_or_create_by(name: seed[:name], age: seed[:age]) do |user|
    user.gender = seed[:gender]
    user.lat = seed[:lat]
    user.lng = seed[:lng]
  end
end

UserItem.create(user_id: 1, item_id: 1, amount: 5)
UserItem.create(user_id: 1, item_id: 2, amount: 6)
UserItem.create(user_id: 1, item_id: 3, amount: 3)
UserItem.create(user_id: 1, item_id: 4, amount: 25)

UserItem.create(user_id: 2, item_id: 1, amount: 2)
UserItem.create(user_id: 2, item_id: 2, amount: 3)
UserItem.create(user_id: 2, item_id: 4, amount: 10)

UserItem.create(user_id: 3, item_id: 1, amount: 1)
UserItem.create(user_id: 3, item_id: 2, amount: 1)
UserItem.create(user_id: 3, item_id: 3, amount: 1)

UserItem.create(user_id: 4, item_id: 1, amount: 50)
UserItem.create(user_id: 4, item_id: 2, amount: 6)
UserItem.create(user_id: 4, item_id: 3, amount: 34)
UserItem.create(user_id: 4, item_id: 4, amount: 5)

UserItem.create(user_id: 5, item_id: 1, amount: 1)
UserItem.create(user_id: 5, item_id: 2, amount: 2)
UserItem.create(user_id: 5, item_id: 3, amount: 3)
UserItem.create(user_id: 5, item_id: 4, amount: 4)

UserItem.create(user_id: 6, item_id: 1, amount: 6)
UserItem.create(user_id: 6, item_id: 2, amount: 7)
UserItem.create(user_id: 6, item_id: 3, amount: 8)
UserItem.create(user_id: 6, item_id: 4, amount: 9)
