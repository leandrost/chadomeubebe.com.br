class CreatePrelaunchSubscribers < ActiveRecord::Migration
  def change
    create_table :prelaunch_subscribers do |t|
      t.string :email

      t.timestamps
    end
  end
end
