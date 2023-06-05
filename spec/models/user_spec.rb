describe User do
  let(:user) { User.first }

  before do
    user = User.create(name: "Bellah")
    game = Product.create(name: "iWatch", description: "This is an apple watch")
    Review.create(score: 8, comment: "A classic", product_id: product.id, user_id: user.id)
  end
  
  it "has the correct columns in the games table" do
    expect(user).to have_attributes(name: "Bellah")
  end

  it "knows about its associated reviews" do
    expect(user.reviews.count).to eq(1)
  end

  it "knows about its associated products" do
    expect(user.products.count).to eq(1)
  end
  
end
