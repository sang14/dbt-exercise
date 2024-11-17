/**
Loading acceptance data into the staging from seeds.
*/

WITH acceptance_report AS (
    SELECT
       *
    FROM {{ ref('Globepay_Acceptance_Report') }}
)

SELECT * FROM acceptance_report
