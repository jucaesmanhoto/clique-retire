class OrdersController < ApplicationController
    def show
        @order = Order.first
        @retrieval_e_box_place_name = "Estação República L4"
    end
end
