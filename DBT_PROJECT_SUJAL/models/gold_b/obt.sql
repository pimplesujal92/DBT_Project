
{% set config = [
    {
        "table": "dbt_project.silver_t.orders_1",
        "columns": """
            o.order_id,
            o.customer_id,
            o.store_id,
            o.order_timestamp,
            o.payment_method,
            o.order_status,
            o.total_amount,
            o.created_timestamp,
            o.updated_timestamp,
            o.is_active
        """,
        "alias": "o"
    },

    {
        "table": "dbt_project.silver_t.customers_1",
        "columns": """
            c.customer_id AS customer_customer_id,
            c.first_name,
            c.last_name,
            c.email,
            c.phone,
            c.city AS customer_city,
            c.province AS customer_province,
            c.country AS customer_country,
            c.created_timestamp AS customer_created_timestamp,
            c.updated_timestamp AS customer_updated_timestamp,
            c.is_active AS customer_is_active
        """,
        "join_condition": "o.customer_id = c.customer_id",
        "alias": "c"
    },

    {
        "table": "dbt_project.silver_t.stores",
        "columns": """
            s.store_id AS store_store_id,
            s.store_name,
            s.city AS store_city,
            s.province AS store_province,
            s.country AS store_country,
            s.created_timestamp AS store_created_timestamp,
            s.updated_timestamp AS store_updated_timestamp,
            s.is_active AS store_is_active
        """,
        "join_condition": "o.store_id = s.store_id",
        "alias": "s"
    }
] %}


SELECT

{% for configs in config %}

    {{ configs["columns"] }}

    {% if not loop.last %}, {% endif %}

{% endfor %}

FROM

{% for configs in config %}

    {% if loop.first %}

        {{ configs["table"] }} AS {{ configs["alias"] }}

    {% else %}

        LEFT JOIN

        {{ configs["table"] }} AS {{ configs["alias"] }}

        ON {{ configs["join_condition"] }}

    {% endif %}

{% endfor %}


     
    

