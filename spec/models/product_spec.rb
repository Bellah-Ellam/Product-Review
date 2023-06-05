describe Product do
  let(:game) { Product.first }

  before do
    game = Product.create(name: "iWatch", description: "This is an apple watch")
    user1 = User.create(name: "Bellah")
    user2 = User.create(name: "Ellam")
    Review.create(content: "A classic", product_id: product.id, user_id: user1.id)
    Review.create(content: "Timeless", product_id: product.id, user_id: user1.id)
  end
  
  it "has the correct columns in the games table" do
    expect(product).to have_attributes(name: "iWatch", description: "This is an apple watch")
  end

  it "knows about its associated reviews" do
    expect(product.reviews.count).to eq(2)
  end

  it "knows about its associated users" do
    expect(product.users.count).to eq(2)
  end

  it "can create an associated review with the #create method" do
    expect do
      product.reviews.create(score: 3, comment: "terrible")
    end.to change(Review, :count).by(1)
  end

  it "can create an associated review with the << method" do
    expect do
      product.reviews << Review.new(comment: "Awesome")
    end.to change(Review, :count).by(1)
  end
  
end
