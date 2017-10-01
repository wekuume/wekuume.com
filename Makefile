default: validate

help:
	@echo "Commands:"
	@echo "	make					TODO Validate content"
	@echo "	make install			Trigger wekuume-content build"
	@echo ""

validate: 
	@echo "Validate!"

define BODY
{ 
  "request": {
    "branch": "master"
  }
}
endef
RESULT=$(shell curl -v -v -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Travis-API-Version: 3" -H "Authorization: token $TOKEN" -d "$${BODY}" https://api.travis-ci.org/repo/wekuume%2Fwekuume-curation/requests)

install:
	@echo ${RESULT}