require 'rails_helper'

describe Journal do
  it { should have_many(:notes) }
  it { should belong_to(:user) }
end