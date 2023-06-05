describe Review do
  let(:review) { Review.first }

  before do
    game = Product.create(name: "iWatch", description: "This is an apple watch")
    user = User.create(name: "Bellah")
    Review.create(content: "A classic", product_id: product.id, user_id: user1.id)
  end
  
  it "has the correct columns in the reviews table" do
    expect(review).to have_attributes(content: "A classic", product_id: product.id, user_id: user1.id)
  end

  it "knows about its associated product" do
    product = Product.find(review.product_id)

    expect(review.product).to eq(product)
  end

  it "knows about its associated user" do
    user = User.find(review.user_id)

    expect(review.user).to eq(user)
  end

  it "can create an associated product using the product instance" do
    product = Product.first
    review = Review.create(score: 10, comment: "10 stars", product: product)
    
    expect(review.product).to eq(product)
  end

  it "can create an associated product with the #create_product method" do
    expect do
      review = Review.create(comment: "Awesome")
      review.create_product(title: "My favorite product")
      review.save
    end.to change(Game, :count).by(1)
  end
 
end
