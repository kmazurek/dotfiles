#!/bin/bash
set -euo pipefail

opi msbuild
opi mono-complete
opi dotnet-sdk

# After installing a code editor, select it in Unity's Edit->Preferences->External Tools and regenerate project files

# As of Unity 2020.3.x, libicu version below 7 is required, go for libicu69 for example
opi libicu
