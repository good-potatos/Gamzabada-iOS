update:
	@tuist generate --project-only
project:
	$(update)
	@pod install
