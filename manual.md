
## dnscryp
* `brew install dnscrypt-proxy`
* `sudo brew services restart dnscrypt-proxy`
* System Preferences -> Network: configure DNS to point to 172.0.0.1
* consider adding `8.8.8.8` and/or `1.1.1.1`as failover/backup
* see also [https://github.com/drduh/macOS-Security-and-Privacy-Guide#dnscrypt] or [https://github.com/DNSCrypt/dnscrypt-proxy]


## TinkerTool
* [https://www.bresink.com/osx/0TinkerTool/download.php]

## Chrome
### Extentions
* _uBlockOrigin_ | [https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm]
* _HTTPS Everywhere_ | [https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp]

### Settings

* _Review Security Setting_ chrome://settings/security
* _Cookie Setting_ chrome://settings/cookies?search=Privacy
	* Block Third Party Cookies
	* Send a 'Do Not Track'

## Firefox

### Extentions
* _HTTPS Everywhere_ | [https://www.eff.org/https-everywhere]
* _Privacy Badger_ | [https://www.eff.org/privacybadger]

### Settings
* _Enhanced Tracking Protection_ | [about:preferences#privacy]
	* Strict
	* Send web sites a "Do Not Track" 
