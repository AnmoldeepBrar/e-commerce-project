ActiveAdmin.register_page "Customer Orders" do
    menu priority: 1
    
    content title: "Customers with Orders" do
        
      Customer.includes(:orders).each do |customer|
        panel "#{customer.name}'s Orders" do
          table_for customer.orders do
            
            column "Customer ID" do |order|
              order.customer.id
            end
            column "Email" do |order|
              order.customer.email
            end
            
            column "Order ID", :id
            
            column "Products" do |order|
              order.order_items.map(&:product).map(&:name).join(", ")
            end
            column "Quantity" do |order|
              order.order_items.map(&:quantity).join(", ")
            end
            
            column "Address" do |order|
              order.customer.address
            end
            column "Province" do |order|
              order.customer.province.name
            end
            # GST, PST, HST
            column "GST" do |order|
              order.customer.province.gst || 0
            end
            column "PST" do |order|
              order.customer.province.pst || 0
            end
            column "HST" do |order|
              order.customer.province.hst || 0
            end
            # Total and Grand Total
            column "Total" do |order|
              number_to_currency(order.total_amount)
            end
            column "Grand Total" do |order|
              grand_total = order.total_amount +
                            (order.total_amount * (order.customer.province.pst || 0)) +
                            (order.total_amount * (order.customer.province.gst || 0)) +
                            (order.total_amount * (order.customer.province.hst || 0))
              number_to_currency(grand_total)
            end
          end
        end
      end
    end
end
  