SELECT
    trt.teacher_id, trt.start_at, trt.removed_at, trt.type,
    CASE
      WHEN trt.removed_at is NOT NULL THEN al.created_at
    END AS AL_created_at, 
    al.created_by_user_id AL_created_by_user_id, al.action_type AL_action_type, al.comment AL_comment
FROM
    skyeng_timetable.teacher_regular_time trt
LEFT JOIN
    skyeng_timetable.action_log al 
    ON
        al.created_at = trt.removed_at
WHERE
    trt.type="unavailable" 
                                                    AND
                                                        trt.teacher_id = 1867030 /* Введи teacher_id */
                                                    AND
                                                        trt.start_at LIKE  '2018-09-26%' /* Введи дату урока ГГГГ-ММ-ДД */