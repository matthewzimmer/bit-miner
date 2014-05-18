class Profile < ActiveRecord::Base

	class UniqueNicknameValidator < ActiveModel::Validator
		def validate(record)
			existing_item = Profile.where('nickname = ?', record.nickname).first
			if !existing_item.nil? && record.id != existing_item.id
				record.errors.add(:nickname, "'#{record.nickname}' is already taken. Try a different nickname.")
			end
		end
	end

	acts_as_paranoid

	belongs_to :miner

	has_attached_file :avatar, {
			:styles => {
					:thumb => '100x100>',
					:medium => '200x200#',
					:large => '300x300>'
			}
	}.merge(PAPERCLIP_OPTIONS)

	validates :nickname, :first_name, :last_name, length: { minimum: 3, maximum: 50 }
	validates :public_key, length: { minimum: 1 }, allow_blank: false
	validates :bio, length: { maximum: 255 }
	validates_with UniqueNicknameValidator, on: :create
	validates_with UniqueNicknameValidator, on: :update

	def full_name
		"#{first_name} #{last_name}"
	end

	def avatar_medium_url
		avatar.url(:medium)
	end

end
