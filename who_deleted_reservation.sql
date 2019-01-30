SELECT
    tst.teacher_id, tst.start_at, tst.removed_at, tst.type,
    CASE
      WHEN tst.removed_at is NOT NULL THEN al.created_at
    END AS AL_created_at, 
    al.created_by_user_id AL_created_by_user_id, al.action_type AL_action_type, al.comment AL_comment
FROM
    skyeng_timetable.teacher_single_time tst
LEFT JOIN
    skyeng_timetable.action_log al 
    ON
        al.created_at = tst.removed_at
WHERE
    tst.type="unavailable" 
                                                    AND
                                                        tst.teacher_id=1867030
                                                    AND
                                                        tst.start_at LIKE  '2018-09-26%'