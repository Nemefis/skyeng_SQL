SELECT 
  c.student_id, c.teacher_id, c.start_at, c.class_status_id, c.removed_at, 
  al.created_at AL_created_at, al.action_type AL_action_type, al.created_by_user_id AL_created_by_user_id, 
  CASE
    WHEN c.removed_at is NULL THEN cs.id
  END AS CS_ID,

    CASE
      WHEN c.removed_at is NULL THEN cs.status 
    END AS CS_status,

    CASE
      WHEN c.removed_at is NULL THEN cs.created_by_user_id
    END AS CS_created_by_user_id,

    CASE
      WHEN c.removed_at is NULL THEN cs.comment is NULL
    END AS CS_comment

  FROM 
    (SELECT * 
      FROM skyeng_timetable.class 
      WHERE 

                                                                          student_id  =     457248 /* Введи student_id */
                                                                          and 
                                                                          start_at    LIKE  '2019-01-08%' /* Введи дату начала урока ГГГГ-ММ-ДД */

    ) c 
      LEFT JOIN skyeng_timetable.action_log al ON c.removed_at = al.created_at
      LEFT JOIN skyeng_timetable.class_status cs ON c.class_status_id=cs.id