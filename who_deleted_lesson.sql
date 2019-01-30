SELECT 
  a.student_id, a.teacher_id, a.start_at, a.class_status_id, a.removed_at, 
  b.created_at AL_created_at, b.action_type AL_action_type, b.created_by_user_id AL_created_by_user_id, 
  c.id CS_id, c.status CS_status, c.created_by_user_id CS_created_by_user_id, c.comment CS_comment,
  CASE
    WHEN a.removed_at is NULL THEN c.id is NULL
    ELSE b.created_at is NULL
END 
  FROM 
    (SELECT * 
      FROM skyeng_timetable.class 
      WHERE 

                                                                          student_id  =     457248 
                                                                          and 
                                                                          start_at    LIKE  '2017-10-15%'

    ) a 
      LEFT JOIN skyeng_timetable.action_log b ON a.removed_at = b.created_at
      LEFT JOIN skyeng_timetable.class_status c ON a.class_status_id=c.id