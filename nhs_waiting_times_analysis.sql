SELECT
    patient_type,

    MAX(CASE
        WHEN month_ending = '2024-09-30'
        THEN waits
    END) AS completed_sep_2024,

    MAX(CASE
        WHEN month_ending = '2026-09-30'
        THEN waits
    END) AS completed_sep_2026,

    ROUND(
        100.0 *
        (
            MAX(CASE WHEN month_ending = '2026-09-30' THEN waits END)
            -
            MAX(CASE WHEN month_ending = '2024-09-30' THEN waits END)
        )
        /
        NULLIF(
            MAX(CASE WHEN month_ending = '2024-09-30' THEN waits END),
            0
        ),
        2
    ) AS percentage_change

FROM public.waiting_times_clean

WHERE hbt = 'S92000003'
  AND specialty = 'Z9'
  AND wait_type = 'Completed'
  AND month_ending IN ('2024-09-30', '2026-09-30')

GROUP BY patient_type
ORDER BY patient_type;

SELECT
    month_ending,
    patient_type,
    median,
    percentile_90,
    medianqf,
    percentile_90_qf
FROM public.waiting_times_clean
WHERE hbt = 'S92000003'
  AND specialty = 'Z9'
  AND wait_type = 'Ongoing'
ORDER BY month_ending, patient_type;

SELECT
    month_ending,
    patient_type,
    waits AS total_waits,
    waits_over_12_weeks,
    waits_over_26_weeks,
    waits_over_52_weeks,
    waits_over_104_weeks,
    ROUND(
        100.0 * waits_over_52_weeks / NULLIF(waits, 0),
        2
    ) AS pct_over_52_weeks,
    median,
    percentile_90
FROM public.waiting_times_clean
WHERE hbt = 'S92000003'
  AND specialty = 'Z9'
  AND wait_type = 'Ongoing'
ORDER BY month_ending, patient_type;

SELECT
    w.month_ending,
    l.health_board,
    w.patient_type,
    w.waits AS total_waits,
    w.waits_over_52_weeks,
    ROUND(
        100.0 * w.waits_over_52_weeks / NULLIF(w.waits, 0),
        2
    ) AS pct_over_52_weeks
FROM public.waiting_times_clean AS w
JOIN public.health_board_lookup AS l
    ON w.hbt = l.hbt
WHERE w.specialty = 'Z9'
  AND w.wait_type = 'Ongoing'
  AND w.month_ending IN ('2024-09-30', '2026-09-30')
ORDER BY
    w.month_ending,
    w.patient_type,
    pct_over_52_weeks DESC;

SELECT
    w.month_ending,
    w.specialty AS specialty_code,
    s."SpecialtyName" AS specialty_name,
    w.patient_type,
    w.waits AS total_waits,
    w.waits_over_52_weeks,
    ROUND(
        100.0 * w.waits_over_52_weeks / NULLIF(w.waits, 0),
        2
    ) AS pct_over_52_weeks
FROM public.waiting_times_clean AS w
JOIN public.specialty_codes AS s
    ON w.specialty = s.specialty
WHERE w.hbt = 'S92000003'
  AND w.wait_type = 'Ongoing'
  AND w.specialty <> 'Z9'
  AND w.month_ending IN ('2024-09-30', '2026-09-30')
ORDER BY
    w.month_ending,
    w.patient_type,
    w.waits_over_52_weeks DESC NULLS LAST;

SELECT
    month_ending,
    patient_type,
    waits AS completed_waits
FROM public.waiting_times_clean
WHERE hbt = 'S92000003'
  AND specialty = 'Z9'
  AND wait_type = 'Completed'
ORDER BY month_ending, patient_type;