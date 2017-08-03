User.create(email: 'whiteboardrhelp@gmail.com', first_name: 'Whiteboardr', last_name: 'Team', username: 'whiteboardr', password: ENV[USER_PASSWORD])

challenge_data = [
  {     title: 'Invert Values', #1
         body: 'Given a set of numbers return the inverse of the numbers.',
        notes: "invert([1, 2, 3, 4, 5]) would return [ -1, -2, -3, -4, -5]\n invert([-2, 3, 1]) would return [2, -3, -1]\n invert([]) would return []\n You may assume all numbers are integers.",
   difficulty: 'Easy',
      user_id:  1,
       },
   {     title: 'Triple Strings', #2
          body: 'Create a function that will return a string that combines all of the letters of three inputed strings in groups. Taking the first letter of all of the inputs and grouping them next to each other',
         notes: "Input: aa, bb, cc, Output: abcabc\n You may assume all input strings are the same length.",
    difficulty: 'Easy',
       user_id:  1,
        },
  {     title: 'Credit Card Mask', #3
         body: 'Write a function that takes a string and replaces all but the last 4 chracters with asterisks',
        notes: "Input: 1234567890, Output: 123456****\n Input: 1234, Output: ****\n Input: abc, Output: abc\n Input: jar jar binks, Output *********inks",
   difficulty: 'Easy',
      user_id:  1,
       },
   {     title: 'Odd or Even', #4
          body: "Create a function that takes an integer as an argument and returns 'Even' for even numbers or 'Odd' for odd numbers.",
         notes: "Input: 12, Output: Even\n Input: -1, Output: Odd\n Input: 0, Output: Even",
    difficulty: 'Easy',
       user_id:  1,
        },
    {     title: 'Reverse and Digitize', #5
           body: "Given a number return an array of the single digits in reverse order",
          notes: "Input: 123456, Output: [6,5,4,3,2,1]\n Input: -1, Output: [-1]\n Output array should not contain strings.",
     difficulty: 'Easy',
        user_id:  1,
         },
     {     title: 'Find the Middle', #6
            body: "Given a word, return the middle character. If the number of characters in the word is off return just one character. If the number of chracters is even return the middle two characters. ",
           notes: "Input: test, Output: st\n Input: whiteboardr, Output: b",
      difficulty: 'Easy',
         user_id:  1,
          },
    {     title: 'Is it a square?', #7
           body: "Given a positive number determine if it is a square number. Return true if the number is a square of an interger, otherwise return false.",
          notes: "Input: 9, Output: true\n Input: 144, Output: true\n Input: 26, Output: false",
     difficulty: 'Medium',
        user_id:  1,
         },
     {     title: 'Multiples of 3 and 5 (not fizzbuzz)', #8
            body: "Given a number find all the natural numbers below it that are multiples of 3 or 5 and return their sum",
           notes: "Input: 10, Output: 23 (23 is the sum of 3, 5, 6 and 9)",
      difficulty: 'Medium',
         user_id:  1,
          },
    {     title: 'Average Strings', #9
           body: "You are given a string of numbers that are spelled out. Each number is 0-9 and seperated by spaces. Find the average and return it as a floored whole number.",
          notes: "Input: 'zero nine five two', Output: 4\n Input: 'three, six, nine', Output: 6\n Input: 'zero zero zero', Output: 0\n Input: 'one one eight one', Output: 2",
     difficulty: 'Medium',
        user_id:  1,
         },
     {     title: 'Array Deep Count', #10
            body: "Array.length will give you the number of top-level elements in an array. Create a function that returns the number of ALL elements within an array, inluding the number of elements inside nested arrays.",
           notes: "Input: [1, 2, 3], Output: 3\n Input: ['x', 'y', ['z']], Output: 4\n Input: [1, 2, [3, 4, [5]]], Output: 7\n Hint: You may need recursion",
      difficulty: 'Hard',
         user_id:  1,
          },





]

tag_data = [
      { name: 'integers' }, #1
      { name: 'numbers '}, #2
      { name: 'arrays' }, #3
      { name: 'data structures'}, #4
      { name: 'fundamentals'}, #5
      { name: 'strings'}, #6
      { name: 'algorithms' }, #7
      { name: 'mathematics' }, #8
      { name: 'recursion' } #9

]

challengetag_data = [
  { challenge_id: 1, tag_id: 1 },
  { challenge_id: 1, tag_id: 2 },
  { challenge_id: 1, tag_id: 3 },
  { challenge_id: 1, tag_id: 4 },
  { challenge_id: 1, tag_id: 5 },
  { challenge_id: 2, tag_id: 6 },
  { challenge_id: 2, tag_id: 7 },
  { challenge_id: 3, tag_id: 6 },
  { challenge_id: 3, tag_id: 7 },
  { challenge_id: 4, tag_id: 1 },
  { challenge_id: 4, tag_id: 2 },
  { challenge_id: 5, tag_id: 2 },
  { challenge_id: 5, tag_id: 5 },
  { challenge_id: 5, tag_id: 3 },
  { challenge_id: 6, tag_id: 5 },
  { challenge_id: 6, tag_id: 6 },
  { challenge_id: 7, tag_id: 7 },
  { challenge_id: 7, tag_id: 8 },
  { challenge_id: 7, tag_id: 1 },
  { challenge_id: 8, tag_id: 2 },
  { challenge_id: 7, tag_id: 7 },
  { challenge_id: 7, tag_id: 8 },
  { challenge_id: 8, tag_id: 2 },
  { challenge_id: 8, tag_id: 7 },
  { challenge_id: 8, tag_id: 8 },
  { challenge_id: 9, tag_id: 7 },
  { challenge_id: 9, tag_id: 2 },
  { challenge_id: 9, tag_id: 6 },
  { challenge_id: 10, tag_id: 3 },
  { challenge_id: 10, tag_id: 9 },
  { challenge_id: 10, tag_id: 7 },

  # { challenge_id: 4, tag_id: 1 },
]


Challenge.create(challenge_data)
Tag.create(tag_data)
ChallengeTag.create(challengetag_data)
