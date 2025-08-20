-- column_name REGEXP 'pattern'
select * from users where mail COLLATE 'utf8mb3_bin' regexp  '^[A-Za-z][A-Za-z0-9_\\-\\.]*@leetcode\\.com$'