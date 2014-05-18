class Block < ActiveRecord::Base

	acts_as_paranoid

	belongs_to :miner

	validates :version, :hash_curr_block, :hash_prev_block, :rewarded_transaction_fee, :rewarded_bitcoins, allow_blank: false, length: { minimum: 1 }

end
