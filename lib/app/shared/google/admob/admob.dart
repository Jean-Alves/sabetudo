import 'package:firebase_admob/firebase_admob.dart';

BannerAd myBanner;
InterstitialAd myInterstitial;
RewardedVideoAd rewardedVideoAd;

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['Quiz', 'Perguntas'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
  testDevices: <String>[],
);
void startBanner() {
  myBanner = BannerAd(
    adUnitId: BannerAd.testAdUnitId, //ca-app-pub-3305042596393522/6373024089
    size: AdSize.fullBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      if (event == MobileAdEvent.opened) {
        // MobileAdEvent.opened
        // MobileAdEvent.clicked
        // MobileAdEvent.closed
        // MobileAdEvent.failedToLoad
        // MobileAdEvent.impression
        // MobileAdEvent.leftApplication
      }
      if (event == MobileAdEvent.failedToLoad) {
        myBanner..load();
      }
    },
  );
}

void displayBanner() {
  myBanner
    ..load()
    ..show(
      anchorOffset: 0.0,
      anchorType: AnchorType.bottom,
    );
}

startInterstitial() {
  myInterstitial = buildInterstitial()
    ..load()
    ..show();
}

InterstitialAd buildInterstitial() {
  return InterstitialAd(
      adUnitId:
          InterstitialAd.testAdUnitId, //ca-app-pub-3305042596393522/5731145816
      targetingInfo: MobileAdTargetingInfo(testDevices: <String>[]),
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.loaded) {
          myInterstitial?.show();
        }
        if (event == MobileAdEvent.clicked || event == MobileAdEvent.closed) {
          myInterstitial.dispose();
        }
      });
}

void admobClose() {
  bannerDispose();
  myInterstitial?.dispose();
}

void bannerDispose() {
  myBanner?.dispose();
}
