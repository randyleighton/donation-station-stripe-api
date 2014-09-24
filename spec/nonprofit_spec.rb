describe Nonprofit do
  it { should validate_presence_of :name }

  it { should have_many :donations }
  it { should have_many :subscriptions }

end
