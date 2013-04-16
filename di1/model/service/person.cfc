/**
*
* @file  /home/caroline/web/fw1/di1/model/service/person.cfc
* @author
* @description
*
*/

component output="false" accessors="true"  {

	property name="personDAO";

	public query function getPeople ()
	{
		var qry = getPersonDAO().getPeople();
		return qry;
	}
}
