require 'test_helper'

class ChefTest < ActiveSupport::TestCase
	def setup
		@chef = Chef.new(chefname: "Sanjeev Kapoor", email: "sanjeev@foodfood.com")
	end

	test "chefname must be present" do
		@chef.chefname = " "
		assert_not @chef.valid?
	end

	test "chefname length should not be too long" do
		@chef.chefname = "a"*41
		assert_not @chef.valid?
	end

	test "chefname length should not be too short" do
		@chef.chefname = "aa"
		assert_not @chef.valid?
	end

	test "email should be present" do 
		@chef.email = " "
		assert_not @chef.valid?
	end

	test "email length should be within bound" do
		@chef.email = "a"*101 + "example.com"
		assert_not @chef.valid?
	end
end