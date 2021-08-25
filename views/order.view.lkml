view: order {
  sql_table_name: cucu_test_db.`order` ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customer.first_name, customer.last_name, customer.id, order_item.count]
  }

  measure: custom_drillable_count {
    type: count
    drill_fields: [id, customer.first_name, customer.last_name, customer.id, order_item.count]
    html:
      <a href="{{ link }}" target=new>
        {% if value < 4 %}
          <font color=red><b>{{rendered_value}}</b></font>
        {% else %}
          <font color=green>{{rendered_value}}</font>
        {% endif %}
      </a> ;;
  }
}
# {{RUN_ID}} - for uniqueness
