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
		reload = 'reload'	};

	/* At the start of each request, the controller/service cache is cleared and setupApplication() is executed. */
	variables.framework.reloadApplicationOnEveryRequest = true;

	private function setupApplication() {
		// setup bean factory
		var bf = CreateObject("component", "org.corfield.ioc").init("model");
		setBeanFactory(bf);

		// add meta data bean to factory
		bf.addBean( "brands", new model.dao.brands() );
	}
}
