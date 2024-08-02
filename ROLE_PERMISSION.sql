--CHECK User Role with User's name

SELECT 
    dp.name AS RoleName,
    mp.name AS UserName
FROM 
    sys.database_role_members drm
INNER JOIN 
    sys.database_principals dp ON drm.role_principal_id = dp.principal_id
INNER JOIN 
    sys.database_principals mp ON drm.member_principal_id = mp.principal_id
WHERE 
    mp.name = 'NAME';

--CHECK User Permissions with User's name

SELECT
    u.name AS UserName,
    dp.permission_name,
    dp.state_desc,
    o.type_desc AS ObjectType,
    o.name AS ObjectName
FROM
    sys.database_permissions dp
    JOIN sys.database_principals u ON dp.grantee_principal_id = u.principal_id
    LEFT JOIN sys.objects o ON dp.major_id = o.object_id
WHERE
    u.name = 'NAME';