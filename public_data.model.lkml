connection: "looker_private_demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/views/bigquery-public-data.google_trends/*.view.lkml"
include: "/views/bigquery-public-data.usa_names/usa_1910_current.view.lkml"

datagroup: looker_release_datagroup {
  sql_trigger: select count(*) from bigquery-public-data.google_cloud_release_notes.release_notes where product_name = 'Looker' ;;
  max_cache_age: "9000 hours"
}
explore: gcp_release_notes {}

explore: international_top_terms {}

explore: usa_1910_current {}
