class WorkOrdersController < ApplicationController

  def index
    @technicians = Technician.all
    @time_between = [] 
    @order_cells = []

    Technician.all.each do |tech|
        orders = tech.work_orders.order(time: :asc)
        orders.each_with_index do |work_order, i|

        #Define work order container and parse the time value down to hours/minutes
        container = {}
        container[:start_time] = work_order.time.strftime("%H:%M")
        container[:min] = work_order.time.min
        container[:hour] = work_order.time.hour

        #Calculate block height of work orders based on a percentage determined from time of work order
        container[:height] = "#{(100.0 * work_order.duration / 60.0).to_i.to_s}%"
        container[:top] = "#{(100.0 * work_order.time.min / 60.0).to_i.to_s}%"
        container[:work_order] = work_order        
        container[:range] = determine_range(work_order)
        
        @order_cells[work_order.time.hour] = {} if @order_cells[work_order.time.hour].nil?

        @order_cells[work_order.time.hour][tech.id.to_s.to_sym] = [] if @order_cells[work_order.time.hour][tech.id.to_s.to_sym].nil?

        @order_cells[work_order.time.hour][tech.id.to_s.to_sym].push(container)

        if i > 0 && i < orders.length
          prior_order = orders[i-1]
          start_of_time_between = prior_order.time + prior_order.duration.minutes
          time_between_length = ((work_order.time - start_of_time_between) / 60.0).to_i
          if time_between_length > 0
            #Define block of time between orders
            time_data = {}
            time_data[:first_name] = prior_order.location.name
            time_data[:last_name] =  work_order.location.name
            time_data[:duration] = time_between_length

            #Calculate block height of time in between orders
            time_data[:height] = "#{(100.0 * time_between_length / 60.0).to_i.to_s}%"
            time_data[:top] = "#{(100.0 * start_of_time_between.min / 60.0).to_i.to_s}%"

            @time_between[start_of_time_between.hour] = {} if @time_between[start_of_time_between.hour].nil?

            @time_between[start_of_time_between.hour][tech.id.to_s.to_sym] = [] if @time_between[start_of_time_between.hour][tech.id.to_s.to_sym].nil?

            @time_between[start_of_time_between.hour][tech.id.to_s.to_sym].push(time_data)
          end
        end
      end
    end
  end

  def determine_range(order)
      start_mins = order.time.hour * 60 + order.time.min
      return (start_mins)..(start_mins + order.duration)
  end

end