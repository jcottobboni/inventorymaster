require 'test_helper'

module Inventorymaster
  class TransactionsControllerTest < ActionController::TestCase
    setup do
      @transaction = transactions(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:transactions)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create transaction" do
      assert_difference('Transaction.count') do
        post :create, transaction: { ammount: @transaction.ammount, average_cost: @transaction.average_cost, comment: @transaction.comment, date: @transaction.date, kind: @transaction.kind, location_id: @transaction.location_id, reason: @transaction.reason, serial_number: @transaction.serial_number, transaction_type_id: @transaction.transaction_type_id, unit_cost: @transaction.unit_cost, unit_sale: @transaction.unit_sale, upc: @transaction.upc, user_id: @transaction.user_id }
      end

      assert_redirected_to transaction_path(assigns(:transaction))
    end

    test "should show transaction" do
      get :show, id: @transaction
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @transaction
      assert_response :success
    end

    test "should update transaction" do
      patch :update, id: @transaction, transaction: { ammount: @transaction.ammount, average_cost: @transaction.average_cost, comment: @transaction.comment, date: @transaction.date, kind: @transaction.kind, location_id: @transaction.location_id, reason: @transaction.reason, serial_number: @transaction.serial_number, transaction_type_id: @transaction.transaction_type_id, unit_cost: @transaction.unit_cost, unit_sale: @transaction.unit_sale, upc: @transaction.upc, user_id: @transaction.user_id }
      assert_redirected_to transaction_path(assigns(:transaction))
    end

    test "should destroy transaction" do
      assert_difference('Transaction.count', -1) do
        delete :destroy, id: @transaction
      end

      assert_redirected_to transactions_path
    end
  end
end
