- dashboard: dash_custom_heights
  title: LookML Dash with Custom Heights
  layout: newspaper
  elements:
  - name: Orders per Customer First Name - Table
    title: Orders per Customer First Name - Table
    model: cucu_mysql_a810815e
    explore: order
    type: table
    table_theme: editable
    fields:
    - customer.first_name
    - order.count
    sorts:
    - order.count desc
    limit: 500
    row: 1
    col: 1
    width: 8
    height: 12
  - name: Customer Count - Single Value
    title: Customer Count - Single Value
    model: cucu_mysql_a810815e
    explore: order
    type: single_value
    fields:
    - order.count
    row: 5
    col: 1
    width: 20
    height: 6
  - name: Orders per Customer Last Name - Table
    title: Orders per Customer Last Name - Table
    model: cucu_mysql_a810815e
    explore: order
    type: table
    table_theme: editable
    fields:
    - customer.last_name
    - order.count
    sorts:
    - order.count desc
    limit: 500
    listen:
      Last Name Filter: customer.last_name
    row: 15
    col: 4
    width: 8
    height: 18
  - name: Orders per Customer Order Number - Table
    title: Orders per Customer Order Number - Table
    model: cucu_mysql_a810815e
    explore: order
    type: table
    table_theme: editable
    fields:
    - order.order_number
    - order.count
    sorts:
    - order.count desc
    limit: 500
    row: 1
    col: 10
    width: 4
    height: 4
  filters:
  - name: Last Name Filter
    title: Last Name Filter
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: cucu_mysql_a810815e
    explore: customer
    listens_to_filters: []
    field: customer.last_name
