extern unsigned char *data_021a98f8, *data_021a98fc;
extern unsigned int data_021a98f4;
/* The IRQ primitive returns the previous CPSR IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_0209448c(int, int, int);
extern void func_020945f4(void *, int, int);
extern int func_0209640c(int, int);
extern void func_020a1e3c(int);
extern void func_020a5d74(int);
extern int func_020a5d54(int);
extern void func_020a3308(void);
extern int func_020a3d34(void);
extern void func_020a16f4(int, void *);
extern void func_020a4b6c(int, void *);
int func_020a3b20(int arg) {
 int saved, old, i, result;
 saved = OS_DisableIrq();
 *(unsigned short *)(data_021a98f8+0x32) = arg;
 data_021a98f4 = ((unsigned int)data_021a98fc+0x7d1f)&~0x1f;
 old = *(int *)(data_021a98fc+0x14e4);
 func_0209448c(0, (int)(data_021a98fc+0x1340), 0x69c0);
 func_020a1e3c(old);
 *(int *)(data_021a98fc+0x1318) = *(unsigned short *)(data_021a98f8+0x500)-6;
 func_020a5d74(*(unsigned short *)(data_021a98f8+0x502));
 func_020a5d54((int)(data_021a98fc+0x1538));
 for(i=0;i<15;i++) {
  ((int *)(data_021a98fc+0x14e8))[i]=0;
  *(signed char *)(data_021a98fc+0x1526+i)=-1;
 }
 data_021a98fc[0x1524]=0;
 func_0209448c(0,(int)(data_021a98fc+0x1788),0x5d40);
 func_020945f4(data_021a98fc+0x1754,0,30);
 *(unsigned short *)(data_021a98f8+0x524)=1;
 *(void (**)(int,void *))(data_021a98f8+0x51c)=func_020a16f4;
 *(void (**)(int,void *))(data_021a98f8+0x508)=func_020a4b6c;
 *(unsigned short *)(data_021a98f8+0x34)=*(unsigned short *)(data_021a98f8+0x500);
 *(unsigned short *)(data_021a98f8+0x518)=(*(unsigned short *)(data_021a98f8+0x34)+0x23)&~0x1f;
 *(unsigned short *)(data_021a98f8+0x36)=*(unsigned short *)(data_021a98f8+0x502);
 *(unsigned short *)(data_021a98f8+0x51a)=(((*(unsigned short *)(data_021a98f8+0x36)+14)*15+0x29)&~0x1f)*2;
 func_020a3308();
 result=func_020a3d34();
 OS_RestoreIrq(saved);
 *(int *)(data_021a98fc+0x74c8)=func_0209640c(15,1);
 return result;
}

