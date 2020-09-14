require 'rails_helper'

RSpec.describe Studio do
  it {should have_many :movies}
end
