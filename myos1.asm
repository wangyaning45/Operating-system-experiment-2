;����Դ���루myos1.asm��
org  07c00h		; BIOS���������������ص�0:7C00h��������ʼִ��
OffSetOfUserPrg1 equ 0A100h
Start:
	mov	ax, cs	       ; �������μĴ���ֵ��CS��ͬ
	mov	ds, ax	       ; ���ݶ�
	mov	bp, Message		 ; BP=��ǰ����ƫ�Ƶ�ַ
	mov	ax, ds		 ; ES:BP = ����ַ
	mov	es, ax		 ; ��ES=DS
	mov	cx, MessageLength  ; CX = ������=9��
	mov	ax, 1301h		 ; AH = 13h�����ܺţ���AL = 01h��������ڴ�β��
	mov	bx, 0007h		 ; ҳ��Ϊ0(BH = 0) �ڵװ���(BL = 07h)
              mov dh, 0		       ; �к�=0
	mov	dl, 0			 ; �к�=0
	int	10h			 ; BIOS��10h���ܣ���ʾһ���ַ�
              mov ah,0
              int 16h
              mov dl,al           
             mov ah ,0eh
             mov al,dl
             mov bl,0
            int 10h
            sub dl,48
             
              
LoadnEx:
     ;�����̻�Ӳ���ϵ����������������ڴ��ES:BX����
            
      mov ax,cs                ;�ε�ַ ; ������ݵ��ڴ����ַ
      mov es,ax                ;���öε�ַ������ֱ��mov es,�ε�ַ��
      mov bx, OffSetOfUserPrg1  ;ƫ�Ƶ�ַ; ������ݵ��ڴ�ƫ�Ƶ�ַ
      mov ah,2                 ; ���ܺ�
      mov al,3       ;������
      mov cl, dl           ;��ʼ������ ; ��ʼ���Ϊ1
      mov dl,0                 ;�������� ; ����Ϊ0��Ӳ�̺�U��Ϊ80H
      mov dh,0                 ;��ͷ�� ; ��ʼ���Ϊ0
      mov ch,0                 ;����� ; ��ʼ���Ϊ0
      
      int 13H ;                ���ö�����BIOS��13h����
      ; �û�����a.com�Ѽ��ص�ָ���ڴ�������
      jmp OffSetOfUserPrg1
      

AfterRun:
      jmp $                      ;����ѭ��
Message:
      db 'Hello, MyOs is loading user program A.COM��'
MessageLength  equ ($-Message)
      times 510-($-$$) db 0
      db 0x55,0xaa
