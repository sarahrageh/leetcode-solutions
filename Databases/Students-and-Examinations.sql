select 
    t1.student_id, student_name, t2.subject_name, count(t3.student_id) as attended_exams
    from students as t1 cross join subjects as t2 left join examinations as t3 
    on t1.student_id = t3.student_id and t2.subject_name = t3.subject_name 
    group by t1.student_id, t2.subject_name
    order by t1.student_id, t2.subject_name;