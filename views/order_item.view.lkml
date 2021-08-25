view: order_item {
  sql_table_name: cucu_test_db.order_item ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }
  parameter: price_ranges {
    type: string
    allowed_value: {
      label: "Less than $50"
      value: "< 50"
    }
    allowed_value: {
      label: "Less than $100"
      value: "< 100"
    }
    allowed_value: {
      label: "More than $100"
      value: "> 100"
    }
  }

  measure: orders_in_price_range {
    label_from_parameter: price_ranges
    type: sum
    sql:
      CASE
        WHEN {% parameter price_ranges %} = '< 50' THEN
          ${unit_price} < 50
        WHEN {% parameter price_ranges %} = '< 100' THEN
          ${unit_price} < 100
        WHEN {% parameter price_ranges %} = '> 100' THEN
          ${unit_price} > 100
        ELSE
          NULL
      END ;;
  }


  measure: count {
    type: count
    drill_fields: [id, product.id, product.product_name, order.id]
  }
}
