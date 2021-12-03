#!/bin/bash
set -euo pipefail

opi msbuild
opi mono-complete
opi dotnet-sdk

# After installing a code editor, select it in Unity's Edit->Preferences->External Tools and regenerate project files
