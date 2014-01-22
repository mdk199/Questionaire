# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Points = PointsMap.create([
			{key: 'answer.create',point: 10 },
			{key: 'answer.got_approved',point: 15 },
			{key: 'answer.got_unapproved',point: -15},
			{key: 'question.create',point: 5},
			{key: 'question.destroy',point: -5 },
			{key: 'question.got_flagged',point: -20},
			{key: 'question.got_unflagged',point: 20},
			{key: 'profile.create',point: 20},
			{key: 'profile.destroy',point: -20},
			{key: 'comment.create',point: 5},
			{key: 'commment.destroy',point: -5 },
			{key: 'answer.destroy',point: -10}])