---
title: 'Integrating Chromecast with Kaltura SDK (iOS)'
date: 2016-01-01T06:25:00.002-08:00
draft: false
tags : [kaltura, iOS, sdk, Google, configuration, chromecast, proof-of-concepts]
---

Their documentation says it is built in, but I couldn't find a sample anywhere, so here it is for everyone on how to integrate [Chromecast](https://www.google.com/intl/en_in/chrome/devices/chromecast/index.html?utm_source=chromecast.com) with your [Kaltura Player](https://github.com/kaltura/player-sdk-native-ios).  
  

```

- (KPViewController *)player {
    if (!_player) {
        KPPlayerConfig *config = [[KPPlayerConfig alloc] initWithDomain:@"http://cdnapi.kaltura.com"
                                                               uiConfID:@"PlayerConfigId"
                                                              partnerId:@"YourPartnerId"];
        config.entryId = @"YourContentId";
        
        [config addConfigKey:@"chromecast" withDictionary:@{@"plugin":@"true"}];
        
        config.cacheSize = 0.8;
        _player = [[KPViewController alloc] initWithConfiguration:config];
    }
    return _player;
}
  
```
I'll cherish the moment where I had to demo this to a customer in order to gain the confidence and to prove my report was correct.