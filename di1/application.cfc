/**
*
* @file  /home/caroline/web/fw1/di1/application.cfc
* @author
* @description
*
*/

component extends="org.corfield.framework" output="false"  {

	this.name="DI1Demo";

	variables.framework = {
		reloadApplicationOnEveryRequest: true
	};

	public void function setupApplication ()
	{
		var beanFactory = new ioc("./model");
		setBeanFactory(beanFactory);
	}
}
