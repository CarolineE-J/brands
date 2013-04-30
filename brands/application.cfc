component extends="org.corfield.framework" {

	this.name = 'website' & Left(Hash(CGI.SERVER_NAME), 10);
	this.sessionmanagement = true;
	this.sessiontimeout = CreateTimeSpan(0, 2, 0, 0);
	variables.framework = {
		action = 'action',
		usingSubsystems = false,
		defaultSection = 'main',
		defaultItem = 'default',
		home = 'main.default',
		reload = 'reload'
  		/* password = 'lovehoney', */ };

	/* At the start of each request, the controller/service cache is cleared and setupApplication() is executed. */
	variables.framework.reloadApplicationOnEveryRequest = true;

	public function setupApplication() {
		// setup bean factory
		var beanFactory = CreateObject("component", "brands.ioc").init("model/");
		setBeanFactory(beanFactory);
	}

}
