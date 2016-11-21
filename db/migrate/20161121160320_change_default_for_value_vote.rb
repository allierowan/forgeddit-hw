class ChangeDefaultForValueVote < ActiveRecord::Migration[5.0]
  def change
    change_column_default :votes, :value, 0
  end
end
