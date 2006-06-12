FasdUAS 1.101.10   ��   ��    k             l      �� ��   93 paste.applescript
 * 
 * Created by Jacob Rus on 2006-05-26.
 * 
 * This script sets up a list of options, allows TextMate to paste the
 * selected text to a pastebin, sets up a list of possible actions to
 * perform with the link, depending on what applications are available,
 * and carries those actions out.  Some options include:
 * 
 *   - Copy the URL to the clipboard
 *   - Send the URL to Quicksilver
 *   - Open the URL in the default browser
 *   - Paste the URL to an open IRC channel in Colloquy
 *   - Paste the URL to an open chat in Adium
 *   
 * Note that for these last two, if multiple channels or chats are open with
 * the same name, this Applescript will not attempt to distinguish between
 * them, and will paste to the first available channel or chat which matches
 * the user's choice.
 * 
        	  l     ������  ��   	  
  
 l     ������  ��        l     �� ��    !  ==========================         l     �� ��    !  = SET UP LIST OF OPTIONS =         l     �� ��    !  ==========================         l     ������  ��        l     �� ��      initialize the list         l     ��  r         J     ����    o      ���� 0 the_list  ��         l     ������  ��      ! " ! l     �� #��   # N H get a list of open applications, so that we can decide which actions to    "  $ % $ l     �� &��   &   present as options    %  ' ( ' l    )�� ) O     * + * r   	  , - , n   	  . / . 1    ��
�� 
pnam / 2  	 ��
�� 
pcap - o      ���� 0 openapps openApps + m     0 0�null     ߀��  �System Events.app�|?��^���ِ���P��܀�^�����    �[b�> APPLsesevs   alis    �  Ladybird                   ���BH+    �System Events.app                                                k��d�        ����  	                CoreServices    ���"      �c��      �  �  �  6Ladybird:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    L a d y b i r d  -System/Library/CoreServices/System Events.app   / ��  ��   (  1 2 1 l     ������  ��   2  3 4 3 l     �� 5��   5 : 4 get open IRC channels from Colloquy, if it is open;    4  6 7 6 l     �� 8��   8 !  preface the actions with -    7  9 : 9 l   ^ ;�� ; Z    ^ < =���� < E     > ? > o    ���� 0 openapps openApps ? m     @ @  Colloquy    = k    Z A A  B C B O   * D E D r    ) F G F l 	  ' H�� H l   ' I�� I b    ' J K J n    ! L M L 1    !��
�� 
pnam M 2   ��
�� 
dchM K n   ! & N O N 1   $ &��
�� 
pnam O 2  ! $��
�� 
crmM��  ��   G o      ���� 0 colloquy_channels   E m     P P�null     ߀��  *Colloquy.app$�"�|?��^�������п�� �^����p    �[b�( APPLcocoRC   alis    H  Ladybird                   ���BH+    *Colloquy.app                                                    R���{\        ����  	                Applications    ���"      ��_<      *  "Ladybird:Applications:Colloquy.app    C o l l o q u y . a p p    L a d y b i r d  Applications/Colloquy.app   / ��   C  Q R Q Z   + ; S T���� S >  + / U V U o   + ,���� 0 colloquy_channels   V J   , .����   T r   2 7 W X W b   2 5 Y Z Y o   2 3���� 0 the_list   Z m   3 4 [ [  Paste to Colloquy IRC:    X o      ���� 0 the_list  ��  ��   R  \�� \ X   < Z ]�� ^ ] r   L U _ ` _ b   L S a b a o   L M���� 0 the_list   b J   M R c c  d�� d b   M P e f e m   M N g g 	 	-     f o   N O���� 0 each_channel  ��   ` o      ���� 0 the_list  �� 0 each_channel   ^ o   ? @���� 0 colloquy_channels  ��  ��  ��  ��   :  h i h l     ������  ��   i  j k j l     �� l��   l 0 * get open chats from Adium, if it is open;    k  m n m l     �� o��   o !  preface the actions with >    n  p q p l  _ � r�� r Z   _ � s t���� s E   _ b u v u o   _ `���� 0 openapps openApps v m   ` a w w  Adium    t k   e � x x  y z y O  e y { | { r   k x } ~ } l  k t ��  n   k t � � � 1   p t��
�� 
AchN � 2  k p��
�� 
Acht��   ~ o      ���� 0 adium_chats   | m   e h � ��null     ߀��  *	Adium.app���$�"�|?��^�������п�� �^����p    �[b�6 APPLAdAdIM   alis    <  Ladybird                   ���BH+    *	Adium.app                                                       F���`��        ����  	                Applications    ���"      �`m�      *  Ladybird:Applications:Adium.app    	 A d i u m . a p p    L a d y b i r d  Applications/Adium.app  / ��   z  � � � Z   z � � ����� � >  z � � � � o   z }���� 0 adium_chats   � J   } ����   � r   � � � � � b   � � � � � o   � ����� 0 the_list   � m   � � � �  Paste to Adium chat:    � o      ���� 0 the_list  ��  ��   �  ��� � X   � � ��� � � r   � � � � � b   � � � � � o   � ����� 0 the_list   � J   � � � �  ��� � b   � � � � � m   � � � � 	 	>     � o   � ����� 0 	each_chat  ��   � o      ���� 0 the_list  �� 0 	each_chat   � o   � ����� 0 adium_chats  ��  ��  ��  ��   q  � � � l     ������  ��   �  � � � l     �� ���   �   add singular actions    �  � � � l  � � ��� � r   � � � � � b   � � � � � o   � ����� 0 the_list   � m   � � � �  Open in browser    � o      ���� 0 the_list  ��   �  � � � l  � � ��� � r   � � � � � b   � � � � � o   � ����� 0 the_list   � m   � � � �  Copy link to clipboard    � o      ���� 0 the_list  ��   �  � � � l  � � ��� � Z   � � � ����� � E   � � � � � o   � ����� 0 openapps openApps � m   � � � �  Quicksilver    � r   � � � � � b   � � � � � o   � ����� 0 the_list   � m   � � � �  Send to Quicksilver    � o      ���� 0 the_list  ��  ��  ��   �  � � � l     ������  ��   �  � � � l  � � ��� � r   � � � � � I   � ���������  0 defaultchoices defaultChoices��  ��   � o      ���� 0 default_items  ��   �  � � � l  � ��� � O   � � � � r   � � � � I  ��� � �
�� .gtqpchltns    @   @ ns   � l 
 � � ��� � o   � ����� 0 the_list  ��   � �� � �
�� 
okbt � l 	 � � ��� � m   � � � �  Paste   ��   � �� � �
�� 
prmp � l 	 � � ��� � m   � � � �  Pick actions for paste:   ��   � �� � �
�� 
appr � l 	 � � ��� � m   � � � � ! Paste Selection to Pastebin   ��   � �� � �
�� 
inSL � o   ���� 0 default_items   � �� ���
�� 
mlsl � m  ��
�� boovtrue��   � o      ���� 0 the_choices   � m   � � � ��null     ߀�� �vTextMate.app�"�"�|?��^���ِ���P��܀�^�����    �[b�B APPLTxTxMt   alis    �  Ladybird                   ���BH+   �vTextMate.app                                                    RW����Q        ����  	                Deployment (ppc)    ���"      ���1     �v Q c�  k�  5Ladybird:Users:duff:Oak:Deployment (ppc):TextMate.app     T e x t M a t e . a p p    L a d y b i r d  ,Users/duff/Oak/Deployment (ppc)/TextMate.app  /    ��  ��   �  � � � l     ������  ��   �  � � � l     ������  ��   �  � � � l     �� ���   � %  ==============================    �  � � � l     �� ���   � %  = PASTE TEXT TO THE PASTEBIN =    �  � � � l     �� ���   � %  ==============================    �  � � � l     ������  ��   �  � � � l  ��� � r   � � � m   � �       � o      ���� 0 the_url  ��   �  � � � l ; ��� � Z  ; � ����� � >   � � � o  �� 0 the_choices   � m  �~
�~ boovfals � k  #7 � �  � � � I  #+�} ��|�} 0 savechoices saveChoices �  ��{ � o  $'�z�z 0 the_choices  �{  �|   �  ��y � r  ,7 �  � I ,3�x�w
�x .sysoexecTEXT���     TEXT l 	,/�v m  ,/��mkfifo /tmp/cd_tm_pipe
		"$TM_SUPPORT_PATH/bin/CocoaDialog.app/Contents/MacOS/CocoaDialog" progressbar --indeterminate \
		  --title "Paste to Pasting Server�" \
		  --text "Contacting Server �pastie.caboo.se��" < /tmp/cd_tm_pipe &
		exec 4<>/tmp/cd_tm_pipe
		echo -n . >&4
		TM_HTML=$("${TM_RUBY:-ruby}" -rjcode -Ku -r"$TM_BUNDLE_SUPPORT/lib/doctohtml.rb" -e 'print document_to_html(STDIN.read)')
		echo -n "$TM_SELECTED_TEXT"|curl http://pastie.caboo.se/pastes/create \
			-s -L -o /dev/null -w "%{url_effective}" \
			-H "Expect:" \
			-F "paste[body]=<-" \
			-F "paste[textmate_html]=&zwj;$TM_HTML"
		exec 4>&-
		wait
		rm -f /tmp/cd_tm_pipe   �v  �w    o      �u�u 0 the_url  �y  ��  ��  ��   �  l     �t�s�t  �s    l     �r�r   $  =============================    	
	 l     �q�q   $  = PERFORM REQUESTED OPTIONS =   
  l     �p�p   $  =============================     l     �o�n�o  �n    l <U�m Z  <U�l�k > <C o  <?�j�j 0 the_url   m  ?B       I  FQ�i�h�i 0 actonurl actOnURL  o  GJ�g�g 0 the_url   �f o  JM�e�e 0 the_choices  �f  �h  �l  �k  �m    l     �d�c�d  �c     l     �b�a�b  �a    !"! i     #$# I      �`%�_�` 0 actonurl actOnURL% &'& o      �^�^ 0 the_url  ' (�]( o      �\�\ 0 the_choices  �]  �_  $ X     �)�[*) k    �++ ,-, r    ./. c    010 o    �Z�Z 0 each_choice  1 m    �Y
�Y 
TEXT/ o      �X�X 0 each_choice  - 232 l   �W�V�W  �V  3 454 l   �U6�U  6 "  send the URL to Quicksilver   5 7�T7 Z    �89:�S8 l   ;�R; =   <=< o    �Q�Q 0 each_choice  = m    >>  Send to Quicksilver   �R  9 k    .?? @A@ O    ,BCB k     +DD EFE I    %�P�O�N
�P .miscactvnull��� ��� null�O  �N  F G�MG r   & +HIH o   & '�L�L 0 the_url  I 1   ' *�K
�K 
sele�M  C m    JJ�null     ߀��  *Quicksilver.app"�|?��^���Ґ���P��Հ�^�����    �[b�  APPLdadaed   alis    T  Ladybird                   ���BH+    *Quicksilver.app                                                 K	-����        ����  	                Applications    ���"      ����      *  %Ladybird:Applications:Quicksilver.app      Q u i c k s i l v e r . a p p    L a d y b i r d  Applications/Quicksilver.app  / ��  A KLK l  - -�J�I�J  �I  L M�HM l  - -�GN�G  N $  send the URL to the clipboard   �H  : OPO =  1 4QRQ o   1 2�F�F 0 each_choice  R m   2 3SS  Copy link to clipboard   P TUT k   7 >VV WXW I  7 <�EY�D
�E .JonspClpnull���     ****Y o   7 8�C�C 0 the_url  �D  X Z[Z l  = =�B�A�B  �A  [ \�@\ l  = =�?]�?  ] * $ open the URL in the default browser   �@  U ^_^ =  A D`a` o   A B�>�> 0 each_choice  a m   B Cbb  Open in browser   _ cdc k   G Nee fgf I  G L�=h�<
�= .GURLGURLnull��� ��� TEXTh o   G H�;�; 0 the_url  �<  g iji l  M M�:�9�:  �9  j k�8k l  M M�7l�7  l * $ paste the URL to the requested chat   �8  d mnm I   Q X�6o�5�6 0 
startswith  o pqp o   R S�4�4 0 each_choice  q r�3r m   S Tss 	 	>    �3  �5  n tut k   [ �vv wxw r   [ dyzy I   [ b�2{�1�2 0 striplength  { |}| o   \ ]�0�0 0 each_choice  } ~�/~ m   ] ^�.�. �/  �1  z o      �-�- 0 each_choice  x � O  e ���� l 	 i ���,� O  i ���� l 	 � ���+� I  � ��*�)�
�* .AdIMsndMnull���    cobj�)  � �(��'
�( 
TO  � l  � ���&� b   � ���� m   � ���  pasted    � o   � ��%�% 0 the_url  �&  �'  �+  � n   i ~��� 4   { ~�$�
�$ 
cobj� m   | }�#�# � l  i {��"� 6  i {��� 2  i n�!
�! 
Acht� =  q z��� 1   r v� 
�  
AchN� o   w y�� 0 each_choice  �"  �,  � m   e f �� ��� l  � ����  �  � ��� l  � ����  � 6 0 paste the URL to the requested IRC channel/chat   �  u ��� I   � ����� 0 
startswith  � ��� o   � ��� 0 each_choice  � ��� m   � ��� 	 	-    �  �  � ��� k   � ��� ��� r   � ���� I   � ����� 0 striplength  � ��� o   � ��� 0 each_choice  � ��� m   � ��� �  �  � o      �� 0 each_choice  � ��� O   � ���� k   � ��� ��� r   � ���� n   � ���� 1   � ��
� 
trgA� n   � ���� 4   � ���
� 
cobj� m   � ��� � l  � ���� 6  � ���� 2  � ��

�
 
chvC� =  � ���� 1   � ��	
�	 
pnam� o   � ��� 0 each_choice  �  � o      �� 0 the_channel  � ��� I  � ����
� .ccoRsCmXnull���     TEXT� l  � ���� b   � ���� m   � ���  pasted    � o   � ��� 0 the_url  �  � ���
� 
sCm1� o   � ��� 0 the_channel  � � ���
�  
sCm3� m   � ���
�� savoyes ��  �  � m   � � P�  �  �S  �T  �[ 0 each_choice  * o    ���� 0 the_choices  " ��� l     ������  ��  � ��� l     ������  ��  � ��� l     �����  �   load default choices   � ��� i    ��� I      ��������  0 defaultchoices defaultChoices��  ��  � k     8�� ��� Q     5���� k    (�� ��� r    ��� b    ��� l   ���� I   ����
�� .earsffdralis        afdr� m    ��
�� afdmpref� ����
�� 
from� m    ��
�� fldmfldu� �����
�� 
rtyp� m    ��
�� 
ctxt��  ��  � m    �� 7 1com.macromates.textmate.paste_to_server.as_record   � o      ���� 0 
prefs_file  � ��� r    ��� I   �����
�� .rdwropenshor       file� o    ���� 0 
prefs_file  ��  � o      ���� 0 f  � ��� r    "��� I    ����
�� .rdwrread****        ****� o    ���� 0 f  � �����
�� 
as  � m    ��
�� 
list��  � o      ���� 0 the_list  � ���� I  # (�����
�� .rdwrclosnull���     ****� o   # $���� 0 f  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � r   0 5��� J   0 3�� ���� m   0 1��  	- #textmate   ��  � o      ���� 0 the_list  � ��� l  6 6������  ��  � ���� L   6 8�� o   6 7���� 0 the_list  ��  � ��� l     ������  ��  � ��� l     ������  ��  �    l     ����     save choices     i     I      ������ 0 savechoices saveChoices �� o      ���� 0 the_list  ��  ��   k     %		 

 r      b      l    	�� I    	��
�� .earsffdralis        afdr m     ��
�� afdmpref ��
�� 
from m    ��
�� fldmfldu ����
�� 
rtyp m    ��
�� 
ctxt��  ��   m   	 
 7 1com.macromates.textmate.paste_to_server.as_record    o      ���� 0 
prefs_file    r     I   ��
�� .rdwropenshor       file o    ���� 0 
prefs_file   ����
�� 
perm m    ��
�� boovtrue��   o      ���� 0 f    I   �� !
�� .rdwrwritnull���     ****  o    ���� 0 the_list  ! ��"��
�� 
refn" o    ���� 0 f  ��   #��# I    %��$��
�� .rdwrclosnull���     ****$ o     !���� 0 f  ��  ��   %&% l     ������  ��  & '(' l     ������  ��  ( )*) l     ��+��  + L F test if 'longstring' starts with 'startstring'.  If not, return false   * ,-, i    ./. I      ��0���� 0 
startswith  0 121 o      ���� 0 
longstring  2 3��3 o      ���� 0 startstring  ��  ��  / k     844 565 Z     78����7 ?     9:9 n     ;<; 1    ��
�� 
leng< o     ���� 0 startstring  : n    =>= 1    ��
�� 
leng> o    ���� 0 
longstring  8 L   
 ?? m   
 ��
�� boovfals��  ��  6 @A@ Y    5B��CD��B Z    0EF����E >   'GHG l   "I��I n    "JKJ 4    "��L
�� 
cha L o     !���� 0 i  K o    ���� 0 startstring  ��  H l  " &M��M n   " &NON 4   # &��P
�� 
cha P o   $ %���� 0 i  O o   " #���� 0 
longstring  ��  F L   * ,QQ m   * +��
�� boovfals��  ��  �� 0 i  C m    ���� D n    RSR 1    ��
�� 
lengS o    ���� 0 startstring  ��  A T��T L   6 8UU m   6 7��
�� boovtrue��  - VWV l     ������  ��  W XYX l     ������  ��  Y Z[Z l     ��\��  \ O I strip the first 'num' characters from 'longstring', returning the result   [ ]^] i    _`_ I      ��a���� 0 striplength  a bcb o      ���� 0 
longstring  c d��d o      ���� 0 num  ��  ��  ` L     ee c     fgf l    h��h n     iji 7  ��kl
�� 
cha k l   	m��m [    	non o    ���� 0 num  o m    ���� ��  l l  
 p��p n   
 qrq 1    ��
�� 
lengr o   
 �� 0 
longstring  ��  j o     �~�~ 0 
longstring  ��  g m    �}
�} 
TEXT^ s�|s l     �{�z�{  �z  �|       �ytuvwxyz{|}~���x�w�v�u�t�s�r�q�p�o�n�y  t �m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�m 0 actonurl actOnURL�l  0 defaultchoices defaultChoices�k 0 savechoices saveChoices�j 0 
startswith  �i 0 striplength  
�h .aevtoappnull  �   � ****�g 0 the_list  �f 0 openapps openApps�e 0 colloquy_channels  �d 0 adium_chats  �c 0 default_items  �b 0 the_choices  �a 0 the_url  �`  �_  �^  �]  �\  �[  �Z  �Y  �X  �W  �V  u �U$�T�S���R�U 0 actonurl actOnURL�T �Q��Q �  �P�O�P 0 the_url  �O 0 the_choices  �S  � �N�M�L�K�N 0 the_url  �M 0 the_choices  �L 0 each_choice  �K 0 the_channel  � !�J�I�H�G>J�F�ES�Db�Cs�B�A ��@��?�>��=� P�<�;�:��9�8�7�6�5
�J 
kocl
�I 
cobj
�H .corecnte****       ****
�G 
TEXT
�F .miscactvnull��� ��� null
�E 
sele
�D .JonspClpnull���     ****
�C .GURLGURLnull��� ��� TEXT�B 0 
startswith  �A 0 striplength  
�@ 
Acht�  
�? 
AchN
�> 
TO  
�= .AdIMsndMnull���    cobj
�< 
chvC
�; 
pnam
�: 
trgA
�9 
sCm1
�8 
sCm3
�7 savoyes �6 
�5 .ccoRsCmXnull���     TEXT�R � �[��l kh ��&E�O��  � *j O�*�,FUOPY ���  �j 	OPY ���  �j OPY �*��l+  <*�ml+ E�O� (*a -a [a ,\Z�81�k/ *a a �%l UUOPY T*�a l+  G*�ml+ E�Oa  3*a -a [a ,\Z�81�k/a ,E�Oa �%a �a a a   UY h[OY�#v �4��3�2���1�4  0 defaultchoices defaultChoices�3  �2  � �0�/�.�0 0 
prefs_file  �/ 0 f  �. 0 the_list  � �-�,�+�*�)�(�'��&�%�$�#�"�!� �
�- afdmpref
�, 
from
�+ fldmfldu
�* 
rtyp
�) 
ctxt�( 
�' .earsffdralis        afdr
�& .rdwropenshor       file
�% 
as  
�$ 
list
�# .rdwrread****        ****
�" .rdwrclosnull���     ****�!  �   �1 9 *������ �%E�O�j E�O���l E�O�j W X  �kvE�O�w ������� 0 savechoices saveChoices� ��� �  �� 0 the_list  �  � ���� 0 the_list  � 0 
prefs_file  � 0 f  � ������������
� afdmpref
� 
from
� fldmfldu
� 
rtyp
� 
ctxt� 
� .earsffdralis        afdr
� 
perm
� .rdwropenshor       file
� 
refn
� .rdwrwritnull���     ****
� .rdwrclosnull���     ****� &������ �%E�O��el 	E�O��l O�j x �
/�	�����
 0 
startswith  �	 ��� �  ��� 0 
longstring  � 0 startstring  �  � ���� 0 
longstring  � 0 startstring  � 0 i  � � ��
�  
leng
�� 
cha � 9��,��, fY hO #k��,Ekh ��/��/ fY h[OY��Oey ��`���������� 0 striplength  �� ����� �  ������ 0 
longstring  �� 0 num  ��  � ������ 0 
longstring  �� 0 num  � ������
�� 
cha 
�� 
leng
�� 
TEXT�� �[�\[Z�k\Z��,2�&z �����������
�� .aevtoappnull  �   � ****� k    U��  ��  '��  9��  p��  ���  ���  ���  ���  ���  ���  ��� ����  ��  ��  � ������ 0 each_channel  �� 0 	each_chat  � /�� 0������ @ P������ [������ g w ������� � � � � � ����� ��� ��� ��� ����������� ����������� 0 the_list  
�� 
pcap
�� 
pnam�� 0 openapps openApps
�� 
dchM
�� 
crmM�� 0 colloquy_channels  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
Acht
�� 
AchN�� 0 adium_chats  ��  0 defaultchoices defaultChoices�� 0 default_items  
�� 
okbt
�� 
prmp
�� 
appr
�� 
inSL
�� 
mlsl�� 

�� .gtqpchltns    @   @ ns  �� 0 the_choices  �� 0 the_url  �� 0 savechoices saveChoices
�� .sysoexecTEXT���     TEXT�� 0 actonurl actOnURL��VjvE�O� 	*�-�,E�UO�� G� *�-�,*�-�,%E�UO�jv 
��%E�Y hO �[��l kh  ��%kv%E�[OY��Y hO�� Qa  *a -a ,E` UO_ jv �a %E�Y hO !_ [��l kh �a �%kv%E�[OY��Y hO�a %E�O�a %E�O�a  �a %E�Y hO*j+ E` Oa  )�a a a a  a !a "a #_ a $ea % &E` 'UOa (E` )O_ 'f *_ 'k+ *Oa +j ,E` )Y hO_ )a - *_ )_ 'l+ .Y h{ ����� �   [�� � � �� % 	- nickserv                  � & 	- #textmate                  | ����� �  ������������������������������ ���  l o g i n w i n d o w� ���  D o c k� ���  S y s t e m U I S e r v e r� ���  F i n d e r� ���  S S H K e y c h a i n� ���  R e m i n d e r M a t e� ���  i T u n e s H e l p e r� ���  E y e T V   H e l p e r� ���  Q u i c k s i l v e r� ���  G e e k T o o l� ���  i T u n e s� ���  D a s h b o a r d C l i e n t� ���  D a s h b o a r d C l i e n t� ���  D a s h b o a r d C l i e n t� ���  D a s h b o a r d C l i e n t� ���  D a s h b o a r d C l i e n t� ���   t e x t p a n d e r d a e m o n� ���  S y s t e m   E v e n t s� ���  M a i l� ���  C o l l o q u y� ���   N e t N e w s W i r e   L i t e� ���  O m n i W e b� ���  T e r m i n a l� ��� 
 A d i u m� ���  T e x t M a t e� ���  D V D   P l a y e r� ���  U n i v e r s a l A c c e s s� ���  S c r i p t   E d i t o r� ���  o s a s c r i p t} ����� �  ��� ���  n i c k s e r v� ���  # t e x t m a t e~ �����  �    ����� �  �� & 	- #textmate                  � ����� �  �� & 	- #textmate                  � ��� 4 h t t p : / / p a s t i e . c a b o o . s e / 8 8 4�x  �w  �v  �u  �t  �s  �r  �q  �p  �o  �n  ascr  ��ޭ