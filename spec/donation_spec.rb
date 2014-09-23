describe Donation do
  it { should validate_presence_of :amount }
  it { should validate_presence_of :token }

  it { should belong_to :nonprofit }
end
