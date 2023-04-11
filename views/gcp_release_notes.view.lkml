view: gcp_release_notes {
  # derived_table: {
  #   sql: select
  #     description,
  #     release_note_type,
  #     published_at,
  #     product_name,
  #     product_version_name
  #     from bigquery-public-data.google_cloud_release_notes.release_notes
  #     ;;
  #   datagroup_trigger: looker_release_datagroup
  # }
  sql_table_name: bigquery-public-data.google_cloud_release_notes.release_notes ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: release_note_type {
    type: string
    sql: ${TABLE}.release_note_type ;;
  }

  dimension: published_at {
    type: date
    datatype: date
    sql: ${TABLE}.published_at ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_version_name {
    type: string
    sql: ${TABLE}.product_version_name ;;
  }

  set: detail {
    fields: [description, release_note_type, published_at, product_name, product_version_name]
  }
}
