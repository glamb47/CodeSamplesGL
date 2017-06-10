ALTER PROCEDURE [dbo].[ProfilePage_Select]
		@Id int

as

BEGIN

	SELECT 
		p.id
		,p.firstname
		,p.lastname
		,p.middleinitial
		,p.gender
		,p.dob
		,p.ComplexUserId
		,a.line1
		,a.line2
		,a.city
		,a.state
		,a.postalcode
		,m.about

	FROM 
		people p LEFT JOIN personaddress pa ON p.id = pa.personid
			LEFT JOIN address a ON pa.addressid = a.id
			LEFT JOIN education e ON p.id = e.personid
			LEFT JOIN workhistory w ON p.id = w.personid
			LEFT JOIN aboutme m ON p.id = m.personid
	WHERE 
		p.id = @Id

	SELECT
		w.company
		,w.title
		,w.description

	FROM 
		workhistory w join people p on w.personid = p.id

	WHERE
		w.personid = @Id

	SELECT
		e.school
		,e.subject
		,e.state
		,e.city

	FROM 
		education e join people p on e.personid = p.id

	WHERE
		e.personid = @Id

select
    st.name, st.description
from
    personskill ps join skilltags st on ps.skillid=st.id
where 
    ps.personid= @Id

select
	s.Name
	,s.ValueType
	,s.CategoryId
	,pst.SettingsId
	,pst.PersonId
	,pst.Value
from
	personsettings pst JOIN settings s on pst.settingsid = s.id
where
	pst.personid = @id

select
	r.name
from
	aspnetroles r left join aspnetuserroles ur on r.id = ur.roleid
	left join aspnetusers u on u.id = ur.userid
	left join people p on p.complexuserid = u.id
where
	p.id = @id


select
	j.id
	,j.companyname
	,j.companylocation
	,j.companyindustry
	,j.title
	,j.description
	,j.type
	,j.salary
from job j JOIN people p on j.personid = p.id
	join ProductJob pj on pj.JobId = j.Id

where j.personid = @id

select
	f.fileurl
from [file] f join people p on f.personid = p.id

where f.personid = @id AND f.fileurl LIKE '%ProfilePicture%'
	



END

/* ---------- TEST CODE ----------

DECLARE @Id int = 9;

EXECUTE dbo.ProfilePage_Select @Id

*/
