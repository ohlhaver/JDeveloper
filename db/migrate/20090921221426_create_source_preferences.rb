class CreateSourcePreferences < ActiveRecord::Migration
  def self.up
    create_table :source_preferences do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :source_preferences
  end
end
