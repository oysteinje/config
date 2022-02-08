Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop install git 7zip
scoop bucket add extras
scoop install firefox
scoop install windows-terminal
scoop install vscode
scoop install toggl

scoop list

Invoke-WebRequest -Uri 'https://go.microsoft.com/fwlink/?linkid=2110341' -OutFile 'onenote.exe'





Notes
-----
To set profile 'Scoop' as *DEFAULT*, or profiles/settings was lost after update:
- Run 'Firefox Profile Manager', choose 'Scoop' then click 'Start Firefox'.
- Visit 'about:profiles' page in Firefox to check *DEFAULT* profile.
For details: https://support.mozilla.org/en-US/kb/profile-manager-create-remove-switch-firefox-profiles
