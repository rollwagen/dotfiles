
## VMWare Fusion & Vagrant
* Download package from [vagrant plugin install vagrant-vmware-desktop]
* Install:
```sh
vagrant plugin install vagrant-vmware-desktop
vagrant plugin license vagrant-vmware-desktop ~/license.lic
```

## vi
* Install Vim-Plug plugin manager
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
* in vim run ':PlugInstall'

## dnscryp
* `brew install dnscrypt-proxy`
* `sudo brew services restart dnscrypt-proxy`
* System Preferences -> Network: configure DNS to point to 172.0.0.1
* consider adding `8.8.8.8` and/or `1.1.1.1`as failover/backup
* see also (https://github.com/drduh/macOS-Security-and-Privacy-Guide#dnscrypt) or (https://github.com/DNSCrypt/dnscrypt-proxy)

## zsh
* oh-my-zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
* Login warning prompt: `zsh compinit: insecure directories, run compaudit for list.`
  * run `compaudit`
  * run `run sudo chmod -R 755 target_directory`
  * OR `compaudit | xargs chmod g-w,o-w`

## TinkerTool
* (https://www.bresink.com/osx/0TinkerTool/download.php)

## Browser: Chrome
### Extentions
* [uBlockOrigin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
* _HTTPS Everywhere_ | [https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp]
* _LastPass_ 

### Settings

* _Review Security Setting_ chrome://settings/security
* _Cookie Setting_ chrome://settings/cookies?search=Privacy
	* Block Third Party Cookies
	* Send a 'Do Not Track'
* Setting -> 'Zoom' -> Page Zoom default to 90%

## Browser: Firefox

### Extentions
* [HTTPS Everywhere](https://www.eff.org/https-everywhere)
* [Privacy Badger](https://www.eff.org/privacybadger)

### Settings
* _Enhanced Tracking Protection_ `about:preferences#privacy`
	* Strict
	* Send web sites a "Do Not Track" 

