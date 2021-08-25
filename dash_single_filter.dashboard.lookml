- dashboard: dash_single_filter
  title: LookML Dash with Single Filter
  layout: newspaper
  elements:
  - name: Orders per Customer - Table
    title: Orders per Customer - Table
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
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Last Name Filter: customer.last_name
    row: 0
    col: 0
    width: 8
    height: 6
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
