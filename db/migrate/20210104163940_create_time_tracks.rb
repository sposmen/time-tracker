class CreateTimeTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :time_tracks do |t|
      t.string :description
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
