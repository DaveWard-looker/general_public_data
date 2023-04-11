# The name of this view in Looker is "Usa 1910 Current"
view: usa_1910_current {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bigquery-public-data.usa_names.usa_1910_current`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Gender" in Explore.

  dimension: gender {
    type: string
    description: "Sex (M=male or F=female)"
    sql: ${TABLE}.gender ;;
  }

  dimension: name {
    type: string
    description: "Given name of a person at birth"
    sql: ${TABLE}.name ;;
  }

  dimension: number {
    type: number
    description: "Number of occurrences of the name"
    sql: ${TABLE}.number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number {
    type: sum
    sql: ${number} ;;
  }

  measure: average_number {
    type: average
    sql: ${number} ;;
  }

  dimension: state {
    type: string
    description: "2-digit state code"
    sql: ${TABLE}.state ;;
  }

  dimension: year {
    type: number
    description: "4-digit year of birth"
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
