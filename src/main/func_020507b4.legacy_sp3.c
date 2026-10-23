typedef unsigned long long u64;
extern void *func_020498f0(void);
extern int func_02045280(void);
extern int func_020469b4(void);
extern void func_02067608(char *);
extern void func_020627a8(int);
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64,u64);
extern void func_02050054(int,int);
extern int func_0204d284(int,int);
/* The assembly consumes the dispatcher's r0 result, although its C definition returns void. */
extern int func_0204d438(int);
extern int func_0204ce90(void *);
extern int func_0204f0a8(int);
extern int func_0204aaf4(int);
extern int func_0204cb54(int);
extern int func_0204cc20(int);
extern void func_02050118(void);
extern int func_0204ead0(unsigned char,void *,int,int,const int *,int);
extern void func_0204bf00(void);
extern void func_02049990(int,int,void *,void *);
extern int func_02068d0c(char *);
extern void func_02051168(void *);
extern void func_0206553c(void);
extern int func_0204be40(void);
extern int func_0204b8d0(void);
extern int func_0204b410(void);
extern void func_0204abfc(void);
extern int func_0204f820(void);
#define B(p,o) (*(unsigned char *)((char *)(p)+(o)))
#define H(p,o) (*(unsigned short *)((char *)(p)+(o)))
#define W(p,o) (*(int *)((char *)(p)+(o)))
#define U(p,o) (*(unsigned int *)((char *)(p)+(o)))
#define P(p,o) (*(void **)((char *)(p)+(o)))
#define Q(p,o) (*(u64 *)((char *)(p)+(o)))
#define C() func_020498f0()
void func_020507b4(int active) {
 u64 now;
 unsigned int delay;
 void *a,*b,*c,*d,*e;
 int result;
 if (!C()) return;
 if (func_02045280()) return;
 if (active == 0) {
  if (P(C(),0x10)) func_02067608(P(C(),0x10));
  if (!P(C(),4)) return;
  func_020627a8(*(int *)P(C(),4));
  return;
 }
 if (W(C(),0x1a0)==0) return;
 switch (W(C(),0x1a0)) {
 case 4:
  if (W(C(),0x1c8)) {
   now=func_020930b0();
   a=C(); b=C();
   if (func_020b3808((now-Q(a,0x1cc))<<6,0x82ea)>U(b,0x1c8)) {
    W(C(),0x1c8)=0;
    if (B(C(),0x15)==3) {
     B(C(),0x1aa)++;
     if (B(C(),0x1aa)>5) { func_02050054(6,0xfffec5d2); return; }
     if (func_0204d438(func_0204d284(W(C(),0xf4),0))) return;
    } else {
     if (func_0204ce90(0)==0) return;
    }
   }
  }
  if (W(C(),0x1bc)) {
   delay=B(C(),0xd)*3000+3000;
   now=func_020930b0();
   if (func_020b3808((now-Q(C(),0x1c0))<<6,0x82ea)>=delay) {
    if (func_0204d438(func_0204d284(W(C(),0xf4),0))) return;
   }
  }
  break;
 case 2: case 3: case 5:
  if (W(C(),0xe8)>0) {
   if (W(C(),0x1a0)==3) delay=B(C(),0xd)*3000+3000;
   else { if (W(C(),0xe8)==1) delay=1000; else delay=3000; }
   now=func_020930b0();
   if (func_020b3808((now-Q(C(),0xec))<<6,0x82ea)>delay) {
    if (func_0204aaf4(func_0204f0a8(W(C(),0x204)))) return;
    W(C(),0xe8)=0;
   }
  }
  break;
 case 7:
  if (Q(C(),0x18c)!=0) {
   now=func_020930b0();
   if (func_020b3808((now-Q(C(),0x18c))<<6,0x82ea)>25000) {
    Q(C(),0x18c)=0;
    if (func_0204cb54(W(C(),0xf4))==0) return;
   }
  } else if (B(C(),0x3cc)==6) {
   now=func_020930b0();
   if (func_020b3808((now-Q(C(),0x45c))<<6,0x82ea)>6000) {
    B(C(),0x3cd)++;
    if (B(C(),0x3cd)>5) {
     func_02050118();
     if (func_0204cb54(W(C(),0xf4))==0) return;
    } else {
     a=C(); b=C(); c=C(); d=C(); e=C();
     if (func_0204d438(func_0204ead0(6,P(a,0x454),W(b,0x3d0),H(c,0x3ce),(int *)((char *)d+0x3d4),W(e,0x458)))) return;
    }
   }
  }
  break;
 case 11:
  if (B(C(),0x3cc)==2) {
   if ((B(C(),0x15)==0 && (now=func_020930b0(),func_020b3808((now-Q(C(),0x45c))<<6,0x82ea)>6000)) ||
       (B(C(),0x15)!=0 && (now=func_020930b0(),func_020b3808((now-Q(C(),0x45c))<<6,0x82ea)>19000))) {
    func_02050118();
    a=C();
    if (func_0204cc20(W((char *)a+(B(C(),0xd)+1)*4,0xf4))==0) return;
   }
  }
  break;
 case 13:
  if (B(C(),0x3cc)==8) {
   now=func_020930b0();
   if (func_020b3808((now-Q(C(),0x45c))<<6,0x82ea)>30000) {
    B(C(),0x3cd)++;
    if (B(C(),0x3cd)!=0) {
     func_02050118();
     if (B(C(),0x15)==2) {
      a=C();
      if (func_0204cc20(W((char *)a+B(C(),0xd)*4,0xf4))==0) return;
     } else func_0204bf00();
    } else {
     a=C(); b=C(); c=C(); d=C(); e=C();
     if (func_0204d438(func_0204ead0(8,P(a,0x454),W(b,0x3d0),H(c,0x3ce),(int *)((char *)d+0x3d4),W(e,0x458)))) return;
    }
   }
  }
  break;
 case 1:
  if (func_020469b4()==5) {
   now=func_020930b0();
   if (func_020b3808((now-Q(C(),0x1f8))<<6,0x82ea)>30000) {
    if (B(C(),0x1ad)>=5) {
     if (func_0204cb54(W(C(),0xf4))==0) return;
    } else {
     a=C(); b=C(); c=C();
     if (func_0204d438(func_0204ead0(0x40,P(a,0xf4),W(b,0x24),H(c,0xa4),0,0))) return;
     B(C(),0x1ad)++;
     a=C();
     Q(a,0x1f8)=func_020930b0()-0xbfc4c6;
    }
   }
  }
  break;
 }
 if (W(C(),0x1a0)==11 || W(C(),0x1a0)==6) {
  if (Q(C(),0x184)!=0) {
   now=func_020930b0();
   if (func_020b3808((now-Q(C(),0x184))<<6,0x82ea)>10000)
    func_02049990(1,0,0,(char *)C()+0x194);
  }
 }
 if (P(C(),0xe4)) func_02068d0c(P(C(),0xe4));
 func_02051168(P(C(),0x10));
 func_0206553c();
 if (P(C(),4)) func_020627a8(*(int *)P(C(),4));
 if (W(C(),0x1a0)==18) {
  now=func_020930b0();
  if (func_020b3808((now-Q(C(),0x1f0))<<6,0x82ea)>3000) {
   if (func_0204be40()) return;
  }
 }
 if (!func_0204b8d0()) return;
 if (!func_0204b410()) return;
 func_0204abfc();
 if (!B(C(),0x1ae)) return;
 if (W(C(),0x1a0)!=10) return;
 a=C(); B(a,0x16)=B(C(),0xd);
 func_0204f820();
 B(C(),0x1ae)=0;
 if (!P(C(),0x47c)) return;
 a=C();
 ((void (*)(void *))P(a,0x47c))(P(C(),0x480));
}

