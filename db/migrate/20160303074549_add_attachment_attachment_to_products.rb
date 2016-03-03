class AddAttachmentAttachmentToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :products, :attachment
  end
end
