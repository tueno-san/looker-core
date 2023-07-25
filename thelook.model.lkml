connection: "looker-core-bq"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: order_items {
 sql_always_where:
  {% if order_items.filter_state._is_filtered or order_items.filter_country._is_filtered %}
          ${user_id} in (select id from users where {% condition filter_state %} users.state {% endcondition %} or {% condition filter_country %} users.country {% endcondition %})
  {% else %} 1=1  {% endif %}      ;;


}

explore: users {}
