@echo off
COLOR 0C
echo  Created by ALExorON (c)
echo  Ver. 1.0.0, 16.FEB.2018
echo ---------------------------

:: First create Restore Point (If enabled)
  echo Making Restore Point...&echo .
  powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description \"PreDisable Win10 telemetry\" -RestorePointType \"MODIFY_SETTINGS\""
  timeout /T 10
  
:: DELETE SPY-SERVICES Win10
  sc delete DiagTrack
  sc delete SensrSvc
  sc delete CDPUserSvc_21fcd
  sc delete MessagingService_21fcd
  sc delete XblAuthManager
  sc delete MapsBroker
  sc delete DcpSvc
  sc delete Wecsvc
  sc delete XboxNetApiSvc
  sc delete OneSyncSvc_21fcd
  sc delete lfsvc
  sc delete SensorService
  sc delete SensorDataService
  sc delete RetailDemo
  sc delete UserDataSvc_21fcd
  sc delete PimIndexMaintenanceSvc_21fcd
  sc delete wisvc
  sc delete WerSvc
  sc delete UnistoreSvc_21fcd
  sc delete XblGameSave
  sc delete diagnosticshub.standardcollector.service
  sc delete RemoteRegistry
  sc delete OneSyncSvc_1c128
  sc delete CDPUserSvc_1c128
  sc delete WbioSrvc
  sc delete dmwappushservice
  sc delete NetTcpPortSharing
  sc delete RemoteAccess
  sc delete WMPNetworkSvc
  sc delete OneSyncSvc
  
:: Disable other SPY components
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d 4 /f 
  reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f
  reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
  reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
  reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
  reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v "CorporateSQMURL" /t REG_SZ /d "0.0.0.0" /f
  reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\osm" /v "Enablelogging" /t REG_DWORD /d 0 /f
  reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\osm" /v "EnableUpload" /t REG_DWORD /d 0 /f
  reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f
  reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f
  reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d 0 /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f 
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
  reg add "HKCU\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoExplicitFeedback" /t REG_DWORD /d 1 /f
  reg add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
  reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /v "{60E6D465-398E-4850-BE86-7EF7620A2377}" /t REG_SZ /d "v2.24|Action=Block|Active=TRUE|Dir=Out|App=C:\windows\system32\svchost.exe|Svc=DiagTrack|Name=Windows  Telemetry|" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /v "{2765E0F4-2918-4A46-B9C9-43CDD8FCBA2B}" /t REG_SZ /d "v2.24|Action=Block|Active=TRUE|Dir=Out|App=C:\windows\systemapps\microsoft.windows.cortana_cw5n1h2txyewy\searchui.exe|Name=Search  and Cortana  application|AppPkgId=S-1-15-2-1861897761-1695161497-2927542615-642690995-327840285-2659745135-2630312742|" /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d 1 /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
  reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f
  reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /f

:: Delete OneDrive
  taskkill /f /im OneDrive.exe
  rd /s /q %USERPROFILE%\OneDrive\
  rd /s /q %LOCALAPPDATA%\Microsoft\OneDrive\
  rd /s /q %PROGRAMDATA%\Microsoft\OneDrive\
  rd /s /q %PROGRAMDATA%\Microsoft\MapData\
  REG DELETE "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
  REG DELETE "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d 1 /f

:: Disable Cortana
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f 
  reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d 0 /f 
  reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f 
  reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f 
  reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d 0 /f
  
:: Disable Windows Defender Submit Samples
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f
  reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d 1 /f

:: Enable UAC if disable 
  reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 1 /f
  
:: Add & Change Route table  
  route -p ADD 104.87.88.177 MASK 255.255.255.255 0.0.0.0
  route -p ADD 104.89.242.39 MASK 255.255.255.255 0.0.0.0
  route -p ADD 104.96.147.3 MASK 255.255.255.255 0.0.0.0
  route -p ADD 111.221.29.177 MASK 255.255.255.255 0.0.0.0
  route -p ADD 111.221.29.253 MASK 255.255.255.255 0.0.0.0
  route -p ADD 131.253.34.230 MASK 255.255.255.255 0.0.0.0
  route -p ADD 131.253.40.37 MASK 255.255.255.255 0.0.0.0
  route -p ADD 131.253.61.100 MASK 255.255.255.255 0.0.0.0
  route -p ADD 131.253.61.64 MASK 255.255.255.255 0.0.0.0
  route -p ADD 131.253.61.68 MASK 255.255.255.255 0.0.0.0
  route -p ADD 131.253.61.96 MASK 255.255.255.255 0.0.0.0
  route -p ADD 134.170.115.60 MASK 255.255.255.255 0.0.0.0
  route -p ADD 134.170.165.248 MASK 255.255.255.255 0.0.0.0
  route -p ADD 134.170.165.253 MASK 255.255.255.255 0.0.0.0
  route -p ADD 134.170.185.70 MASK 255.255.255.255 0.0.0.0
  route -p ADD 134.170.30.202 MASK 255.255.255.255 0.0.0.0
  route -p ADD 137.116.81.24 MASK 255.255.255.255 0.0.0.0
  route -p ADD 137.117.235.16 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.55.129.21 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.55.133.204 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.55.240.220 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.56.106.189 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.56.121.89 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.56.124.87 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.56.77.148 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.56.77.149 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.56.91.77 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.56.96.54 MASK 255.255.255.255 0.0.0.0
  route -p ADD 168.63.108.233 MASK 255.255.255.255 0.0.0.0
  route -p ADD 172.230.215.85 MASK 255.255.255.255 0.0.0.0
  route -p ADD 191.232.139.2 MASK 255.255.255.255 0.0.0.0
  route -p ADD 191.232.139.254 MASK 255.255.255.255 0.0.0.0
  route -p ADD 191.232.80.58 MASK 255.255.255.255 0.0.0.0
  route -p ADD 191.232.80.62 MASK 255.255.255.255 0.0.0.0
  route -p ADD 191.237.208.126 MASK 255.255.255.255 0.0.0.0
  route -p ADD 2.22.61.43 MASK 255.255.255.255 0.0.0.0
  route -p ADD 2.22.61.66 MASK 255.255.255.255 0.0.0.0
  route -p ADD 204.79.197.200 MASK 255.255.255.255 0.0.0.0
  route -p ADD 207.46.101.29 MASK 255.255.255.255 0.0.0.0
  route -p ADD 207.46.114.58 MASK 255.255.255.255 0.0.0.0
  route -p ADD 207.68.166.254 MASK 255.255.255.255 0.0.0.0
  route -p ADD 212.30.134.204 MASK 255.255.255.255 0.0.0.0
  route -p ADD 212.30.134.205 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.102.21.4 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.204.68.66 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.205.214.76 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.218.212.69 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.223.20.82 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.36.33.135 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.48.106.243 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.57.101.163 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.57.107.27 MASK 255.255.255.255 0.0.0.0
  route -p ADD 23.99.10.11 MASK 255.255.255.255 0.0.0.0
  route -p ADD 40.77.226.221 MASK 255.255.255.255 0.0.0.0
  route -p ADD 40.77.226.223 MASK 255.255.255.255 0.0.0.0
  route -p ADD 52.167.222.147 MASK 255.255.255.255 0.0.0.0
  route -p ADD 64.4.54.22 MASK 255.255.255.255 0.0.0.0
  route -p ADD 64.4.6.100 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.39.117.230 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.100.11 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.100.7 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.100.9 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.100.91 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.100.92 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.100.93 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.100.94 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.108.103 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.108.254 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.108.29 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.52.108.33 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.108.23 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.138.114 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.138.126 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.138.186 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.252.63 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.252.71 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.252.92 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.252.93 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.29.238 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.39.10 MASK 255.255.255.255 0.0.0.0
  route -p ADD 77.67.29.176 MASK 255.255.255.255 0.0.0.0
  route -p ADD 64.4.23.0-64.4.23.255 MASK 255.255.255.255 0.0.0.0
  route -p ADD 65.55.223.0-65.55.223.255 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.55.52.0-157.55.52.255 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.55.56.0-157.55.56.255 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.55.130.0-157.55.130.255 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.55.235.0-157.55.235.255 MASK 255.255.255.255 0.0.0.0
  route -p ADD 157.55.236.0-157.55.236.255 MASK 255.255.255.255 0.0.0.0
  route -p ADD 111.221.64.0-111.221.127.255 MASK 255.255.255.255 0.0.0.0
  route -p ADD 195.138.255.0-195.138.255.255 MASK 255.255.255.255 0.0.0.0
  route -p ADD 213.199.179.0-213.199.179.255 MASK 255.255.255.255 0.0.0.0
  route -p change 104.87.88.177 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 104.89.242.39 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 104.96.147.3 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 111.221.29.177 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 111.221.29.253 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 131.253.34.230 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 131.253.40.37 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 131.253.61.100 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 131.253.61.64 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 131.253.61.68 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 131.253.61.96 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 134.170.115.60 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 134.170.165.248 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 134.170.165.253 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 134.170.185.70 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 134.170.30.202 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 137.116.81.24 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 137.117.235.16 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.55.129.21 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.55.133.204 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.55.240.220 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.56.106.189 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.56.121.89 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.56.124.87 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.56.77.148 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.56.77.149 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.56.91.77 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.56.96.54 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 168.63.108.233 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 172.230.215.85 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 191.232.139.2 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 191.232.139.254 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 191.232.80.58 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 191.232.80.62 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 191.237.208.126 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 2.22.61.43 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 2.22.61.66 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 204.79.197.200 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 207.46.101.29 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 207.46.114.58 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 207.46.223.94 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 207.68.166.254 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 212.30.134.204 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 212.30.134.205 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.102.21.4 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.204.68.66 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.205.214.76 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.218.212.69 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.223.20.82 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.36.33.135 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.48.106.243 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.57.101.163 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.57.107.27 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 23.99.10.11 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 40.77.226.221 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 40.77.226.223 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 52.167.222.147 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 64.4.54.22 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 64.4.6.100 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.39.117.230 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.100.11 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.100.7 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.100.9 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.100.91 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.100.92 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.100.93 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.100.94 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.100.95 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.108.103 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.108.254 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.108.29 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.52.108.33 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.108.23 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.138.114 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.138.126 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.138.186 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.252.63 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.252.71 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.252.92 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.252.93 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.29.238 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.39.10 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 77.67.29.176 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 64.4.23.0-64.4.23.255 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 65.55.223.0-65.55.223.255 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.55.52.0-157.55.52.255 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.55.56.0-157.55.56.255 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.55.130.0-157.55.130.255 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.55.235.0-157.55.235.255 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 157.55.236.0-157.55.236.255 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 111.221.64.0-111.221.127.255 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 195.138.255.0-195.138.255.255 MASK 255.255.255.255 0.0.0.0 if 1
  route -p change 213.199.179.0-213.199.179.255 MASK 255.255.255.255 0.0.0.0 if 1

:: Add Firewall rules
  netsh advfirewall firewall add rule name="Explorer.EXE_BLOCK" dir=out interface=any action=block program=%windir%\explorer.exe
  netsh advfirewall firewall add rule name="WSearch_Block" dir=out interface=any action=block service=WSearch 
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=104.87.88.177
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=104.89.242.39
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=104.96.147.3
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=111.221.29.177
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=111.221.29.253
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=131.253.34.230
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=131.253.40.37
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=131.253.61.100
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=131.253.61.64
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=131.253.61.68
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=131.253.61.96
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=134.170.115.60
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=134.170.165.248
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=134.170.165.253
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=134.170.185.70
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=134.170.30.202
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=137.116.81.24
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=137.117.235.16
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.55.129.21
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.55.133.204
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.55.240.220
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.56.106.189
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.56.121.89
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.56.124.87
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.56.77.148
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.56.77.149
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.56.91.77
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.56.96.54
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=168.63.108.233
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=172.230.215.85
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=191.232.139.2
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=191.232.139.254
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=191.232.80.58
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=191.232.80.62
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=191.237.208.126
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=2.22.61.43
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=2.22.61.66
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=204.79.197.200
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=207.46.101.29
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=207.46.114.58
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=207.46.223.94
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=207.68.166.254
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=212.30.134.204
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=212.30.134.205
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.102.21.4
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.204.68.66
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.205.214.76
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.218.212.69
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.223.20.82
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.36.33.135
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.48.106.243
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.57.101.163
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.57.107.27
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=23.99.10.11
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=40.77.226.221
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=40.77.226.223
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=52.167.222.147
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=64.4.54.22
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=64.4.6.100
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.39.117.230
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.100.11
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.100.7
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.100.9
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.100.91
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.100.92
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.100.93
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.100.94
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.108.103
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.108.254
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.108.29
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.52.108.33
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.108.23
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.138.114
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.138.126
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.138.186
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.252.63
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.252.71
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.252.92
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.252.93
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.29.238
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.39.10
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=77.67.29.176
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=64.4.23.0-64.4.23.255
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=65.55.223.0-65.55.223.255
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.55.52.0-157.55.52.255
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.55.56.0-157.55.56.255
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.55.130.0-157.55.130.255
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.55.235.0-157.55.235.255
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=157.55.236.0-157.55.236.255
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=111.221.64.0-111.221.127.255
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=195.138.255.0-195.138.255.255
  netsh advfirewall firewall add rule name="Telemetry" dir=out interface=any action=block remoteip=213.199.179.0-213.199.179.255

:: Clear main telemetry file
  echo "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl
:: Лучше удалить ВСЕ ПРАВА!!! на чтение каталога(AutoLogger) с этим файлом, в этом случае система уже никак не сможет что-то записывать когда-либо

:: Delete telemetry SCHTASKS
  SCHTASKS /Delete /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /F
  SCHTASKS /Delete /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" /F
  SCHTASKS /Delete /TN "\Microsoft\Office\Office ClickToRun Service Monitor" /F
  SCHTASKS /Delete /TN "\Microsoft\Office\OfficeTelemetry\AgentFallBack2016" /F
  SCHTASKS /Delete /TN "\Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentLogOn2016" /F
  SCHTASKS /Delete /TN "\Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentLogOn2016" /F
  SCHTASKS /Delete /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /F
  SCHTASKS /Delete /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn" /F
  SCHTASKS /Delete /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\AppID\SmartScreenSpecific" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Application Experience\AitAgent" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Autochk\Proxy" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\DiskFootprint\Diagnostics" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Maintenance\WinSAT" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\ActivateWindowsSearch" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\ConfigureInternetTimeService" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\DispatchRecoveryTasks" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\ehDRMInit" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\InstallPlayReady" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\mcupdate" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\MediaCenterRecoveryTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\ObjectStoreRecoveryTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\OCURActivate" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\OCURDiscovery" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\PBDADiscovery" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\PBDADiscoveryW1" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\PBDADiscoveryW2" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\PvrRecoveryTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\RegisterSearch" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\PvrScheduleTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\ReindexSearchRoot" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\SqlLiteRecoveryTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Media Center\UpdateRecordPath" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Shell\FamilySafetyMonitor" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Shell\FamilySafetyRefresh" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Shell\FamilySafetyUpload" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\PI\Sqm-Tasks" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\ApplicationExperience\Microsoft Compatibility Appraiser" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\ApplicationExperience\ProgramDataUpdater" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\ApplicationExperience\StartupAppTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Customer Experience Improvement\Consolidator" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Customer Experience Improvement\KernelCeipTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Customer Experience Improvement\UsbCeip" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Location\Notifications" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Location\WindowsActionDialog" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Maps\MapsToastTask" /F
  SCHTASKS /Delete /TN "\Microsoft\Windows\Maps\MapsUpdateTask" /F

:: Block Microsoft telemetry in hosts
  echo ...
  set h=%windir%\System32\drivers\etc\hosts
  echo Adding Telemetry IP to %h%
  echo #-------------------- >> %h%
  echo # Microsoft telemetry >> %h%
  echo #-------------------- >> %h%
  echo 0.0.0.0 answers.microsoft.com >> %h%
  echo 0.0.0.0 apps.skype.com >> %h%
  echo 0.0.0.0 ars.smartscreen.microsoft.com >> %h%
  echo 0.0.0.0 az361816.vo.msecnd.net >> %h%
  echo 0.0.0.0 az512334.vo.msecnd.net >> %h%
  echo 0.0.0.0 blob.weather.microsoft.com >> %h%
  echo 0.0.0.0 candycrushsoda.king.com >> %h%
  echo 0.0.0.0 cdn.content.prod.cms.msn.com >> %h%
  echo 0.0.0.0 cdn.onenote.net >> %h%
  echo 0.0.0.0 choice.microsoft.com >> %h%
  echo 0.0.0.0 choice.microsoft.com.nsatc.net >> %h%
  echo 0.0.0.0 client.wns.windows.com >> %h%
  echo 0.0.0.0 client-s.gateway.messenger.live.com >> %h%
  echo 0.0.0.0 clientconfig.passport.net >> %h%
  echo 0.0.0.0 deploy.static.akamaitechnologies.com >> %h%
  echo 0.0.0.0 device.auth.xboxlive.com >> %h%
  echo 0.0.0.0 dmd.metaservices.microsoft.com >> %h%
  echo 0.0.0.0 dns.msftncsi.com >> %h%
  echo 0.0.0.0 feedback.microsoft-hohm.com >> %h%
  echo 0.0.0.0 feedback.search.microsoft.com >> %h%
  echo 0.0.0.0 feedback.windows.com >> %h%
  echo 0.0.0.0 g.live.com >> %h%
  echo 0.0.0.0 img-s-msn-com.akamaized.net >> %h%
  echo 0.0.0.0 insiderppe.cloudapp.net >> %h%
  echo 0.0.0.0 licensing.mp.microsoft.com >> %h%
  echo 0.0.0.0 login.live.com >> %h%
  echo 0.0.0.0 m.hotmail.com >> %h%
  echo 0.0.0.0 mediaredirect.microsoft.com >> %h%
  echo 0.0.0.0 msftncsi.com >> %h%
  echo 0.0.0.0 officeclient.microsoft.com >> %h%
  echo 0.0.0.0 oneclient.sfx.ms >> %h%
  echo 0.0.0.0 pricelist.skype.com >> %h%
  echo 0.0.0.0 pti.store.microsoft.com >> %h%
  echo 0.0.0.0 query.prod.cms.rt.microsoft.com >> %h%
  echo 0.0.0.0 register.cdpcs.microsoft.com >> %h%
  echo 0.0.0.0 s.gateway.messenger.live.com >> %h%
  echo 0.0.0.0 s0.2mdn.net >> %h%
  echo 0.0.0.0 sO.2mdn.net >> %h%
  echo 0.0.0.0 search.msn.com >> %h%
  echo 0.0.0.0 settings-ssl.xboxlive.com >> %h%
  echo 0.0.0.0 static.2mdn.net >> %h%
  echo 0.0.0.0 storage.live.com >> %h%
  echo 0.0.0.0 store-images.s-microsoft.com >> %h%
  echo 0.0.0.0 storeedgefd.dsx.mp.microsoft.com >> %h%
  echo 0.0.0.0 support.microsoft.com >> %h%
  echo 0.0.0.0 tile-service.weather.microsoft.com >> %h%
  echo 0.0.0.0 time.windows.com >> %h%
  echo 0.0.0.0 tk2.plt.msn.com >> %h%
  echo 0.0.0.0 ui.skype.com >> %h%
  echo 0.0.0.0 urs.smartscreen.microsoft.com >> %h%
  echo 0.0.0.0 wdcp.microsoft.com >> %h%
  echo 0.0.0.0 wdcpalt.microsoft.com >> %h%
  echo 0.0.0.0 win10-trt.msedge.net >> %h%
  echo 0.0.0.0 wscont.apps.microsoft.com >> %h%
  echo 0.0.0.0 www.msftconnecttest.com >> %h%
  echo 0.0.0.0 www.msftncsi.com >> %h%
  echo 0.0.0.0 a-0001.a-msedge.net >> %h%
  echo 0.0.0.0 a-0001.dc-msedge.net >> %h%
  echo 0.0.0.0 a-0002.a-msedge.net >> %h%
  echo 0.0.0.0 a-0003.a-msedge.net >> %h%
  echo 0.0.0.0 a-0004.a-msedge.net >> %h%
  echo 0.0.0.0 a-0005.a-msedge.net >> %h%
  echo 0.0.0.0 a-0006.a-msedge.net >> %h%
  echo 0.0.0.0 a-0007.a-msedge.net >> %h%
  echo 0.0.0.0 a-0008.a-msedge.net >> %h%
  echo 0.0.0.0 a-0009.a-msedge.net >> %h%
  echo 0.0.0.0 a-0010.a-msedge.net >> %h%
  echo 0.0.0.0 a-0011.a-msedge.net >> %h%
  echo 0.0.0.0 a-0012.a-msedge.net >> %h%
  echo 0.0.0.0 a-0013.a-msedge.net >> %h%
  echo 0.0.0.0 a-0014.a-msedge.net >> %h%
  echo 0.0.0.0 a-0015.a-msedge.net >> %h%
  echo 0.0.0.0 a-msedge.net >> %h%
  echo 0.0.0.0 a.ads1.msn.com >> %h%
  echo 0.0.0.0 a.ads2.msads.net >> %h%
  echo 0.0.0.0 a.ads2.msn.com >> %h%
  echo 0.0.0.0 a.rad.msn.com >> %h%
  echo 0.0.0.0 ac3.msn.com >> %h%
  echo 0.0.0.0 activity.windows.com >> %h%
  echo 0.0.0.0 adnexus.net >> %h%
  echo 0.0.0.0 adnxs.com >> %h%
  echo 0.0.0.0 ads.msn.com >> %h%
  echo 0.0.0.0 ads1.msads.net >> %h%
  echo 0.0.0.0 ads1.msn.com >> %h%
  echo 0.0.0.0 aidps.atdmt.com >> %h%
  echo 0.0.0.0 aka-cdn-ns.adtech.de >> %h%
  echo 0.0.0.0 array101-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array102-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array103-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array104-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array105-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array106-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array201-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array202-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array203-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array204-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array205-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array401-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array402-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array403-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array404-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array405-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array406-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array407-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array408-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array409-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array410-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 array411-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 b.ads1.msn.com >> %h%
  echo 0.0.0.0 b.ads2.msads.net >> %h%
  echo 0.0.0.0 b.rad.msn.com >> %h%
  echo 0.0.0.0 bingads.microsoft.com >> %h%
  echo 0.0.0.0 bl3301-a.1drv.com >> %h%
  echo 0.0.0.0 bl3301-c.1drv.com >> %h%
  echo 0.0.0.0 bl3301-g.1drv.com >> %h%
  echo 0.0.0.0 bn1304-e.1drv.com >> %h%
  echo 0.0.0.0 bn1306-a.1drv.com >> %h%
  echo 0.0.0.0 bn1306-e.1drv.com >> %h%
  echo 0.0.0.0 bn1306-g.1drv.com >> %h%
  echo 0.0.0.0 bn2b-cor001.api.p001.1drv.com >> %h%
  echo 0.0.0.0 bn2b-cor002.api.p001.1drv.com >> %h%
  echo 0.0.0.0 bn3p-cor001.api.p001.1drv.com >> %h%
  echo 0.0.0.0 bn2b-cor003.api.p001.1drv.com >> %h%
  echo 0.0.0.0 bn2b-cor004.api.p001.1drv.com >> %h%
  echo 0.0.0.0 bn2wns1.wns.windows.com >> %h%
  echo 0.0.0.0 bn3sch020022328.wns.windows.com >> %h%
  echo 0.0.0.0 by3301-a.1drv.com >> %h%
  echo 0.0.0.0 by3301-b.1drv.com >> %h%
  echo 0.0.0.0 by3301-c.1drv.com >> %h%
  echo 0.0.0.0 by3301-d.1drv.com >> %h%
  echo 0.0.0.0 by3301-e.1drv.com >> %h%
  echo 0.0.0.0 by3301-f.1drv.com >> %h%
  echo 0.0.0.0 bs.serving-sys.com >> %h%
  echo 0.0.0.0 c.atdmt.com >> %h%
  echo 0.0.0.0 c.msn.com >> %h%
  echo 0.0.0.0 c-0001.dc-msedge.net >> %h%
  echo 0.0.0.0 ca.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 cache.datamart.windows.com >> %h%
  echo 0.0.0.0 cdn.atdmt.com >> %h%
  echo 0.0.0.0 cds1204.lon.llnw.net >> %h%
  echo 0.0.0.0 cds1293.lon.llnw.net >> %h%
  echo 0.0.0.0 cds20417.lcy.llnw.net >> %h%
  echo 0.0.0.0 cds20431.lcy.llnw.net >> %h%
  echo 0.0.0.0 cds20450.lcy.llnw.net >> %h%
  echo 0.0.0.0 cds20457.lcy.llnw.net >> %h%
  echo 0.0.0.0 cds20475.lcy.llnw.net >> %h%
  echo 0.0.0.0 cds21244.lon.llnw.net >> %h%
  echo 0.0.0.0 cds26.ams9.msecn.net >> %h%
  echo 0.0.0.0 cds425.lcy.llnw.net >> %h%
  echo 0.0.0.0 cds459.lcy.llnw.net >> %h%
  echo 0.0.0.0 cds494.lcy.llnw.net >> %h%
  echo 0.0.0.0 cds965.lon.llnw.net >> %h%
  echo 0.0.0.0 ch1-cor001.api.p001.1drv.com >> %h%
  echo 0.0.0.0 ch1-cor002.api.p001.1drv.com >> %h%
  echo 0.0.0.0 ch1-cor003.api.p001.1drv.com >> %h%
  echo 0.0.0.0 ch1-cor004.api.p001.1drv.com >> %h%
  echo 0.0.0.0 ch3301-c.1drv.com >> %h%
  echo 0.0.0.0 ch3301-e.1drv.com >> %h%
  echo 0.0.0.0 ch3301-g.1drv.com >> %h%
  echo 0.0.0.0 ch3302-c.1drv.com >> %h%
  echo 0.0.0.0 ch3302-e.1drv.com >> %h%
  echo 0.0.0.0 compatexchange.cloudapp.net >> %h%
  echo 0.0.0.0 compatexchange1.trafficmanager.net >> %h%
  echo 0.0.0.0 continuum.dds.microsoft.com >> %h%
  echo 0.0.0.0 corp.sts.microsoft.com >> %h%
  echo 0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com >> %h%
  echo 0.0.0.0 cp101-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 cp201-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 cp301-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 cp401-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 cp501-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 cs1.wpc.v0cdn.net >> %h%
  echo 0.0.0.0 db3aqu.atdmt.com >> %h%
  echo 0.0.0.0 db3wns2011111.wns.windows.com >> %h%
  echo 0.0.0.0 db5.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101100122.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101100127.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101100831.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101100835.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101100917.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101100925.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101100928.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101100938.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101001.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101022.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101024.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101031.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101034.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101042.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101044.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101122.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101123.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101125.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101128.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101129.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101133.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101145.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101209.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101221.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101228.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101231.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101237.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101317.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101324.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101329.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101333.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101334.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101338.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101419.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101424.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101426.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101427.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101430.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101445.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101511.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101519.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101529.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101535.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101541.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101543.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101608.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101618.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101629.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101631.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101633.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101640.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101711.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101722.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101739.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101745.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101813.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101820.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101826.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101835.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101837.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101844.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101907.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101914.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101929.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101939.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101101941.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101102015.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101102017.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101102019.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101102023.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101102025.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101102032.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101102033.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110108.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110109.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110114.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110135.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110142.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110204.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110206.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110214.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110225.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110232.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110245.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110315.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110323.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110325.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110328.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110331.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110341.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110343.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110345.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110403.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110419.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110438.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110442.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110501.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110527.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110533.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110618.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110622.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110624.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110626.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110634.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110705.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110724.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110740.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110810.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110816.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110821.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110822.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110825.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110828.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110835.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110919.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110921.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110923.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch101110929.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103081814.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082011.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082111.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082308.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082406.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082409.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082609.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082611.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082709.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082712.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103082806.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103090115.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103090415.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103090513.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103090515.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103090608.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103090806.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103090814.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103090906.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091011.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091012.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091106.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091108.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091212.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091311.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091414.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091511.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091617.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091715.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091817.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091908.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103091911.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103092010.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103092108.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103092109.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103092209.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103092210.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103092509.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103100117.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103100121.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103100221.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103100313.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103100314.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103100510.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103100511.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103100611.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103100712.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101105.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101208.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101212.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101314.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101411.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101413.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101513.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101610.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101611.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101705.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101711.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101909.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103101914.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103102009.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103102112.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103102203.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103102209.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103102310.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103102404.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103102609.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103102610.wns.windows.com >> %h%
  echo 0.0.0.0 db5sch103102805.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090104.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090112.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090116.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090122.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090203.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090208.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090209.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090211.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090305.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090306.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090308.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090311.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090313.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090410.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090412.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090504.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090510.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090512.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090513.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090514.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090519.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090613.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090619.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090810.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090811.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090902.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090905.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090907.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090908.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090910.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102090911.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091003.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091007.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091008.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091009.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091011.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091103.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091105.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091204.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091209.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091305.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091307.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091308.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091309.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091314.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091412.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091503.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091507.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091602.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091603.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091606.wns.windows.com >> %h%
  echo 0.0.0.0 db6sch102091607.wns.windows.com >> %h%
  echo 0.0.0.0 dev.virtualearth.net >> %h%
  echo 0.0.0.0 db5wns1d.wns.windows.com >> %h%
  echo 0.0.0.0 df.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 disc101-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 disc201-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 disc301-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 disc401-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 disc501-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 diagnostics.support.microsoft.com >> %h%
  echo 0.0.0.0 ec.atdmt.com >> %h%
  echo 0.0.0.0 ecn.dev.virtualearth.net >> %h%
  echo 0.0.0.0 eu.vortex.data.microsoft.com >> %h%
  echo 0.0.0.0 flex.msn.com >> %h%
  echo 0.0.0.0 fs.microsoft.com >> %h%
  echo 0.0.0.0 g.msn.com >> %h%
  echo 0.0.0.0 geo-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 geover-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 h1.msn.com >> %h%
  echo 0.0.0.0 h2.msn.com >> %h%
  echo 0.0.0.0 i-bl6p-cor001.api.p001.1drv.com >> %h%
  echo 0.0.0.0 i-by3p-cor001.api.p001.1drv.com >> %h%
  echo 0.0.0.0 i-by3p-cor002.api.p001.1drv.com >> %h%
  echo 0.0.0.0 i-ch1-cor001.api.p001.1drv.com >> %h%
  echo 0.0.0.0 i-ch1-cor002.api.p001.1drv.com >> %h%
  echo 0.0.0.0 i-sn2-cor001.api.p001.1drv.com >> %h%
  echo 0.0.0.0 i-sn2-cor002.api.p001.1drv.com >> %h%
  echo 0.0.0.0 i1.services.social.microsoft.com >> %h%
  echo 0.0.0.0 i1.services.social.microsoft.com.nsatc.net >> %h%
  echo 0.0.0.0 inference.location.live.net >> %h%
  echo 0.0.0.0 kv101-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 kv201-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 kv401-prod.do.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 lb1.www.ms.akadns.net >> %h%
  echo 0.0.0.0 live.rads.msn.com >> %h%
  echo 0.0.0.0 ls2web.redmond.corp.microsoft.com >> %h%
  echo 0.0.0.0 m.adnxs.com >> %h%
  echo 0.0.0.0 mobile.pipe.aria.microsoft.com >> %h%
  echo 0.0.0.0 msedge.net >> %h%
  echo 0.0.0.0 msntest.serving-sys.com >> %h%
  echo 0.0.0.0 nexus.officeapps.live.com >> %h%
  echo 0.0.0.0 nexusrules.officeapps.live.com >> %h%
  echo 0.0.0.0 oca.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 oca.telemetry.microsoft.com.nsatc.net >> %h%
  echo 0.0.0.0 onesettings-bn2.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 onesettings-cy2.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 onesettings-db5.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 onesettings-hk2.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 pre.footprintpredict.com >> %h%
  echo 0.0.0.0 preview.msn.com >> %h%
  echo 0.0.0.0 rad.live.com >> %h%
  echo 0.0.0.0 rad.msn.com >> %h%
  echo 0.0.0.0 redir.metaservices.microsoft.com >> %h%
  echo 0.0.0.0 reports.wes.df.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 schemas.microsoft.akadns.net >> %h%
  echo 0.0.0.0 secure.adnxs.com >> %h%
  echo 0.0.0.0 secure.flashtalking.com >> %h%
  echo 0.0.0.0 services.wes.df.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 settings-sandbox.data.microsoft.com >> %h%
  echo 0.0.0.0 settings-win.data.microsoft.com >> %h%
  echo 0.0.0.0 settings-win-ppe.data.microsoft.com >> %h%
  echo 0.0.0.0 settings.data.glbdns2.microsoft.com >> %h%
  echo 0.0.0.0 settings.data.microsoft.com >> %h%
  echo 0.0.0.0 sn3301-c.1drv.com >> %h%
  echo 0.0.0.0 sn3301-e.1drv.com >> %h%
  echo 0.0.0.0 sn3301-g.1drv.com >> %h%
  echo 0.0.0.0 spynet2.microsoft.com >> %h%
  echo 0.0.0.0 spynetalt.microsoft.com >> %h%
  echo 0.0.0.0 spyneteurope.microsoft.akadns.net >> %h%
  echo 0.0.0.0 sqm.df.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 sqm.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net >> %h%
  echo 0.0.0.0 ssw.live.com >> %h%
  echo 0.0.0.0 storecatalogrevocation.storequality.microsoft.com >> %h%
  echo 0.0.0.0 survey.watson.microsoft.com >> %h%
  echo 0.0.0.0 t0.ssl.ak.dynamic.tiles.virtualearth.net >> %h%
  echo 0.0.0.0 t0.ssl.ak.tiles.virtualearth.net >> %h%
  echo 0.0.0.0 telecommand.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net >> %h%
  echo 0.0.0.0 telemetry.appex.bing.net >> %h%
  echo 0.0.0.0 telemetry.microsoft.com >> %h%
  echo 0.0.0.0 telemetry.urs.microsoft.com >> %h%
  echo 0.0.0.0 test.activity.windows.com >> %h%
  echo 0.0.0.0 tsfe.trafficshaping.dsp.mp.microsoft.com >> %h%
  echo 0.0.0.0 v10.vortex-win.data.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 v10.vortex-win.data.microsoft.com >> %h%
  echo 0.0.0.0 version.hybrid.api.here.com >> %h%
  echo 0.0.0.0 view.atdmt.com >> %h%
  echo 0.0.0.0 vortex-bn2.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 vortex-cy2.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 vortex-db5.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 vortex-hk2.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 vortex-sandbox.data.microsoft.com >> %h%
  echo 0.0.0.0 vortex-win.data.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 vortex-win.data.microsoft.com >> %h%
  echo 0.0.0.0 vortex.data.glbdns2.microsoft.com >> %h%
  echo 0.0.0.0 vortex.data.metron.live.com.nsatc.net >> %h%
  echo 0.0.0.0 vortex.data.microsoft.com >> %h%
  echo 0.0.0.0 watson.live.com >> %h%
  echo 0.0.0.0 watson.microsoft.com >> %h%
  echo 0.0.0.0 watson.ppe.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 watson.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 watson.telemetry.microsoft.com.nsatc.net >> %h%
  echo 0.0.0.0 web.vortex.data.microsoft.com >> %h%
  echo 0.0.0.0 wes.df.telemetry.microsoft.com >> %h%
  echo 0.0.0.0 win10.ipv6.microsoft.com >> %h%
  echo 0.0.0.0 win1710.ipv6.microsoft.com >> %h%
  echo 0.0.0.0 www.msedge.net >> %h%
  echo 0.0.0.0 185.13.160.61 >> %h%
  echo 0.0.0.0 184.86.56.12 >> %h%
  echo 0.0.0.0 204.79.197.200 >> %h%
  echo 0.0.0.0 fe3.delivery.dsp.mp.microsoft.com.nsatc.net >> %h%
  echo 0.0.0.0 msnbot-207-46-194-33.search.msn.com >> %h%
  echo 0.0.0.0 settings.data.microsof.com >> %h%
  echo 0.0.0.0 ad.doubleclick.net >> %h%
  echo 0.0.0.0 a-msedge.net >> %h%
  echo 0.0.0.0 msnbot-65-55-108-23.search.msn.com >> %h%
  echo 0.0.0.0 sls.update.microsoft.com.akadns.net >> %h%
  echo 0.0.0.0 statsfe1.ws.microsoft.com >> %h%
  echo 0.0.0.0 statsfe2.ws.microsoft.com >> %h%
  echo 0.0.0.0 statsfe3.ws.microsoft.com >> %h%
  echo 0.0.0.0 statsfe4.ws.microsoft.com >> %h%
  echo 0.0.0.0 fe2.update.microsoft.com.akadns.net >> %h%
  echo 0.0.0.0 statsfe2.update.microsoft.com.akadns.net >> %h%

:: Disable MS Ads
  echo ...
  echo Disable MS Ads banners (Skype)
  echo 0.0.0.0 54.192.44.47 >> %h%
  echo 0.0.0.0 apps.skype.com >> %h%
  echo 0.0.0.0 live.rads.msn.com >> %h%
  echo 0.0.0.0 ads1.msn.com >> %h%
  echo 0.0.0.0 static.2mdn.net >> %h%
  echo 0.0.0.0 g.msn.com >> %h%
  echo 0.0.0.0 a.ads2.msads.net >> %h%
  echo 0.0.0.0 b.ads2.msads.net >> %h%
  echo 0.0.0.0 ad.doubleclick.net >> %h%
  echo 0.0.0.0 ac3.msn.com >> %h%
  echo 0.0.0.0 rad.msn.com >> %h%
  echo 0.0.0.0 msntest.serving-sys.com >> %h%
  echo 0.0.0.0 bs.serving-sys.com >> %h%
  echo 0.0.0.0 flex.msn.com >> %h%
  echo 0.0.0.0 ec.atdmt.com >> %h%
  echo 0.0.0.0 cdn.atdmt.com >> %h%
  echo 0.0.0.0 db3aqu.atdmt.com >> %h%
  echo 0.0.0.0 cds26.ams9.msecn.net >> %h%
  echo 0.0.0.0 sO.2mdn.net >> %h%
  echo 0.0.0.0 aka-cdn-ns.adtech.de >> %h%
  echo 0.0.0.0 secure.flashtalking.com >> %h%
  echo 0.0.0.0 adnexus.net >> %h%
  echo 0.0.0.0 adnxs.com >> %h%
  echo 0.0.0.0 *.rad.msn.com >> %h%
  echo 0.0.0.0 *.msads.net >> %h%
  echo 0.0.0.0 *.msecn.net >> %h%

:: ReInit network
  ipconfig /flushdns
  ipconfig /renew

:: Finish
  echo --------------------------------------------------------
  echo  All Telemetry components Win10 deleted and disabled!!!
  echo  You need reboot system...
  echo --------------------------------------------------------

pause