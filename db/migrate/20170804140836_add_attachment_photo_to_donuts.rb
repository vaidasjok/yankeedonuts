class AddAttachmentPhotoToDonuts < ActiveRecord::Migration
  def self.up
    change_table :donuts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :donuts, :photo
  end
end
