/**
*
* @file  /home/caroline/web/fw1/di1/controllers/main.cfc
* @author
* @description
*
*/

component output="false" accessors="true"
{
	property name="personService";

	public void function default (required any rc)
	{
		rc.qPeople = getPersonService().getPeople();
	}
}
