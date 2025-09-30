CREATE EXTENSION IF NOT EXISTS anon CASCADE;
SELECT anon.init();
select anon.shuffle_column('legacy.tenants', 'name', 'idx');
select anon.shuffle_column('legacy.tenants', 'sid', 'idx');
select anon.shuffle_column('legacy.tenants', 'ename', 'idx');
select anon.shuffle_column('legacy.landlords', 'name', 'idx');
select anon.shuffle_column('legacy.landlords', 'sid', 'idx');
select anon.shuffle_column('legacy.landlords', 'pname', 'idx');

-- 房客 --

SECURITY LABEL FOR anon
  ON COLUMN legacy.tenants.name
  IS 'MASKED WITH FUNCTION anon.partial(name,1, ''xx'', 0)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.tenants.sid
  IS 'MASKED WITH FUNCTION
      CASE
        WHEN length(sid) >= 3 THEN
          substring(sid, 1, length(sid)-3) || lpad((random()*1000)::int::text, 3, ''0'')
        ELSE
          sid
      END';


SECURITY LABEL FOR anon
  ON COLUMN legacy.tenants.tel
  IS 'MASKED WITH FUNCTION anon.partial(tel,5, ''xxx'', 3)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.tenants.email
  IS 'MASKED WITH FUNCTION anon.partial_email(email)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.tenants.lineid
  IS 'MASKED WITH FUNCTION anon.partial(lineid,1, ''xxx'', 3)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.tenants.address
  IS 'MASKED WITH FUNCTION anon.partial(address,1, ''***'', 3)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.tenants.ename
  IS 'MASKED WITH FUNCTION anon.partial(ename,1, ''xx'', 0)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.tenants.etel
  IS 'MASKED WITH FUNCTION anon.partial(etel,5, ''xxx'', 3)';

-- 房東 --

SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.name
  IS 'MASKED WITH FUNCTION anon.partial(name,1, ''xx'', 0)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.sid
  IS 'MASKED WITH FUNCTION
      CASE
        WHEN length(sid) >= 3 THEN
          substring(sid, 1, length(sid)-3) || lpad((random()*1000)::int::text, 3, ''0'')
        ELSE
          sid
      END';


SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.sid
  IS 'MASKED WITH FUNCTION anon.partial(sid,1, ''34'', 8)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.tel
  IS 'MASKED WITH FUNCTION anon.partial(tel,5, ''xxx'', 3)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.email
  IS 'MASKED WITH FUNCTION anon.partial_email(email)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.lineid
  IS 'MASKED WITH FUNCTION anon.partial(lineid,1, ''xxx'', 3)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.address
  IS 'MASKED WITH FUNCTION anon.partial(address,1, ''***'', 3)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.caddress
  IS 'MASKED WITH FUNCTION anon.partial(caddress,1, ''***'', 3)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.pname
  IS 'MASKED WITH FUNCTION anon.partial(pname,1, ''xx'', 0)';

SECURITY LABEL FOR anon
  ON COLUMN legacy.landlords.ptel
  IS 'MASKED WITH FUNCTION anon.partial(ptel,5, ''xxx'', 3)';


SELECT anon.anonymize_database();
