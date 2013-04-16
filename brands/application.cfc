component extends="org.corfield.framework" {

	this.name = 'website' & Left(Hash(CGI.SERVER_NAME), 10);
	this.sessionmanagement = true;
	this.sessiontimeout = CreateTimeSpan(60, 60, 0, 0);

	variables.framework = {
		action = 'action',
		usingSubsystems = false,
		defaultSection = 'main',
		defaultItem = 'default',
		home = 'main.default',
		reload = 'reload',
		suppressImplicitService = true
	};

	variables.framework.reloadApplicationOnEveryRequest = true;

	private function setupApplication() {
		var bf = CreateObject("component", "org.corfield.ioc").init("services");
		setBeanFactory(bf);
	}

}
