# Variables
VSCE ?= npx --yes vsce
VSCODE ?= code

# Latest packaged VSIX (evaluated at parse time; rechecked in recipe as fallback)
VSIX := $(shell ls -t *.vsix 2>/dev/null | head -n1)

.PHONY: make-package install clean

make-package:
	@echo "Packaging VS Code extension..."
	$(VSCE) package

install: make-package
	@set -e; \
	if ! command -v $(VSCODE) >/dev/null 2>&1; then \
		echo "VS Code CLI '$(VSCODE)' not found. Set VSCODE=/path/to/code"; \
		exit 1; \
	fi; \
	VSIX_FILE="$(VSIX)"; \
	if [ -z "$$VSIX_FILE" ]; then \
		VSIX_FILE=$$(ls -t *.vsix 2>/dev/null | head -n1); \
	fi; \
	if [ -z "$$VSIX_FILE" ]; then \
		echo "No .vsix found. Run 'make make-package' first."; \
		exit 1; \
	fi; \
	$(VSCODE) --install-extension "$$VSIX_FILE" --force; \
	echo "Installed $$VSIX_FILE"

clean:
	rm -f *.vsix




