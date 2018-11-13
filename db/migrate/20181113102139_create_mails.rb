class CreateMails < ActiveRecord::Migration[5.2]
  def change
    create_table :mails do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
