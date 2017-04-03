class Profile < ActiveRecord::Base
	belongs_to :user
	validate :custom_validate
	validate :male_first_name_sue
	validates :gender,inclusion: {in: %w(male female)}

	def custom_validate
		if first_name.nil? && last_name.nil?
			errors.add(:not_both_null, "first_name and last_name can not both by null")
		end
	end
	def male_first_name_sue
		if gender == "male" && first_name == "Sue"
			errors.add(:male_with_first_name_sue, "can not be male with first name sue")
		end
	end
end


