{{ config(
    materialized='incremental',
    schema='DBTPROJ_TGT',
    alias='load_csv_from_gcs'
) }}

SELECT
    *
FROM
    `myprojtest-439206.DBTPROJ_TEST.stg_load_csv_from_gcs`

{% if is_incremental() %}
WHERE SNO > (
    SELECT MAX(SNO) 
    FROM {{ this }}
)
{% endif %}
