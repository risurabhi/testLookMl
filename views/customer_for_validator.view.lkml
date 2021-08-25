view: customer_for_validator {
  sql_table_name: cucu_test_db.customer ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    drill_fields: [last_name]
  }

  dimension: is_adult {
    type: yesno
    sql: ${TABLE}.is_adult ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, order.count]
  }
}
