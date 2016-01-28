class Participant < ApplicationRecord
  enum age: { "10-20": 0, "21-30": 1, "31-40": 2, "41-50": 3, "51-60": 4, "61-70": 5, "71-99": 6 }
  enum gender: { male: 0, female: 1 }
  enum web_usage: { "sehr oft": 0, "oft": 1, "manchmal": 2, "selten": 3, "nie": 4 }
end
