[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=28366cf0-cf89-4792-91f8-008bfa43b3dc
Description=�ڪ��}��1
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
'�s�@
UserVar QQ="This is MY BLOG:http://dreammy0924.blogspot.com/" "This is English version."
UserVar QQQ="This is MY BLOG:http://kidyu.pixnet.net/blog/" "For Non-Traditional Chinese."
UserVar runtimes=999 "Script number (friends all pick up counted once) "
UserVar page=314 "Picking up friends pages (314 if the input is to pick the bottom page)"
UserVar feedpage=DropList{"NO":0|"YES":1}=0 "Page-Feed-Fish (feed once per page)"
UserVar pickgarbage=DropList{"NO":0|"YES":1}=0 "Garbage collection"
UserVar garbagestyle=DropList{"NO":0|"HOME":1|"FRIEND":2}=0 "Throw Garbage To Somewhere (Garbage collection must be YES)"
UserVar FriendgarbageNAME=0 "Throw Garbages To Friend (Friend's Name)"
'UserVar HideFish=DropList{"NO":0|"YES":1}=1 "Hide swordfish"
UserVar feednum1=DropList{"NO":0|"5":5|"10":10|"20":20|"40":40|"60":60|"100":100}=4 "[ Own ] feed number no more than 40 "
UserVar stellmyself=DropList{"NO":0|"YES":1}=1 "[ Own ] pick up the Treasure "
UserVar feednum2=DropList{"NO":0|"5":5|"10":10|"20":20|"40":40|"60":60|"100":100}=1"[ Friends ] feed number no more than 40 "
UserVar stell=DropList{"NO":0|"YES":1}=1 "[ Friends ] pick up the Treasure"
'UserVar feedfish=DropList{"Custom":0|"Yellow":1|"Green":2|"Red":3|"YellowBIG":4|"GreenBIG":5|"RedBIG":6}=0 "The color of feed."
UserVar Nlocations1=470 "[ Advanced ] Custom pick Treasure Point 1"'477
UserVar Nlocations2=490 "[ Advanced ] Custom pick Treasure Point 2"'492
UserVar Nlocations3=500 "[ Advanced ] Custom pick Treasure Point 3"'507
UserVar Nlocations4=510 "[ Advanced ] Custom pick Treasure Point 4"'519
UserVar whatpage=0 "Start from what pages"
UserVar Msgvisible=DropList{"NO":0|"YES":1}=1 "Message (Used for the background to remind)"
UserVar CodeByKID=0 "Code"
UserVar hidetime=1 "RE[Hide swordfish]"
'''''''''''''''UserVar feedtimes=3600 "Feeding time (seconds)"
UserVar Refresh1=5 "Refresh button (seconds)"
UserVar NotGoHome=DropList{"NO":0|"YES":1}=0 "Do not go home"
'UserVar Userfeedtime1=0 "[ Own ] How long wait for fish eat[Do not move if you don't understand.]"
'UserVar Userfeedtime2=0 "[ Friends ] How long wait for fish eat[Do not move if you don't understand.]"
UserVar stelllocationX=740 "stell[X-axis][75~750]"
UserVar NfeedXME=160 "Home feeding position X160"
UserVar NfeedYME=130 "Home feeding position Y130"
UserVar NfeedXFD=188 "Friend feeding position X188"
UserVar NfeedYFD=25 "Friend feeding position Y25"
UserVar Positioning=DropList{"NO":0|"YES":1}=0 "User Positioning "
UserVar ADClose1="660.115" "Close Game Activities1(X.Y)"
UserVar ADClose2="0.0" "Close Game Activities2(X.Y)"
UserVar ADClose3="0.0" "Close Game Activities3(X.Y)"
UserVar FishbowlPART123FD=DropList{"NO":0|"YES":1}=0 "Fishbowl For I II III "
UserVar KFishpicturecontrol=DropList{"NO":0|"YES":1}=0 "now you can change the picture from <.\plugin\KFish> and not be changed by KFish."

'UserVar FUCK=1 "Close Game Activities"
UserVar Straightstell=DropList{"Horizontalstell":0|"Straightstell":1}=0 "Direction of Stell"
If KFishpicturecontrol=0 Then 
PutAttachment ".\plugin\KFish","*.bmp"
PutAttachment "C:\WINDOWS\Fishbowl","*.bmp"
End If 
Dim stopstop : stopstop="true"'�Y���h�u�{�M��
Dim StartmessageTOPIC : StartmessageTOPIC="�}�o�̼Ҧ�"
Dim DEMO : DEMO=30
Dim frienddistance : frienddistance=275-65 '�n�ͦW���l��
Dim Totalnum : Totalnum=0 '����
Dim Initialnum : Initialnum=0 '�@��
Dim FeedTotalnum : FeedTotalnum=0 '����
Call Plugin.File.DeleteFile("C:\WINDOWS\Fishbowl\user.dat") '�g�J0
handle=Plugin.File.OpenFile("C:\WINDOWS\Fishbowl\user.dat")   
Call Plugin.File.WriteFile(handle,Initialnum&"/^\"&FeedTotalnum&"/^\"&Totalnum )
Call Plugin.File.CloseFile(handle)
'''''�ƭ�
locations1=Nlocations1
locations2=Nlocations2
locations3=Nlocations3
locations4=Nlocations4
feedXME=NfeedXME
feedYME=NfeedYME
feedXFD=NfeedXFD
feedYFD=NfeedYFD
XD=40
stellspeed=1
HideFish=1
Userfeedtime1=0
Userfeedtime2=0
RegularlyFeed=0
ADCloseing1 = Split(ADClose1, ".", -1, 1) ' �����ƭ�
ADCloseing2 = Split(ADClose2, ".", -1, 1) ' �����ƭ�
ADCloseing3 = Split(ADClose3, ".", -1, 1) ' �����ƭ�
If feedXME>750 Then :feedXME=750  '�����w��
ElseIf feedXFD>750 Then :feedXFD=750
ElseIf feedYFD>530 Then :feedYFD=530
ElseIf feedYME>530 Then :feedYME=530 :End If
If stelllocationX>750 Then :stelllocationX=750 '���_�w��
ElseIf stelllocationX<75 Then:stelllocationX=75 :End If
'''''�ƭ�

'�t�θ��
'sPath = Plugin.Sys.GetDir(0)
GetOS = abs(Plugin.Sys.GetOSType())'�t��
GetCDKEY =abs( Plugin.Sys.GetHDDSN())'�w��
ScreenW = Plugin.Sys.GetScRX()'�ù��e
ScreenH = Plugin.Sys.GetScRY()'�ù���
Dev = Plugin.Sys.GetScDep()'�ù��줸

//\\\\\\\\\\\\\\\\\\\\�w��֤�////////////////////
Dim powerA : powerA=169
Dim powerB : powerB=6
FindPic 0,0,ScreenW,ScreenH,"Attachment:\Fishbowl Judge.bmp",0.7,pA,pB
If pA<0 and pB<0 Then
    MsgBox "�w�쥢��",16,"�w�쥢��"
    FAQ=MsgBox ("�ˬd�H�U���D"&vbCrLf&"1.�Ц^�ۤv���ڽc���ˬd���������߹��O�_�Q�B����y���L�k�w��"&vbCrLf&"2.�s�������g�Y��L�нվ�ܭ�l�j�p100%"&vbCrLf&"3.�Y�H�W���D���S�o�ͽ������{���M�s�������s�}��"&vbCrLf&vbCrLf&vbCrLf&"PS1:�i�HCode��JHELP�إ߿��~���i�Х浹�@��"&vbCrLf&"PS2:�i�N�۰ʩw�쥴�ĨӦۤv�w��"&vbCrLf&"PS3:�i��]�m���s�άOBlog�d��FAQ���o��ԲӸ�T"&vbCrLf&"",64,"���˹�O�_��m��32�줸")
    EndScript
End If
Delay 100
Dim ZX :ZX=pA-powerA
Dim ZY :ZY=pB-powerB
MoveTo 385+ZX,20+ZY : Delay 100 : LeftClick 1 : Delay 100
Dim A :A=Plugin.Window.MousePoint()
Dim B :B=Plugin.Window.Foreground()
s = Plugin.Window.GetClientRect(A)
XYArray = Split(s, "|")
dx = XYArray(0)
dy = XYarray(1)
sRectC = Plugin.Window.GetWindowRect(B)
MyArraysRectC = Split(sRectC, "|")  
Call Plugin.File.DeleteFile("C:\WINDOWS\Fishbowl\web.dat")
handle=Plugin.File.OpenFile("C:\WINDOWS\Fishbowl\web.dat")   
Call Plugin.File.WriteFile(handle, B&"\\"&ScreenW&"\\"&ScreenH&"\\"&Clng(MyArraysRectC(2))-Clng(MyArraysRectC(0))&"\\"&Clng(MyArraysRectC(3))-Clng(MyArraysRectC(1)))
Call Plugin.File.CloseFile(handle)
Delay 300 : Plugin.BGCP2_02.TransformWindow A : Delay 300
MsgBox  "�w�즨�\"& chr (10) &"�w�즨�\,���椤�ɶq�O�N�ƹ�������ڽc�|�z�Z�{��í�w��..."& chr (10) &"�п�w�}�ƥ]�b���T�w�~��ҥ������\��",64,StartmessageTOPIC&" Script start"
MoveTo ScreenW/2,ScreenH-5
Call Plugin.Msg.Tips("�w�즨�\,���椤�ɶq�O�N�ƹ�������ڽc�|�z�Z...")
//\\\\\\\\\\\\\\\\\\\\�w��֤�////////////////////
//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\\\\\\\\\\\\\\\\\\\�}������////////////////////
For runtimes
    Initialnum=0
    For 12
        Call mv( 260+ZX-dx, 590+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
    Next 
    Delay 500
    Call mv( 260+ZX-dx, 510+ZY-dy )
    Delay DEMO
    Call lc
    Call Plugin.Msg.Tips("���ݴ`��")
    Call mv( 535+ZX-dx, 485+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO  
    Call mv( 490+ZX-dx, 405+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
    Delay Refresh1*1000
    IF NotGoHome=1 Then
    Else 
        Call mv( 222+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
        If Msgvisible=1 Then
            Call Plugin.Msg.Tips("GO to MY FishBowl")
        End If
        noDelay=1 
        Call �ۤv�a�߬B����()
    End If
    If whatpage>0 Then
        For whatpage-1
            Call mv( 725+ZX-dx, 590+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO
            Delay 500
        Next
    End if
    If page>=1 Then
        Call  �@�㭶()
        For 12
            Call mv( 260+ZX-dx, 590+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO
        Next 
    End if
    If page>=2 Then
        For page-1
            For 12
                Call mv( 260+ZX-dx, 590+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO
            Next  
            Call mv( 725+ZX-dx, 590+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
            Delay 1000
            If feedpage>0 Then
                Call mv( 222+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO
                Delay 300
                Call ����P�_()
                Delay 500
                noDelay=1 
                Call �����ۤv()
            End If 
            Call �@�㭶()
        Next
    End If
    Rem ending
Next
EndScript
//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\\\\\\\\\\\\\\\\\\\�@�㭶////////////////////
Sub �@�㭶()
    Call �n�ͦW��(7)
    For 1
        Call mv( 695+ZX-dx, 590+ZY-dy  )
        Delay DEMO
        Call lc
    Next
    For i=1 to 11
        Delay 1000
        Plugin.BGCP2_02.FindPicture A,675+ZX-dx,580+ZY-dy,705+ZX-dx,600+ZY-dy,sPath&"\plugin\KFish\Fishbowl IF2.bmp",50,0.8,FX,FY
        If FX>0 AND FY>0 Then 
            i=11
        Else
            If i=11 Then 
            Else
                Call mv( frienddistance+(65*4)+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO'��7��
                Call �n�ͮa�߬B����() : Delay 500  : Call ��L����() : Delay 1000
                Call mv( frienddistance+(65*5)+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO'��7��
                Call �n�ͮa�߬B����() : Delay 500  : Call ��L����() : Delay 1000
                Call mv( frienddistance+(65*6)+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO'��7��
                Call �n�ͮa�߬B����() : Delay 500  : Call ��L����() : Delay 1000
                Call mv( frienddistance+(65*7)+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO'��7��
                Call �n�ͮa�߬B����() : Delay 500  : Call ��L����() : Delay 1000 
            End If 
        End If 
        If i=11 Then 
            Call mv( frienddistance+(65*5)+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO'��7��
            Call �n�ͮa�߬B����() : Delay 500 : Call ��L����() : Delay 1000
            Call mv( frienddistance+(65*6)+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO'��7��
            Call �n�ͮa�߬B����() : Delay 500 : Call ��L����() : Delay 1000
            Call mv( frienddistance+(65*7)+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO'��7��
            Call �n�ͮa�߬B����() : Delay 500 : Call ��L����() : Delay 1000
            Delay 500
            Plugin.BGCP2_02.FindPicture A,710+ZX-dx,570+ZY-dy,740+ZX-dx,600+ZY-dy,sPath&"\plugin\KFish\Fishbowl EIF.bmp",30,0.7,EFX,EFY
            If EFX>0 AND EFY>0 Then 
                Goto ending
            End If
        End if

        For 1
            Call mv( 695+ZX-dx, 590+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO
        Next
    Next   
  
End Sub
//\\\\\\\\\\\\\\\\\\\\�@�������@��////////////////////
Sub �n�ͦW��(friendnum)
    friendnumm=1
    For friendnumm=1 to friendnum
        Call mv( frienddistance+(65*friendnumm)+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO '�I���n��
        Call �n�ͮa�߬B����() : Delay 500  : Call ��L����() : Delay 1000
    Next 
 
End Sub 
//\\
//\\

//\\
//\\
//\\
//\\
//\\
//\\
//\\
//\\

//\\
//\\
//\\
//\\\\\\\\\\\\\\\\\\\\����P�_////////////////////
Sub ����P�_()
    If noDelay=1 Then 
        For i=0 to 5 
            Call Plugin.Msg.Tips("Waiting..."&(5-i))
            Delay 1000
        Next
        noDelay=0
    Else 
        Delay 1000 
    End If 
    Do 
        Call �T�{�C��()
        Plugin.BGCP2_02.FindPicture A,715+ZX-dx,75+ZY-dy,755+ZX-dx,105+ZY-dy,sPath&"\plugin\KFish\Fishbowl BM.bmp",30,0.8,BX,BY
        If BX>0 AND BY>0 Then
        Else
            Exit Do 
        End if
        Delay 500
    Loop 
    WYok=0
    Do 
        Plugin.BGCP2_02.FindPicture A,715+ZX-dx,75+ZY-dy,755+ZX-dx,105+ZY-dy,sPath&"\plugin\KFish\Fishbowl WM.bmp",30,0.8,WX,WY
        If WX>0 AND WY>0 Then
            Delay 300
            Exit Do
        Else
            Delay 300
            Call �T�{�C��()
            If WYok=10 Then
                Exit Do
            Else  
            End If 
            WYok=WYok+1
        End if
    Loop 

End Sub
//\\
//\\
//\\

//\\
//\\
//\\\\\\\\\\\\\\\\\\\\�n�ͮa�߬B��������////////////////////
Sub �n�ͮa�߬B����() 
    Call ����P�_()
    If pickgarbage=1 
        Call ���U��
        For 2
            Plugin.BGCP2_02.FindPicture A,325+ZX-dx,355+ZY-dy,425+ZX-dx,390+ZY-dy,sPath&"\plugin\KFish\Fishbowl C.bmp",30,0.8,YesX,YesY
            If YesX>0 AND YesY>0 Then 
                Call �U����
                Goto �n�ͮa�߬B��������
            Else 
            End If
        Next 
    End If 
    Dim  swordfish : swordfish=0
    If HideFish=1 Then 
        Delay (1500*hidetime)-(1000*pickgarbage)
        For 3*hidetime
            Plugin.BGCP2_02.FindPicture A,10+ZX-dx,10+ZY-dy,740+ZX-dx,420+ZY-dy,sPath&"\plugin\KFish\Fishbowl SL.bmp",30,0.4,SLX,SLY
            Delay 500
            Plugin.BGCP2_02.FindPicture A,10+ZX-dx,10+ZY-dy,740+ZX-dx,420+ZY-dy,sPath&"\plugin\KFish\Fishbowl SR.bmp",30,0.4,SRX,SRY
            If SLX>0 OR SRX>0 Then
                swordfish=1 
            End if
        Next
    End if
    If swordfish=0 Then
        Call �����n��() 
        If stell=1 Then 
            If Straightstell=1 Then 
                For 2
                    Call mv( 455+ZX-dx, 485+ZY-dy  ) : Delay DEMO : Call lc
                Next 
                Call �߬B�_��S()
            Else 
                xyz=locations1-83 : Call �߬B�_��FD()   
                xyz=locations2-83 : Call �߬B�_��FD()    
                xyz=locations3-83 : Call �߬B�_��FD()   
                xyz=locations4-83 : Call �߬B�_��FD()   
            End If
            Delay 1000
        End if
    End if
    Initialnum=Initialnum+1
    Totalnum=Totalnum+1
    Call Plugin.File.DeleteFile("C:\WINDOWS\Fishbowl\user.dat")
    handle=Plugin.File.OpenFile("C:\WINDOWS\Fishbowl\user.dat")   
    Call Plugin.File.WriteFile(handle,Initialnum&"/^\"&FeedTotalnum&"/^\"&Totalnum )
    Call Plugin.File.CloseFile(handle)
    If Msgvisible=1 Then
        Call Plugin.Msg.Tips("Number "&Initialnum&" was stealed, a total of "&Totalnum&" .")
    End If
    Rem �n�ͮa�߬B��������
    If CodeByKID=987654321 Then 
    Else 
        WYok=0
        Do 
            Plugin.BGCP2_02.FindPicture A,715+ZX-dx,75+ZY-dy,755+ZX-dx,105+ZY-dy,sPath&"\plugin\KFish\Fishbowl WM.bmp",30,0.8,WX,WY
            If WX>0 AND WY>0 Then 
                Delay 300
                Exit Do
            Else
                Delay 300
                Call �T�{�C��()
                If WYok=10 Then 
                    Exit Do
                Else  
                End If 
                WYok=WYok+1
            End if
        Loop 
    End If 
End Sub
//\\
//\\
//\\\\\\\\\\\\\\\\\\\\�ۤv�a�߬B��������TF////////////////////
Sub �ۤv�a�߬B����()
    Call ����P�_()
    Delay 500
    Call �����ۤv()
    Call mv( 640+ZX-dx, 360+ZY-dy  ) : Delay DEMO : Call lc
    Delay 2000
    Call mv( 440+ZX-dx, 385+ZY-dy  ) : Delay DEMO : Call lc
    Delay 1000
    Call mv( 325+ZX-dx, 375+ZY-dy  ) : Delay DEMO :Call lc
    Delay 500
    If stellmyself=1 Then
        //
        xyz=locations1-83 : Call �߬B�_��HM()    
        xyz=locations2-83 : Call �߬B�_��HM()    
        xyz=locations3-83 : Call �߬B�_��HM()    
        xyz=locations4-83 : Call �߬B�_��HM()   
    End if
    Delay 1000
    If Msgvisible=1 Then
        Call Plugin.Msg.Tips("Pick up is already")
    End If
    
End Sub
//\\
//\\
//\\\\\\\\\\\\\\\\\\\\�����ۤv////////////////////
Sub �����ۤv()
    If feednum1>0 Then 
        FeedTotalnum=FeedTotalnum+1 
        Call Plugin.File.DeleteFile("C:\WINDOWS\Fishbowl\user.dat")
        handle=Plugin.File.OpenFile("C:\WINDOWS\Fishbowl\user.dat")   
        Call Plugin.File.WriteFile(handle,Initialnum&"/^\"&FeedTotalnum&"/^\"&Totalnum )
        Call Plugin.File.CloseFile(handle)
        If Msgvisible=1 Then
            Call Plugin.Msg.Tips("Feed MY Fish.")
        ElseIf Msgvisible=0
        End If
        Delay DEMO : Call mv( 440+ZX-dx, 485+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO  :

        Dim feedX : feedX=feedXME+ZX-dx-8
        Dim feedY : feedY=feedYME
        For feednum1
            Call mv( feedX, feedY+ZY-dy ) : Delay 10 : Call lc : Delay 10 
        Next
        If Msgvisible=1 Then
            Call Plugin.Msg.Tips("Waiting for fish meal")
        End If
        If Userfeedtime1=0 Then 
            If feednum1>50 Then 
                For 12+(feednum1-50)*0.08 : Delay 1000 : Next 
            Else 
                For 2+feednum1*0.12  : Delay 1000 : Next 
            End If
        Else 
            For Userfeedtime1 : Delay 1000 : Next 
        End If
        Call mv( 535+ZX-dx, 485+ZY-dy  ) : Delay DEMO : Call lc 
        If Msgvisible=1 Then
            Call Plugin.Msg.Tips("Feeding is already")
        End If
    End If
    If  garbagestyle=1 and CodeByKID=987654321 Then 
        Call mv( 665+ZX-dx, 465+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
        Delay 500
        Call mv( 590+ZX-dx, 450+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
        Call mv( 372+ZX-dx, 377+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
        Delay 2000
        fullgarbage=0
        Call Plugin.Msg.Tips("�a�̥�U������")
    End If 
End Sub
//\\
//\\
//\\\\\\\\\\\\\\\\\\\\�����n��////////////////////
Sub �����n��()
    If feednum2>0 Then
        Delay DEMO : Call mv( 355+ZX-dx, 485+ZY-dy  ) : Delay DEMO : Call lc : Delay DEMO 
        Dim feedX : feedX=feedXFD+ZX-dx-8 
        Dim feedY : feedY=feedYFD
        For feednum2
            Call mv( feedX, feedY+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
        Next 
        
        If Userfeedtime2=0 Then 
            If feednum2>50 Then 
                If feednum2>100 Then 
                    For 16+(feednum2-100)*0.05 : Delay 1000 : Next 
                Else
                    For 11+(feednum2-50)*0.1 : Delay 1000 : Next
                End If
            Else 
                For 2+feednum2*0.2 : Delay 1000 : Next
            End If
        Else 
            For Userfeedtime2  : Delay 1000 : Next
        End If
    End If
End Sub
//\\
//\\
//\\
//\\
//\\\\\\\\\\\\\\\\\\\\�T�{�C��////////////////////
Sub �T�{�C��()
    Do 
        Plugin.BGCP2_02.FindPicture A,325+ZX-dx,355+ZY-dy,425+ZX-dx,390+ZY-dy,sPath&"\plugin\KFish\Fishbowl C.bmp",30,0.7,YesX,YesY
        If YesX>0 AND YesY>0 Then 
            For 10
                Call mv( 372+ZX-dx, 377+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO
            Next
            Delay 1000
        Else
            Exit do  
        End if
    Loop
End Sub
//\\
//\\
//\\\\\\\\\\\\\\\\\\\\���U��////////////////////
Sub ���U��
    If pickgarbage=1 and fullgarbage=0 Then 
        Plugin.BGCP2_02.FindPicture A,630+ZX-dx,440+ZY-dy,690+ZX-dx,490+ZY-dy,sPath&"\plugin\KFish\Fishbowl GB.bmp",40,0.5,GBX,GBY
        If GBX>0 or GBY>0 Then 
            For 5
                Call mv( 665+ZX-dx, 465+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO
            Next
            Delay 500
        End If
    End if
End Sub




Sub �U����
    If pickgarbage=1 Then
        fullgarbage=1
        Call Plugin.Msg.Tips("�U����w��,����ߩU��")
        Select Case garbagestyle
        Case 1         
            Delay 500
            For 5 
                Call mv( 372+ZX-dx, 377+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO
            Next
            Delay 500
            Call mv( 222+ZX-dx, 576+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
            noDelay=1
            Call ����P�_()
            For i=0 to 5 
                Call Plugin.Msg.Tips("Waiting..."&(5-i))
                Delay 1000
            Next
            Call mv( 665+ZX-dx, 465+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
            Delay 500
            Call mv( 590+ZX-dx, 450+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
            Call mv( 372+ZX-dx, 377+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
            Delay 2000
            fullgarbage=0
            Call Plugin.Msg.Tips("�a�̥�U������")
        Case 2      
            If FriendgarbageNAME=0 Then 
            Else 
                Delay 500
                For 5 
                    Call mv( 372+ZX-dx, 377+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO
                Next
                Delay 500
                For 12
                    Call mv( 260+ZX-dx, 590+ZY-dy ) : Delay DEMO : Call lc : Delay DEMO 
                Next 

                Call mv( 285+ZX-dx, 505+ZY-dy  ) : Delay DEMO : Call lc
                Delay 500
                For 20 
                    Call Plugin.Bkgnd.KeyPress (A, 46)
                    Delay 10
                Next 
                Delay 500
                Call Plugin.Bkgnd.SendString(A, FriendgarbageNAME)
                Delay 1000
                Call mv( frienddistance+(65*1)+ZX-dx, 576+ZY-dy  )
                Delay DEMO
                Call lc
                Call ����P�_()
                Delay 500
                For 5
                    Call mv( 665+ZX-dx, 465+ZY-dy  ) : Delay DEMO : Call lc
                    Delay 1000
                    Call mv( 590+ZX-dx, 450+ZY-dy  ) : Delay DEMO : Call lc
                Next 
                Delay 2500
                Call mv( 285+ZX-dx, 505+ZY-dy  ) : Delay DEMO : Call lc
                Delay 500
                For 20 
                    Call Plugin.Bkgnd.KeyPress (A, 46)
                    Delay 10
                Next 
                For 12
                    Call mv( 260+ZX-dx, 590+ZY-dy  )
                    Delay DEMO
                    Call lc
                Next 
                fullgarbage=0
                Call Plugin.Msg.Tips("�n�ͥ�U������,�i���k��")
                If whatpage>0 Then 
                    For whatpage-1
                        Call mv( 725+ZX-dx, 590+ZY-dy  ):Delay DEMO:Call lc
                        Delay 1000
                    Next
                End If 
                IF Int(Initialnum)>0 Then 
                    IF Int((Initialnum-1)/50)>1 Then
                        For Int((Initialnum-1)/50)
                            Call mv( 725+ZX-dx, 590+ZY-dy  ):Delay DEMO:Call lc
                            Delay 1000
                        Next
                    END IF 
                END IF
            END IF
        End Select 
    End If
End Sub
//\\
//\\
//\\\\\\\\\\\\\\\\\\\\�߬B�_��HM////////////////////
Sub �߬B�_��HM()
    If xyz>0 Then
        For 2
            Call mv( 535+ZX-dx, 485+ZY-dy ) : Delay DEMO : Call lc
        Next       
        xx=50+ZX-dx
        Do Until xx>(stelllocationX+ZX-dx)
            Delay 7*stellspeed
            Call mv( xx, xyz+ZY-dy )

            Call lc

            xx=xx+XD 
        Loop 
        Delay 500
    End If
End Sub

Sub �߬B�_��FD()
    If xyz>0 Then
        For 2
            Call mv( 455+ZX-dx, 485+ZY-dy ) : Delay DEMO : Call lc 
        Next 
        xx=50+ZX-dx
        Do  Until xx>(stelllocationX+ZX-dx)
            Delay 7*stellspeed
           
            Call mv( xx, xyz+ZY-dy )
            Call lc
            Plugin.BGCP2_02.FindPicture A,325+ZX-dx,355+ZY-dy,425+ZX-dx,390+ZY-dy,sPath&"\plugin\KFish\Fishbowl C.bmp",30,0.8,QYesX,QYesY
            If QYesX>0 AND QYesY>0 Then
                Call mv( 375+ZX-dx, 373+ZY-dy )
                Delay DEMO : Call lc
                Delay 200
                Call mv( 455+ZX-dx, 485+ZY-dy )
                Delay DEMO : Call lc : Delay DEMO : Call lc : Delay DEMO : Call lc
                XX=XX-2*XD
            Else
            End if 
            xx=xx+XD
        Loop 
        Delay 500
    End If 
End Sub

Sub �߬B�_��S()
    For 2
        Call mv( 455+ZX-dx, 485+ZY-dy ) : Delay DEMO : Call lc 
    Next
    xx=50+ZX-dx
    Do Until xx>(stelllocationX+ZX-dx)
      
        Call mv( xx+rnd(), locations1-83+ZY-dy )
        Call mv( xx+rnd(), locations2-83+ZY-dy )
        Call mv( xx+rnd(), locations3-83+ZY-dy )
        Call mv( xx+rnd(), locations4-83+ZY-dy )
        Delay 7*stellspeed*4
        Plugin.BGCP2_02.FindPicture A,325+ZX-dx,355+ZY-dy,425+ZX-dx,390+ZY-dy,sPath&"\plugin\KFish\Fishbowl C.bmp",30,0.8,QYesX,QYesY
        If QYesX>0 AND QYesY>0 Then
            Call mv( 375+ZX-dx, 373+ZY-dy )
            Delay DEMO : Call lc
            Delay 200
            Call mv( 455+ZX-dx, 485+ZY-dy )
            Delay DEMO : Call lc : Delay DEMO : Call lc : Delay DEMO : Call lc
            XX=XX-2*XD
        Else
        End if  
        xx=xx+XD
    Loop 
    Delay 500
End Sub 
//\\\\\\\\\\\\\\\\\\\\Regularly Feed////////////////////

Sub ��L����()

    ForFishbowlPART1=0 : ForFishbowlPART2=0 : ForFishbowlPART3=0
    Plugin.BGCP2_02.FindPicture A,170+ZX-dx,40+ZY-dy,208+ZX-dx,50+ZY-dy,sPath&"\plugin\KFish\Fishbowl PT.bmp",10,0.8,FishbowlPART1X,FishbowlPART1Y
    If FishbowlPART1X>0
        ForFishbowlPART1=1
    End If 
    Plugin.BGCP2_02.FindPicture A,208+ZX-dx,40+ZY-dy,243+ZX-dx,50+ZY-dy,sPath&"\plugin\KFish\Fishbowl PT.bmp",10,0.8,FishbowlPART2X,FishbowlPART2Y
    If FishbowlPART2X>0
        ForFishbowlPART2=1
    End If 
    Plugin.BGCP2_02.FindPicture A,243+ZX-dx,40+ZY-dy,280+ZX-dx,50+ZY-dy,sPath&"\plugin\KFish\Fishbowl PT.bmp",10,0.8,FishbowlPART3X,FishbowlPART3Y
    If FishbowlPART3X>0
        ForFishbowlPART3=1
    End If
    Delay 500
    If CodeByKID=498411291 Then 
        Call Plugin.Msg.Tips("����: "&ForFishbowlPART1&"."&ForFishbowlPART2&"."&ForFishbowlPART3) 
    End If 
    If FishbowlPART123FD=1
        If ForFishbowlPART1=1 Then 
            Call mv( FishbowlPART1X+15, FishbowlPART1Y+15 ) : Delay DEMO : Call lc : Delay DEMO
            Initialnum=Initialnum-1
            Totalnum=Totalnum-1
            Call �n�ͮa�߬B����() : Delay 500
        End If 
        If ForFishbowlPART2=1 Then 
            Call mv( FishbowlPART2X+15, FishbowlPART2Y+15 ) : Delay DEMO : Call lc : Delay DEMO
            Initialnum=Initialnum-1
            Totalnum=Totalnum-1
            Call �n�ͮa�߬B����() : Delay 500
        End If
        If ForFishbowlPART3=1 Then 
            Call mv( FishbowlPART3X+15, FishbowlPART3Y+15 ) : Delay DEMO : Call lc : Delay DEMO
            Initialnum=Initialnum-1
            Totalnum=Totalnum-1
            Call �n�ͮa�߬B����() : Delay 500
        End If
    End If 

End Sub 

//\\\\\\\\\\\\\\\\\\\\�}������////////////////////
Sub OnScriptExit
    If stopstop="true" Then
        Plugin.BGCP2_02.UnTransformWindow A 
        UserCount=B
        UserCount=UserCount&vbCrLf&vbCrLf
        UserCount=UserCount&"*****************************************************************************"&vbCrLf
        UserCount=UserCount&"*****************************************************************************"&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"�{���]�m�O�s�A�Ĩ�����ƥH�Q�s�ɿ򥢥� "&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"�A���ù��ѪR�׬�: "&ScreenW&" X "&ScreenH&"��m��"&Dev&"�줸"&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"Code= "&CodeByKID&vbCrLf
        UserCount=UserCount&"�ۦ�w��= "&Positioning&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"�έp�H��: "&vbCrLf
        UserCount=UserCount&"�o�@�밽���F["&Initialnum&" �H]"&vbCrLf
        UserCount=UserCount&"�}������쵲�������F["&Totalnum&" �H]"&vbCrLf
        UserCount=UserCount&"�����ۤv["&FeedTotalnum&" ��]"&vbCrLf
        UserCount=UserCount&"���榸��= "&runtimes&vbCrLf
        UserCount=UserCount&"������X��= "&page&vbCrLf
        UserCount=UserCount&"��������= "&feedpage&vbCrLf
        UserCount=UserCount&"�ĴX���}�l= "&whatpage&vbCrLf
        UserCount=UserCount&"�ߩU��= "&pickgarbage&vbCrLf
        UserCount=UserCount&"�^�a��U��= "&garbagestyle&vbCrLf
        UserCount=UserCount&"��U�����n�ͦW�r= "&FriendgarbageNAME&vbCrLf
        UserCount=UserCount&"���C��= "&HideFish&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"�a�̴X��= "&feednum1&vbCrLf
        UserCount=UserCount&"�a�̾߬B= "&stellmyself&vbCrLf  
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"�n�ʹX��= "&feednum2&vbCrLf
        UserCount=UserCount&"�n�;߬B= "&stell&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"���w����= "&whatpage&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"�ݦb�a�������߬B: "&vbCrLf
        UserCount=UserCount&"�����߬B�ɶ����j= "&feedtimes&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"Refresh����= "&Refresh1&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"�߬B��m= "&locations1&","&locations2&","&locations3&","&locations4&vbCrLf
        UserCount=UserCount&"�߬B����= "&stelllocationX&vbCrLf
        UserCount=UserCount&"������m= "&feedXME&","&feedYME&","&feedXFD&","&feedYFD&vbCrLf
        UserCount=UserCount&vbCrLf
        UserCount=UserCount&"*****************************************************************************"&vbCrLf
        UserCount=UserCount&"*****************************************************************************"&vbCrLf
        Set fso = CreateObject("Scripting.FileSystemObject") 
        Set UserData = fso.CreateTextFile(sPath&"\plugin\KFish\"&GetCDKEY&".save",True)
        UserData.WriteLine(UserCount)
        UserData.Close
        Call Plugin.Window.Active(B)
        Delay 100
        If Initialnum>10 or Totalnum>10 or FeedTotalnum>2 Then '
           End If
        If Initialnum>0 or Totalnum>0 or FeedTotalnum>0 Then 
            MsgBox "�o�@�밽���F["&Initialnum&" �H]"&vbCrLf&"����쵲���`�@�����F["&Totalnum&" �H]"&vbCrLf&"�w�g�����ۤv�F["&FeedTotalnum&" ��]",0,"�έp�H��"
        End If
    End If
End Sub

//\\
//\\
Sub mv(x,y) '�ƹ�����
    If Positioning=1 Then
        MoveTo x+dx,y+dy
    Else  
        Call Plugin.Bkgnd.LeftClick(A, x, y)
    End If 
End Sub

Sub lc() '�ƹ������I��
    If Positioning=1 Then
        LeftClick 1
    Else 
    End If 
End Sub

//\\
//\\

//\\
//\\
//\\
