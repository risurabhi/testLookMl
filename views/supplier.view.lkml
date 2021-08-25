view: supplier {
  sql_table_name: cucu_test_db.supplier ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [contact_name, company_name]
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: factory_latitude {
    type: string
    sql: ${TABLE}.factory_latitude ;;
  }

  dimension: factory_longitude {
    type: string
    sql: ${TABLE}.factory_longitude ;;
  }

  dimension: factory_location {
    type: location
    sql_latitude: ${factory_latitude} ;;
    sql_longitude: ${factory_longitude} ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  measure: count {
    type: count
    drill_fields: [id, company_name, contact_name, product.count]
  }
}
