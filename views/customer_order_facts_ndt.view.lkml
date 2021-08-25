explore: customer_order_facts_ndt {
  label: "Customer Order Facts NDT"
}

view: customer_order_facts_ndt {
  derived_table: {
    persist_for: "24 hours"

    explore_source: order {
      column: customer_id {
        field: order.customer_id
      }
      column: lifetime_amount {
        field: order.total_amount
      }
    }

    indexes: ["customer_id"]
  }

  dimension: customer_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.customer_id ;;
  }
  dimension: lifetime_amount {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.lifetime_amount ;;
  }
}
