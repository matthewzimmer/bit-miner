class Miner < ActiveRecord::Base

	class UniqueEmailValidator < ActiveModel::Validator
		def validate(record)
			existing_item = Miner.where('email = ?', record.email).first
			if !existing_item.nil? && record.id != existing_item.id
				record.errors.add(:email, "'#{record.email}' is already taken. Try a different email.")
			end
		end
	end

	acts_as_paranoid

	has_one :profile, dependent: :destroy
	has_one :stat_sheet, dependent: :destroy
	has_many :blocks, dependent: :destroy # TODO Utilize Blockchain.info API to automatically generate and validate blocks for each miner based in their public_key.

	accepts_nested_attributes_for :profile
	accepts_nested_attributes_for :stat_sheet
	accepts_nested_attributes_for :blocks, allow_destroy: true

	validates :email, length:{ minimum: 3, maximum: 50 }
	validates_with UniqueEmailValidator, on: :create
	validates_with UniqueEmailValidator, on: :update
end
