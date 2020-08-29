class OrdersController < ApplicationController
    def show
        @order = Order.first
    end
end
