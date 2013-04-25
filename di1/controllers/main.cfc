/**
*
* @file  /home/caroline/web/fw1/di1/controllers/main.cfc
* @author
* @description
*
*/

component output="false" accessors="true"
{
	property name="brandsService";

	public void function default (required any rc)
	{
		rc.brandList = getBrandService().listBrands();
	}
}
