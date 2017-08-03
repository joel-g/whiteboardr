Interview.destroy_all
Challenge.destroy_all
User.destroy_all

user_data = [
    {first_name: 'Commander', last_name: 'Shephard', username: 'earthsaver1', email: 'commander@normandy.com', password: 'pwd', password_confirmation: 'pwd'},
    {first_name: 'Master', last_name: 'Chief', username: 'ih8covenant', email: 'john@unsc.gov', password: 'pwd', password_confirmation: 'pwd'},
    {first_name: 'Darth', last_name: 'Vader', username: 'sithlord83', email: 'darklord@empire.com', password: 'pwd', password_confirmation: 'pwd'},
    {first_name: 'Lara', last_name: 'Croft', username: 'tombraider', email: 'tombraider@gmail.com', password: 'pwd', password_confirmation: 'pwd'},
    {first_name: 'Leslie', last_name: 'Knope', username: 'iluvpawnee', email: 'hillary4evah@gmail.com', password: 'pwd', password_confirmation: 'pwd'}
]
User.create(user_data)

challenge_data = [
  {title: 'Sum an array', notes: 'Sample input: [1, 7, 9, 3, 4, 2, 6, -1] /n Sample output: 31', difficulty: 'Easy', user_id: User.all.sample.id, body: 'Take an array of numbers (any length) and return a single number that is the sum of all the numbers'},
  {title: 'Fizz Buzz', notes: "Sample Input: 1, 3, 4, 5, 15 /n Sample output: 1, Fizz, 4, Buzz, FizzBuzz", difficulty: 'Medium', user_id: User.all.sample.id, body: 'Write a method that takes a single integer as an argument and returns Fizz is the number is divisible by 3, Buzz if the number is divisible by 5 and FizzBuzz if the number is divisible by both'},
  {title: 'Reverse a String', notes: 'Take a string and reverse it', difficulty: 'Easy', user_id: User.all.sample.id, body: 'Do as stated above'}
]
Challenge.create(challenge_data)

Tag.create([{name: 'algorithm'}, {name: 'data structures'}, {name: 'arrays'}])
tags = []
Tag.all.each do |tag|
  tags << tag.id
end

challenges = []
Challenge.all.each do |challenge|
  challenges << challenge.id
end

ChallengeTag.create([
  {challenge_id: challenges[0], tag_id: tags[0]},
  {challenge_id: challenges[0], tag_id: tags[1]},
  {challenge_id: challenges[1], tag_id: tags[0]},
  {challenge_id: challenges[0], tag_id: tags[1]}
  ])

users = []
User.all.each do |user|
  users << user.id
end

interview_data = [
  {challenge_id: challenges[rand(0..2)], interviewer_id: users[0], applicant_id: users[1]},
  {challenge_id: challenges[rand(0..2)], interviewer_id: users[1], applicant_id: users[0]},
  {challenge_id: challenges[rand(0..2)], interviewer_id: users[2], applicant_id: users[3]},
  {challenge_id: challenges[rand(0..2)], interviewer_id: users[4], applicant_id: users[5]},
]
Interview.create(interview_data)
