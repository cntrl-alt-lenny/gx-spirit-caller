extern void *func_020498f0(void);
extern void func_020498dc(int);
extern void func_0204a4ec(int);
extern int func_02068cb8(void *);
extern void *func_02068cc8(void *, int);
extern void func_02068d24(void *, void *);
extern int func_0204b1a4(void *);
extern int func_020689dc(void *);
extern unsigned short func_020689b8(unsigned short *);
extern int func_0204a2ec(int);
extern void func_0204a174(void);
extern int func_0204d284(int,int);
extern int func_0204d438(int);
extern int func_0204ca70(void);
extern void *func_0204ce3c(int);
extern int func_0204cf7c(int,int,int);
extern int func_0204ed50(int,unsigned int,void *);
extern int func_0204a9b0(int);
extern int func_0204aaf4(int);
extern int func_0204f0a8(int);
extern int func_02068a20(void *,void *,int);
extern long long func_020930b0(void);
extern char data_020ff980[];
#define W(p,o) (*(int *)((char *)(p)+(o)))
#define H(p,o) (*(unsigned short *)((char *)(p)+(o)))
#define B(p,o) (*(unsigned char *)((char *)(p)+(o)))
#define Q(p,o) (*(long long *)((char *)(p)+(o)))
void func_0204a4f0(void *self, int event, int arg) {
 int i, v;
 void *item, *p;
 switch (event) {
 case 0: func_0204a4ec(arg); return;
 case 4:
 {
  for (i=0; i<func_02068cb8(self); i++) {
   item=func_02068cc8(self,i);
   if (!func_0204b1a4(item)) { func_02068d24(self,item); i--; }
  }
  switch (W(func_020498f0(),0x1a0)) {
  case 2:
   for (i=0; i<func_02068cb8(self); i++) {
    item=func_02068cc8(self,i);
    if (W(func_020498f0(),0x1c) && W(func_020498f0(),0x1c)==func_020689dc(item) && H(func_020498f0(),0x1a) && H(func_020498f0(),0x1a)==func_020689b8(item)) break;
   }
   if (i<func_02068cb8(self)) {
    func_020498dc(3); W(func_020498f0(),0x204)=0;
    if (func_0204aaf4(func_0204f0a8(W(func_020498f0(),0x204)))) return; return;
   }
   W(func_020498f0(),0xe8)=2; p=func_020498f0(); Q(p,0xec)=func_020930b0(); return;
  case 3:
   func_0204a2ec(1); func_0204a174();
   if (func_02068cb8(self)) {
    if (func_0204d438(func_0204d284(0,0))) return;
    func_020498dc(4); W(func_020498f0(),0xe8)=0; return;
   }
   W(func_020498f0(),0xe8)=2; p=func_020498f0(); Q(p,0xec)=func_020930b0(); return;
  case 5:
   if (func_02068cb8(self)) {
    do {
     item=func_02068cc8(self,0);
     v=func_020689dc(item);
     if (v==W(func_020498f0(),0x1b8)) {
      v=func_020689b8(item);
      if (v==H(func_020498f0(),0x1b4)) break;
     }
     func_02068d24(self,item);
    } while (func_02068cb8(self));
   }
   if (func_02068cb8(self)) {
    v=func_02068a20(func_02068cc8(self,0),data_020ff980,0);
    if (B(func_020498f0(),0x15)==1 && v==W(func_020498f0(),0xf4)) {
     if (func_0204a2ec(0)) {
      if (B(func_020498f0(),0xd) && func_0204d438(func_0204ca70())) return;
     } else {
      if (func_0204d438((int)func_0204ce3c(W(func_020498f0(),0xf4)))) return;
      func_020498dc(4);
      if (func_0204d438(func_0204cf7c(0,0,W(func_020498f0(),0xf4)))) return; return;
     }
    }
    func_020498dc(6); if (func_0204a9b0(func_0204ed50(0,0,func_02068cc8(self,0)))) return; return;
   }
   W(func_020498f0(),0xe8)=2; p=func_020498f0(); Q(p,0xec)=func_020930b0(); return;
  }
 }
 case 5: return;
 }
}


