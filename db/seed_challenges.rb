challenge_data = [
  {     title: 'Invert Values',
         body: 'Write a function that given a set of numbers return the inverse of the numbers.',
        notes: 'invert([1, 2, 3, 4, 5]) would return [ -1, -2, -3, -4, -5]\n invert([-2, 3, 1]) would return [2, -3, -1]\n invert([]) would return []\n You may assume all numbers are integers.',
   difficulty: 'Easy',
      user_id:  1,
       },
   {     title: 'Triple Strings',
          body: 'Create a function that will return a string that combines all of the letters of three inputed strings in groups. Taking the first letter of all of the inputs and grouping them next to each other',
         notes: 'Input: aa, bb, cc, Output: abcabc\n You may assume all input strings are the same length.',
    difficulty: 'Easy',
       user_id:  1,
        },
  {     title: 'Credit Card Mask',
         body: 'Write a function that takes a string and replaces all but the last 4 chracters with asterisks',
        notes: 'Input: 1234567890, Output: 123456****\n Input: 1234, Output: ****\n Input: abc, Output: abc\n Input: jar jar binks, Output *********inks',
   difficulty: 'Easy',
      user_id:  1,
       },
   {     title: 'Odd or Even',
          body: "Create a function that takes an integer as an argument and returns 'Even' for even numbers or 'Odd' for odd numbers.",
         notes: 'Input: 12, Output: Even\n Input: -1, Output: Odd\n Input: 0, Output: Even',
    difficulty: 'Easy',
       user_id:  1,
        },
    {     title: 'Reverse and Digitize',
           body: "Given a number return an array of the single digits in reverse order",
          notes: 'Input: 123456, Output: [6,5,4,3,2,1]\n Input: -1, Output: [-1]\n Output array should not contain strings.',
     difficulty: 'Easy',
        user_id:  1,
         },
     {     title: 'Find the Middle',
            body: "Given a word, return the middle character. If the number of characters in the word is off return just one character. If the number of chracters is even return the middle two characters. ",
           notes: 'Input: test, Output: st\n Input: whiteboardr, Output: b',
      difficulty: 'Easy',
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
      { name: 'mathematics' } #8

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
  # { challenge_id: 4, tag_id: 1 },

]


Challenge.create(challenge_data)
Tag.create(tag_data)
ChallengeTag.create(challengetag_data)
