class AddCaseInsensitiveIndexOnChallengesTitle < ActiveRecord::Migration[5.0]
  def change
    execute "CREATE UNIQUE INDEX index_challenges_on_lowercase_title ON challenges (lower(title));"
  end
end
