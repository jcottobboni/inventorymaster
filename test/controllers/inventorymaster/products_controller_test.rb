require 'test_helper'

module Inventorymaster
  class ProductsControllerTest < ActionController::TestCase
    setup do
      @product = products(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:products)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create product" do
      assert_difference('Product.count') do
        post :create, product: { area_id: @product.area_id, labels: @product.labels, manufacturer_id: @product.manufacturer_id, minimum_stock_count: @product.minimum_stock_count, name: @product.name, sku: @product.sku, summary: @product.summary, upc: @product.upc }
      end

      assert_redirected_to product_path(assigns(:product))
    end

    test "should show product" do
      get :show, id: @product
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @product
      assert_response :success
    end

    test "should update product" do
      patch :update, id: @product, product: { area_id: @product.area_id, labels: @product.labels, manufacturer_id: @product.manufacturer_id, minimum_stock_count: @product.minimum_stock_count, name: @product.name, sku: @product.sku, summary: @product.summary, upc: @product.upc }
      assert_redirected_to product_path(assigns(:product))
    end

    test "should destroy product" do
      assert_difference('Product.count', -1) do
        delete :destroy, id: @product
      end

      assert_redirected_to products_path
    end
  end
end
