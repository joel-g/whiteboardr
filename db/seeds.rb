user_data = [
    {first_name: 'Commander', last_name: 'Shephard', username: 'earthsaver1', email: 'commander@normandy.com', password: 'pw'},
    {first_name: 'Master', last_name: 'Chief', username: 'ih8covenant', email: 'john@unsc.gov', password: 'pw'},
    {first_name: 'Darth', last_name: 'Vader', username: 'sithlord83', email: 'darklord@empire.com', password: 'pw'},
    {first_name: 'Lara', last_name: 'Croft', username: 'tombraider', email: 'tombraider@gmail.com', password: 'pw'},
    {first_name: 'Leslie', last_name: 'Knope', username: 'iluvpawnee', email: 'hillary4evah@gmail.com', password: 'pw'}
]
User.create(user_data)

challenge_data = [
  {title: 'Sum an array', notes: 'Sample input: [1, 7, 9, 3, 4, 2, 6, -1] /n Sample output: 31', difficulty: 'Easy', user_id: 1, body: 'Take an array of numbers (any length) and return a single number that is the sum of all the numbers'}, {title: 'Fizz Buzz', notes: "Sample Input: 1, 3, 4, 5, 15 /n Sample output: 1, Fizz, 4, Buzz, FizzBuzz", difficulty: 'Medium', user_id: 1, body: 'Write a method that takes a single integer as an argument and returns Fizz is the number is divisible by 3, Buzz if the number is divisible by 5 and FizzBuzz if the number is divisible by both'}
]

Challenge.create(challenge_data)

ChallengeTag.create([
  {challenge_id: 1, tag_id: 1},
  {challenge_id: 1, tag_id: 2},
  {challenge_id: 1, tag_id: 3},
  {challenge_id: 2, tag_id: 1}
  ])

Tag.create([{name: 'algorithm'}, {name: 'data structures'}, {name: 'arrays'}])

interview_data = [
  {challenge_id: rand(1..2), interviewer_id: 3, applicant_id: 5},
  {challenge_id: rand(1..2), interviewer_id: 1, applicant_id: 2},
  {challenge_id: rand(1..2), interviewer_id: 5, applicant_id: 4},
  {challenge_id: rand(1..2), interviewer_id: 3, applicant_id: 2}
]

Interview.create(interview_data)
