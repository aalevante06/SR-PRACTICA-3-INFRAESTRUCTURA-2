# JUMP-SERVER2174 — comandos principales usados para RemoteApp / RD Web Client
# Ejecutar PowerShell como Administrador.

Import-Module RemoteDesktop

# RemoteApp principal: navegador Web
New-RDRemoteApp `
  -CollectionName "QuickSessionCollection" `
  -DisplayName "Internet Explorer" `
  -FilePath "C:\Program Files\Internet Explorer\iexplore.exe" `
  -Alias "InternetExplorer" `
  -ConnectionBroker "JUMP-SERVER2174.INFRA2.LOCAL"

# PuTTY y Remote Desktop Connection se publicaron también en la colección.
# Los grupos usados en User Assignment fueron:
#   INFRA2\RDS-SIN-PRIV -> Internet Explorer
#   INFRA2\RDS-PRIV     -> Internet Explorer + PuTTY + Remote Desktop Connection

# Instalar/actualizar PowerShellGet y RD Web Client Management
Install-Module PowerShellGet -Force -AllowClobber
Import-Module PowerShellGet -RequiredVersion 2.2.5
Install-Module -Name RDWebClientManagement -Force
Install-RDWebClientPackage

# Exportar el certificado RDS aplicado al servidor y registrarlo para el Web Client
$cert = Get-ChildItem Cert:\LocalMachine\My | Where-Object {
  $_.Subject -like "*JUMP-SERVER2174.infra2.local*"
} | Select-Object -First 1

Export-Certificate -Cert $cert -FilePath C:\RDS-Broker.cer
Import-RDWebClientBrokerCert C:\RDS-Broker.cer
Publish-RDWebClientPackage -Type Production -Latest
