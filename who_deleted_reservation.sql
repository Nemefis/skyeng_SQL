SELECT tst.teacher_id, tst.start_at, tst.created_at, tst.removed_at, tst.type, tst.comment
  FROM skyeng_timetable.teacher_single_time tst  
  WHERE tst.teacher_id=1867030
  AND tst.type="unavailable"