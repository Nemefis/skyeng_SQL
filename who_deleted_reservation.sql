SELECT 
    tst.teacher_id, tst.start_at, tst.created_at, tst.removed_at, tst.type, tst.comment,

    CASE
      WHEN tst.removed_at is NOT NULL THEN al.created_at
    END AS AL_created_at, al.created_by_user_id

FROM skyeng_timetable.teacher_single_time tst
LEFT JOIN skyeng_timetable.action_log al 
ON al.created_at = tst.removed_at

WHERE tst.teacher_id=1867030
AND tst.type="unavailable" AND tst.start_at LIKE  '2018-09-26%'