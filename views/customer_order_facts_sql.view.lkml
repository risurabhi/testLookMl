explore: customer_order_facts_sql {
  label: "Customer Order Facts SQL"
}

view: customer_order_facts_sql {
  derived_table: {
    persist_for: "24 hours"
    sql: SELECT customer_id, SUM(amount) AS lifetime_amount FROM `order` GROUP BY customer_id ;;
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
