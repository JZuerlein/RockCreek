# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Group.create!(name: "Admin")
Group.create!(name: "Change Advisory Board")

Status.create!(name: "New")
Status.create!(name: "Assigned")
Status.create!(name: "Pending Approval")
Status.create!(name: "Approved")
Status.create!(name: "Denied")
Status.create!(name: "Completed")

ChangeType.create!(name: "Facilities")
ChangeType.create!(name: "Hardware Install")
ChangeType.create!(name: "Hardware Replacement")
ChangeType.create!(name: "Hardware Retire")
ChangeType.create!(name: "Hardware Upgrade")
ChangeType.create!(name: "Network")
ChangeType.create!(name: "Software Maintenance")
ChangeType.create!(name: "Software Install")
ChangeType.create!(name: "Software Migration")
ChangeType.create!(name: "Software Uninstall")
ChangeType.create!(name: "Software Upgrade")

Plan.create!(name: "Small", price:50.00, num_users: 10)
Plan.create!(name: "Medium", price:100.00, num_users: 25)
Plan.create!(name: "Large", price:500.00, num_users: 150)