connection: "cucu-mysql-connection"

# include all the views
include: "/views/**/*.view"
include: "/dash_newspaper_layout.dashboard.lookml"
include: "/dash_custom_heights.dashboard.lookml"
include: "/dash_single_filter.dashboard.lookml"

datagroup: cucu_mysql_a810815e_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cucu_mysql_a810815e_default_datagroup

explore: customer {}
explore: customer_for_validator {}

explore: order {
  join: customer {
    type: left_outer
    sql_on: ${order.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }
}

explore: order_item {
  join: product {
    type: left_outer
    sql_on: ${order_item.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${order_item.order_id} = ${order.id} ;;
    relationship: many_to_one
  }

  join: supplier {
    type: left_outer
    sql_on: ${product.supplier_id} = ${supplier.id} ;;
    relationship: many_to_one
  }

  join: customer {
    type: left_outer
    sql_on: ${order.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }
}

explore: product {
  join: supplier {
    type: left_outer
    sql_on: ${product.supplier_id} = ${supplier.id} ;;
    relationship: many_to_one
  }
}

explore: supplier {}
