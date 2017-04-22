class Mail < ActiveRecord::Migration[5.0]
  def change
    create_table :mails do |t|
      t.string :size
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
