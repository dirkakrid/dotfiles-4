function remove_ca {
  echo "Removing ${2}"
  sudo /usr/bin/security delete-certificate \
    -t -Z $1 \
    /System/Library/Keychains/SystemRootCertificates.keychain
}


function disable_dagent {
  echo "Disabling ${1}"
  launchctl unload -w /System/Library/LaunchAgents/${1}.plist
}

function disable_ddaemon {
  echo "Disabling ${1}"
  sudo launchctl unload -w /System/Library/LaunchDaemons/${1}.plist
}

function disable_darwin {
  exit 0;
  disable_dagent com.apple.AddressBook.SourceSync
  disable_dagent com.apple.AirPlayUIAgent
  disable_dagent com.apple.AOSHeartbeat
  disable_dagent com.apple.AOSPushRelay
  disable_dagent com.apple.bird
  disable_dagent com.apple.CalendarAgent
  disable_dagent com.apple.CallHistoryPluginHelper
  disable_dagent com.apple.CallHistorySyncHelper
  disable_dagent com.apple.cloudd
  disable_dagent com.apple.cloudfamilyrestrictionsd-mac
  disable_dagent com.apple.cloudpaird
  disable_dagent com.apple.cloudphotosd
  disable_dagent com.apple.CoreLocationAgent
  disable_dagent com.apple.coreservices.appleid.authentication
  disable_dagent com.apple.EscrowSecurityAlert
  disable_dagent com.apple.findmymacmessenger
  disable_dagent com.apple.gamed
  disable_dagent com.apple.helpd
  disable_dagent com.apple.icloud.fmfd
  disable_dagent com.apple.idsremoteurlconnectionagent
  disable_dagent com.apple.imagent
  disable_dagent com.apple.IMLoggingAgent
  disable_dagent com.apple.locationmenu
  disable_dagent com.apple.notificationcenterui
  disable_dagent com.apple.pbs
  disable_dagent com.apple.rtcreportingd
  disable_dagent com.apple.SafariCloudHistoryPushAgent
  disable_dagent com.apple.safaridavclient
  disable_dagent com.apple.SafariNotificationAgent
  disable_dagent com.apple.security.cloudkeychainproxy
  disable_dagent com.apple.SocialPushAgent
  disable_dagent com.apple.syncdefaultsd
  disable_dagent com.apple.telephonyutilities.callservicesd

  disable_ddaemon com.apple.apsd
  disable_ddaemon com.apple.AssetCacheLocatorService
  disable_ddaemon com.apple.awacsd
  disable_ddaemon com.apple.awdd
  disable_ddaemon com.apple.CrashReporterSupportHelper
  disable_ddaemon com.apple.GameController.gamecontrollerd
  disable_ddaemon com.apple.SubmitDiagInfo
  disable_ddaemon com.apple.TMCacheDelete

  remove_ca "D1EB23A46D17D68FD92564C2F1F1601764D8E349" "AAA Certificate Services"
  remove_ca "4F99AA93FB2BD13726A1994ACE7FF005F2935D1E" "China Internet Network Information Center Root CA"
  remove_ca "8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F" "CNNIC"
  remove_ca "8C941B34EA1EA6ED9AE2BC54CF687252B4C9B561" "DoD Root CA 2"
  remove_ca "10F193F340AC91D6DE5F1EDC006247C4F25D9671" "DoD CLASS 3 Root CA"
  remove_ca "8C96BAEBDD2B070748EE303266A0F3986E7CAE58" "EBG"
  remove_ca "51C6E70849066EF392D45CA00D6DA3628FC35239" "E-Tugra Certification Authority"
  remove_ca "905F942FD9F28F679B378180FD4F846347F645C1" "Federal Common Policy CA"
  remove_ca "FE45659B79035B98A161B5512EACDA580948224D" "Hellenic Academic and Research Institutions RootCA 2011"
  remove_ca "D6DAA8208D09D2154D24B52FCB346EB258B28A58" "Hongkong Post Root CA 1"
  remove_ca "D2441AA8C203AECAA96E501F124D52B68FE4C375" "I.CA"
  remove_ca "270C500CC6C86ECB1980BC1305439ED282480BE3" "MPHPT Certification Authority"
  remove_ca "06083F593F15A104A069A46BA903D006B7970991" "NetLock Arany"
  remove_ca "E392512F0ACFF505DFF6DE067F7537E165EA574B" "NetLock Expressz"
  remove_ca "016897E1A0B8F2C3B134665C20A727B7A158E28F" "NetLock Minositett Kozjegyzoi"
  remove_ca "ACED5F6553FD25CE015F1F7A483B6A749F6178C6" "NetLock Kozjegyzoi"
  remove_ca "2DFF6336E33A4829AA009F01A1801EE7EBA582BB" "Prefectural Association For JPKI"
  remove_ca "8782C6C304353BCFD29692D2593E7D44D934FF11" "SecureTrust CA"
  remove_ca "E19FE30E8B84609E809B170D72A8C5BA6E1409BD" "Trusted Certificate Services"
  remove_ca "3BC0380B33C3F6A60C86152293D9DFF54B81C005" "Trustis FPS Root CA"
  remove_ca "B091AA913847F313D727BCEFC8179F086F3A8C0F" "TW Government Root Certification Authority"
  remove_ca "1B4B396126276B6491A2686DD70243212D1F1D96" "TurkTrust 1"
  remove_ca "7998A308E14D6585E6C21E153A719FBA5AD34AD9" "TurkTrust 2"
  remove_ca "B435D4E1119D1C6690A749EBB394BD637BA782B7" "TurkTrust 3"
  remove_ca "F17F6FB631DC99E3A3C87FFE1CF1811088D96033" "TurkTrust 4"
  remove_ca "0B972C9EA6E7CC58D93B20BF71EC412E7209FABF" "UCA Global Root"
  remove_ca "8250BED5A214433A66377CBC10EF83F669DA3A67" "UCA Root"
  remove_ca "CB44A097857C45FA187ED952086CB9841F2D51B5" "US Govt Common Policy"
  remove_ca "FAA7D9FB31B746F200A85E65797613D816E063B5" "VRK Gov. Root CA"
  remove_ca "E7B4F69D61EC9069DB7E90A7401A3CF47D4FE8EE" "WellsSecure Public Root Certificate Authority"
}
