describe Donation do
  it { should validate_presence_of :amount }
  it { should validate_presence_of :token }

  it { should belong_to :nonprofit }
  it { should belong_to :user }

  it "should multiply the amount by 100 to convert to cents for stripe" do
    donation = Donation.new(amount: 10,token: "abc123")
    donation.make_some_cents
    expect(donation.amount).to eq 1000
  end

end
