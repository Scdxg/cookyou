$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    & .\gradlew.bat --console=plain --max-workers=4 :app:assembleDebug @args
    if ($LASTEXITCODE -ne 0) { throw 'Gradle build failed.' }
    New-Item -ItemType Directory -Force -Path dist | Out-Null
    Copy-Item -LiteralPath 'app/build/outputs/apk/debug/app-debug.apk' -Destination 'dist/cookyou-0.1.3.apk'
} finally { Pop-Location }
