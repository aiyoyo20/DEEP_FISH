有很多服务完全用不上，比如什么位置、画图3D、电影和电视、地图、3D查看器、Groove音乐等

会占用应用列表、查找的时候不方便，而且会占用一定的存储空间，如果是自启的还会占用内存和CPU资源


卸载的三种方式：

1. 手动卸载

在开始菜单中逐一找到要删除的软件。右键选择卸载

或者进入 `设置` > `应用` > `应用和功能` 逐一找到要删除的软件。右键选择卸载

或者进入 `控制面板` > `应用` > `应用和功能` 逐一找到要删除的软件。右键选择卸载

2. 依靠其他软件卸载

市面上有很多的清理软件可以实现卸载自带的软件。但一般都需要先提前选定哪些要删除的，然后批量卸载。

`CleanMyPC` 具有这个功能。但是这款软件并不是免费的，提供一些免费使用的功能。激活后才能获得所有功能的使用权。能够免费使用卸载功能，但是每次最多只能选择 10 个软件。而且在每次卸载完都会提示是否需要激活。

目前来看使用效果还可以，有一些使用手动卸载不能卸载（没有卸载选项）的软件也能卸载。

`Win10Apps` 和 `10AppsManager` 是免费软件，但是只能单个卸载。卸载是点击相应的图标就会卸载相应的软件。目前还存在一些问题，卸载后图标依旧在，就有可能不知道哪个卸载了哪个没卸载。

3. 使用命令

通过命令 `Get-AppxPackage | FINDSTR "PackageFullName"` 

```
PackageFullName        : 1527c705-839a-4832-9118-54d4Bd6a0c89_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : c5e2524a-ea46-4f67-841f-6a9465d9d515_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : E2A4F912-2574-4A75-9BB0-0D023378592B_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : F46D4000-FD22-4DB4-AC8E-4E1DDDE828FE_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.AAD.BrokerPlugin_1000.19041.3636.0_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.AccountsControl_10.0.19041.3636_neutral__cw5n1h2txyewy
PackageFullName        : Microsoft.MicrosoftEdge.Stable_92.0.902.67_neutral__8wekyb3d8bbwe
PackageFullName        : Microsoft.AsyncTextService_10.0.19041.3636_neutral__8wekyb3d8bbwe
PackageFullName        : Microsoft.BioEnrollment_10.0.19041.3636_neutral__cw5n1h2txyewy
PackageFullName        : Microsoft.CredDialogHost_10.0.19041.3636_neutral__cw5n1h2txyewy
PackageFullName        : Microsoft.ECApp_10.0.19041.3636_neutral__8wekyb3d8bbwe
PackageFullName        : Microsoft.LockApp_10.0.19041.3636_neutral__cw5n1h2txyewy
PackageFullName        : Microsoft.MicrosoftEdgeDevToolsClient_1000.19041.3636.0_neutral_neutral_8wekyb3d8bbwe
PackageFullName        : Microsoft.Win32WebViewHost_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.Apprep.ChxApp_1000.19041.3636.0_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.AssignedAccessLockApp_1000.19041.3636.0_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.CallingShellApp_1000.19041.3636.0_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.CapturePicker_10.0.19041.3636_neutral__cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.CloudExperienceHost_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.ContentDeliveryManager_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.NarratorQuickStart_10.0.19041.3636_neutral_neutral_8wekyb3d8bbwe
PackageFullName        : Microsoft.Windows.OOBENetworkCaptivePortal_10.0.19041.3636_neutral__cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.OOBENetworkConnectionFlow_10.0.19041.3636_neutral__cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.ParentalControls_1000.19041.3636.0_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.PeopleExperienceHost_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.PinningConfirmationDialog_1000.19041.3636.0_neutral__cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.Search_1.14.10.19041_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.SecHealthUI_10.0.19041.3636_neutral__cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.SecureAssessmentBrowser_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.ShellExperienceHost_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.StartMenuExperienceHost_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.Windows.XGpuEjectDialog_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.XboxGameCallableUI_1000.19041.3636.0_neutral_neutral_cw5n1h2txyewy
PackageFullName        : MicrosoftWindows.Client.CBS_1000.19053.1000.0_x64__cw5n1h2txyewy
PackageFullName        : MicrosoftWindows.UndockedDevKit_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : NcsiUwpApp_1000.19041.3636.0_neutral_neutral_8wekyb3d8bbwe
PackageFullName        : Windows.CBSPreview_10.0.19041.3636_neutral_neutral_cw5n1h2txyewy
PackageFullName        : windows.immersivecontrolpanel_10.0.2.1000_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Windows.PrintDialog_6.2.1.0_neutral_neutral_cw5n1h2txyewy
PackageFullName        : Microsoft.549981C3F5F10_1.1911.21713.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.Services.Store.Engagement_10.0.18101.0_x86__8wekyb3d8bbwe
PackageFullName        : Microsoft.Services.Store.Engagement_10.0.18101.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.UI.Xaml.2.0_2.1810.18004.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.NET.Native.Runtime.1.7_1.7.25531.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.NET.Native.Framework.1.7_1.7.25531.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.VCLibs.140.00_14.0.27323.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.VCLibs.140.00.UWPDesktop_14.0.27629.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.NET.Native.Runtime.2.2_2.2.27328.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.NET.Native.Framework.2.2_2.2.27405.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.Advertising.Xaml_10.1808.3.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.BingWeather_4.25.20211.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.DesktopAppInstaller_1.0.30251.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.GetHelp_10.1706.13331.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.Getstarted_8.2.22942.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.HEIFImageExtension_1.0.22742.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.Microsoft3DViewer_6.1908.2042.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.MicrosoftOfficeHub_18.1903.1152.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.MicrosoftSolitaireCollection_4.4.8204.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.MicrosoftStickyNotes_3.6.73.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.MixedReality.Portal_2000.19081.1301.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.MSPaint_6.1907.29027.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.Office.OneNote_16001.12026.20112.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.People_10.1902.633.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.ScreenSketch_10.1907.2471.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.SkypeApp_14.53.77.0_x64__kzf8qxf38zg5c
PackageFullName        : Microsoft.StorePurchaseApp_11811.1001.18.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.VP9VideoExtensions_1.0.22681.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.Wallet_2.4.18324.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.WebMediaExtensions_1.0.20875.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.WebpImageExtension_1.0.22753.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.Windows.Photos_2019.19071.12548.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.WindowsAlarms_10.1906.2182.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.WindowsCalculator_10.1906.55.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.WindowsCamera_2018.826.98.0_x64__8wekyb3d8bbwe
PackageFullName        : microsoft.windowscommunicationsapps_16005.11629.20316.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.WindowsFeedbackHub_1.1907.3152.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.WindowsMaps_5.1906.1972.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.WindowsSoundRecorder_10.1906.1972.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.WindowsStore_11910.1002.5.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.Xbox.TCUI_1.23.28002.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.XboxApp_48.49.31001.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.XboxGameOverlay_1.46.11001.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.XboxGamingOverlay_2.34.28001.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.XboxIdentityProvider_12.50.6001.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.XboxSpeechToTextOverlay_1.17.29001.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.YourPhone_0.19051.7.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.ZuneMusic_10.19071.19011.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.ZuneVideo_10.19071.19011.0_x64__8wekyb3d8bbwe
PackageFullName        : Microsoft.LanguageExperiencePackzh-CN_19041.70.233.0_neutral__8wekyb3d8bbwe
PackageFullName        : CanonicalGroupLimited.Ubuntu22.04LTS_2204.3.63.0_x64__79rhkp1fndgsc
PackageFullName        : TheDebianProject.DebianGNULinux_1.15.0.0_x64__76v4gfsz19hv4
PackageFullName        : Microsoft.MicrosoftEdge.Stable_121.0.2277.128_neutral__8wekyb3d8bbwe
```

这便是所有的软件的名字。这是我在删除了一些之后剩下的，可能不全。找出要删除的。使用`Remove-AppxPackage <PackageName>` 删除即可

一些已知的软件的中英文名字：

```
Get-AppxPackage *3dbuilder*                     | Remove-AppxPackage   # 3D Builder
Get-AppxPackage *windowsalarms*                 | Remove-AppxPackage   # 闹钟与时钟
Get-AppxPackage *windowscalculator*             | Remove-AppxPackage   # 行事历
Get-AppxPackage *windowscommunicationsapps*     | Remove-AppxPackage   # 行事历与邮件
Get-AppxPackage *windowscamera*                 | Remove-AppxPackage   # 相机
Get-AppxPackage *officehub*                     | Remove-AppxPackage   # 取得Office
Get-AppxPackage *skypeapp* 						| Remove-AppxPackage   # 取得Skype
Get-AppxPackage *getstarted* 					| Remove-AppxPackage   # 取得开始
Get-AppxPackage *zunemusic* 					| Remove-AppxPackage   # Groove 音乐
Get-AppxPackage *windowsmaps* 					| Remove-AppxPackage   # 地图
Get-AppxPackage *solitairecollection*           | Remove-AppxPackage   # Microsoft Solitaire Collection 扑克牌游戏
Get-AppxPackage *bingfinance* 					| Remove-AppxPackage   # 财经
Get-AppxPackage *zunevideo* 					| Remove-AppxPackage   # Movies & TV
Get-AppxPackage *bingnews* 						| Remove-AppxPackage   # 新闻
Get-AppxPackage *onenote* 						| Remove-AppxPackage   # OneNote
Get-AppxPackage *people* 						| Remove-AppxPackage   # 联络人
Get-AppxPackage *windowsphone* 					| Remove-AppxPackage   # 手机小帮手
Get-AppxPackage *photos* 						| Remove-AppxPackage   # 相片
Get-AppxPackage *windowsstore* 					| Remove-AppxPackage   # 市集
Get-AppxPackage *bingsports* 					| Remove-AppxPackage   # 运动
Get-AppxPackage *soundrecorder* 				| Remove-AppxPackage   # 语音录音机
Get-AppxPackage *bingweather* 					| Remove-AppxPackage   # 天气
Get-AppxPackage *xboxapp* 						| Remove-AppxPackage   # Xbox
```

还有得是 `Get-AppxPackage | Remove-AppxPackage`  删除所有软件。并不建议。可能会影响基本的功能。

同理，有的是加了一个循环过滤，但是依旧可能会删除过多的。使用前详细分析一下再使用。

而如果删除了想要恢复可以使用 `Add-AppxPackage <PackageName>`  恢复相应的软件。