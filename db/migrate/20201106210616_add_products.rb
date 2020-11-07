class AddProducts < ActiveRecord::Migration[6.0]
  def change
    Product.create(
      :title=>'Гавайская',
      :description=>'Это Гавайская пицца.',
      :price=>350,
      :size=>30,
      :is_spicy=>false,
      :is_veg=>false,
      :is_best_offer=>false,
      :path_to_image=>'/images/hawai.jpg'
    )
    Product.create(
      :title=>'Пеперонни',
      :description=>'Это острая пицца.',
      :price=>450,
      :size=>30,
      :is_spicy=>false,
      :is_veg=>false,
      :is_best_offer=>true,
      :path_to_image=>'/images/pepperoni.png'
    )
    Product.create(
      :title=>'Овощная',
      :description=>'Это вегатарианская пицца.',
      :price=>400,
      :size=>30,
      :is_spicy=>false,
      :is_veg=>false,
      :is_best_offer=>false,
      :path_to_image=>'/images/veg.jpg'
    )
  end
end
