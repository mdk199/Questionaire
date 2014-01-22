# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }) { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PointsMap.find_or_create_by_key({:key => 'answer.create', :point => 10 })
PointsMap.find_or_create_by_key({:key => 'answer.got_approved', :point => 15 })
PointsMap.find_or_create_by_key({:key => 'answer.got_unapproved', :point => -15})
PointsMap.find_or_create_by_key({:key => 'question.create', :point => 5})
PointsMap.find_or_create_by_key({:key => 'question.destroy', :point => -5 })
PointsMap.find_or_create_by_key({:key => 'question.got_flagged', :point => -20})
PointsMap.find_or_create_by_key({:key => 'question.got_unflagged', :point => 20})
PointsMap.find_or_create_by_key({:key => 'profile.create', :point => 20})
PointsMap.find_or_create_by_key({:key => 'profile.destroy', :point => -20})
PointsMap.find_or_create_by_key({:key => 'comment.create', :point => 5})
PointsMap.find_or_create_by_key({:key => 'commment.destroy', :point => -5 })
PointsMap.find_or_create_by_key({:key => 'answer.destroy', :point => -10})