challenge_data = [
  {     title: 'Invert Values',
         body: 'Write a function that given a set of numbers return the inverse of the numbers.',
        notes: 'invert([1, 2, 3, 4, 5]) would return [ -1, -2, -3, -4, -5]\n invert([-2, 3, 1]) would return [2, -3, -1]\n invert([]) would return []\n You may assume all numbers are integers.',
   difficulty: 'Easy',
      user_id:  1,
       },
   {     title: 'Triple Strings',
          body: 'Create a function that will return a string that combines all of the letters of three inputed strings in groups. Taking the first letter of all of the inputs and grouping them next to each other',
         notes: 'Input: aa, bb, cc, Output: abcabc\n You may assume all input strings are the same length.'
    difficulty: 'Easy',
       user_id:  1,
        },
  {     title: 'Credit Cardd Mask',
         body: 'Write a function that takes a string and replaces all but the last 4 chracters with asterisks',
        notes: 'Input: 1234567890, Output: 123456****\n Input: 1234, Output: ****\n Input: abc, Output: abc\n Input: jar jar binks, Output *********inks'
   difficulty: 'Easy',
      user_id:  1,
       },

]

tag_data = [
      { name: 'integers' },
      { name: 'numbers '},
      { name: 'arrays' },
      { name: 'data structures'},
      { name: 'fundamentals'},
      { name: 'strings'},
      { name: 'algorithms' },

      { name: 'data structures'},
      { name: 'fundamentals'},
      { name: 'strings'},

]

challengetag_data = [
  { challenge_id: 1, tag_id: 1 },
  { challenge_id: 1, tag_id: 2 },
  { challenge_id: 1, tag_id: 3 },
  { challenge_id: 1, tag_id: 4 },
  { challenge_id: 1, tag_id: 5 },
  { challenge_id: 2, tag_id: 6 },
  { challenge_id: 2, tag_id: 7 },
  
]


Challenge.create(challenge_data)
Tag.create(tag_data)
ChallengeTag.create(challengetag_data)
