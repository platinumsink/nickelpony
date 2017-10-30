
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
	
adb wait-for-device devices
adb shell su -c "mount -o rw,remount /system"
sleep 2
 # /system/app 
adb shell su -c "rm /system/app/BasicDreams.apk"
adb shell su -c "rm /system/app/BasicDreams.odex"
adb shell su -c "rm /system/app/Bluetooth.apk"
adb shell su -c "rm /system/app/Bluetooth.odex"
adb shell su -c "rm /system/app/Books.apk"
adb shell su -c "rm /system/app/Calculator.apk"
adb shell su -c "rm /system/app/Calculator.odex"
adb shell su -c "rm /system/app/Calendar.apk"
adb shell su -c "rm /system/app/Calendar.odex"
adb shell su -c "rm /system/app/Chrome.apk"
adb shell su -c "rm /system/app/ChromePrint.apk"
adb shell su -c "rm /system/app/DeskClock.apk"
adb shell su -c "rm /system/app/Drive.apk"
adb shell su -c "rm /system/app/Email.apk"
adb shell su -c "rm /system/app/Email.odex"
adb shell su -c "rm /system/app/Exchange2.apk"
adb shell su -c "rm /system/app/Exchange2.odex"
adb shell su -c "rm /system/app/FMRadioService.apk"
adb shell su -c "rm /system/app/FMRadioService.odex"
adb shell su -c "rm /system/app/Gmail2.apk"
adb shell su -c "rm /system/app/GMS_Maps.apk"
adb shell su -c "rm /system/app/GoogleCalendarSyncAdapter.apk"
adb shell su -c "rm /system/app/GoogleContactsSyncAdapter.apk"
adb shell su -c "rm /system/app/GoogleTTS.apk"
adb shell su -c "rm /system/app/Hangouts.apk"
adb shell su -c "rm /system/app/HoloSpiralWallpaper.apk"
adb shell su -c "rm /system/app/HoloSpiralWallpaper.odex"
adb shell su -c "rm /system/app/HPLegacyPlugin.apk"
adb shell su -c "rm /system/app/LiveWallpapers.apk"
adb shell su -c "rm /system/app/LiveWallpapers.odex"
adb shell su -c "rm /system/app/LiveWallpapersPicker.apk"
adb shell su -c "rm /system/app/LiveWallpapersPicker.odex"
adb shell su -c "rm /system/app/Magazines.apk"
adb shell su -c "rm /system/app/MagicSmokeWallpapers.apk"
adb shell su -c "rm /system/app/MagicSmokeWallpapers.odex"
adb shell su -c "rm /system/app/Music2.apk"
adb shell su -c "rm /system/app/NoiseField.apk"
adb shell su -c "rm /system/app/NoiseField.odex"
adb shell su -c "rm /system/app/PhaseBeam.apk"
adb shell su -c "rm /system/app/PhaseBeam.odex"
adb shell su -c "rm /system/app/PhotoTable.apk"
adb shell su -c "rm /system/app/PhotoTable.odex"
adb shell su -c "rm /system/app/PlayGames.apk"
adb shell su -c "rm /system/app/PlusOne.apk"
adb shell su -c "rm /system/app/PreloadContacts.apk"
adb shell su -c "rm /system/app/PreloadContacts.odex"
adb shell su -c "rm /system/app/PrintSpool.apk"
adb shell su -c "rm /system/app/PrintSpool.odex"
adb shell su -c "rm /system/app/Quickoffice.apk"
adb shell su -c "rm /system/app/Setup.apk"
adb shell su -c "rm /system/app/Setup.odex"
adb shell su -c "rm /system/app/SoundRecorder.apk"
adb shell su -c "rm /system/app/SoundRecorder.odex"
adb shell su -c "rm /system/app/Street.apk"
adb shell su -c "rm /system/app/TagGoogle.apk"
adb shell su -c "rm /system/app/talkback.apk"
adb shell su -c "rm /system/app/Translate.apk"
adb shell su -c "rm /system/app/Videos.apk"
adb shell su -c "rm /system/app/VisualizationWallpapers.apk"
adb shell su -c "rm /system/app/VisualizationWallpapers.odex"
adb shell su -c "rm /system/app/YouTube.apk"
  
 # /system/priv-app 
  
adb shell su -c "rm /system/priv-app/AudioEffects.apk"
adb shell su -c "rm /system/priv-app/AudioEffects.odex"
adb shell su -c "rm /system/priv-app/Calendar.apk"
adb shell su -c "rm /system/priv-app/Calendar.odex"
adb shell su -c "rm /system/priv-app/CalendarProvider.apk"
adb shell su -c "rm /system/priv-app/CalendarProvider.odex"
adb shell su -c "rm /system/priv-app/Contacts.apk"
adb shell su -c "rm /system/priv-app/Contacts.odex"
adb shell su -c "rm /system/priv-app/ContactsProvider.apk"
adb shell su -c "rm /system/priv-app/ContactsProvider.odex"
adb shell su -c "rm /system/priv-app/DemoMode.apk"
adb shell su -c "rm /system/priv-app/DemoMode.odex"
adb shell su -c "rm /system/priv-app/FMPlayer.apk"
adb shell su -c "rm /system/priv-app/FMPlayer.odex"
adb shell su -c "rm /system/priv-app/FusedLocation.apk"
adb shell su -c "rm /system/priv-app/FusedLocation.odex"
adb shell su -c "rm /system/priv-app/GoogleOneTimeInitializer.apk"
adb shell su -c "rm /system/priv-app/GuideMe.apk"
adb shell su -c "rm /system/priv-app/GuideMe.odex"
adb shell su -c "rm /system/priv-app/Mms.apk"
adb shell su -c "rm /system/priv-app/Mms.odex"
adb shell su -c "rm /system/priv-app/Moodles.apk"
adb shell su -c "rm /system/priv-app/Moodles.odex"
adb shell su -c "rm /system/priv-app/MotCamera.apk"
adb shell su -c "rm /system/priv-app/MotCamera.odex"
adb shell su -c "rm /system/priv-app/MotGallery2.apk"
adb shell su -c "rm /system/priv-app/MotGallery2.odex"
adb shell su -c "rm /system/priv-app/MotoAssist.apk"
adb shell su -c "rm /system/priv-app/MotoAssist.odex"
adb shell su -c "rm /system/priv-app/MotoCare.apk"
adb shell su -c "rm /system/priv-app/MotoCare.odex"
adb shell su -c "rm /system/priv-app/MotoCareInt.apk"
adb shell su -c "rm /system/priv-app/MotoCareInt.odex"
adb shell su -c "rm /system/priv-app/MotoOneTimeInitializer.apk"
adb shell su -c "rm /system/priv-app/MotoOneTimeInitializer.odex"
adb shell su -c "rm /system/priv-app/SetupWizard.apk"
adb shell su -c "rm /system/priv-app/SprintCBS.apk"
adb shell su -c "rm /system/priv-app/SprintCBS.odex"
adb shell su -c "rm /system/priv-app/SprintDataService.apk"
adb shell su -c "rm /system/priv-app/SprintDataService.odex"
adb shell su -c "rm /system/priv-app/SprintEntitlement.apk"
adb shell su -c "rm /system/priv-app/SprintEntitlement.odex"
adb shell su -c "rm /system/priv-app/SprintExtensionService.apk"
adb shell su -c "rm /system/priv-app/SprintExtensionService.odex"
adb shell su -c "rm /system/priv-app/SprintID.apk"
adb shell su -c "rm /system/priv-app/SprintInstaller.apk"
adb shell su -c "rm /system/priv-app/SprintOMADM2.apk.bak"
adb shell su -c "rm /system/priv-app/SprintOMADM2.odex.bak"
adb shell su -c "rm /system/priv-app/SprintOverlayProvider.apk"
adb shell su -c "rm /system/priv-app/SprintOverlayProvider.odex"
adb shell su -c "rm /system/priv-app/SprintPhoneDataService.apk"
adb shell su -c "rm /system/priv-app/SprintPhoneDataService.odex"
adb shell su -c "rm /system/priv-app/SprintRoaming.apk"
adb shell su -c "rm /system/priv-app/SprintRoaming.odex"
adb shell su -c "rm /system/priv-app/SprintSettings.apk"
adb shell su -c "rm /system/priv-app/SprintSettings.odex"
adb shell su -c "rm /system/priv-app/SprintSystemDataService.apk"
adb shell su -c "rm /system/priv-app/SprintSystemDataService.odex"
adb shell su -c "rm /system/priv-app/SprintZone.apk"
adb shell su -c "rm /system/priv-app/TeleService.apk"
adb shell su -c "rm /system/priv-app/TeleService.odex"
adb shell su -c "rm /system/priv-app/VVM.apk"
adb shell su -c "rm /system/priv-app/Velvet.apk"
adb shell su -c "rm /system/priv-app/VpnDialogs.apk"
adb shell su -c "rm /system/priv-app/VpnDialogs.odex"
adb shell su -c "rm /system/priv-app/WallpaperCropper.apk"
adb shell su -c "rm /system/priv-app/WallpaperCropper.odex"
adb reboot

