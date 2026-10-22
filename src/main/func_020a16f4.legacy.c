typedef unsigned char u8;
typedef unsigned short u16;
extern char *data_021a98fc;
extern void func_02094504(int, void *, int);
extern void func_020945f4(void *, int, int);
extern void func_020a0978(int, int);
extern int func_020a0a4c(void);
extern void func_020a112c(int);
extern int func_020a1bf8(int, int, int);
extern int func_020a323c(int, int, int);
extern void func_020a33a8(void *, void *, int, int);
extern unsigned char func_020a3654(void);
extern unsigned int func_020a36b4(void);
extern int func_020a36c8(void);
extern void func_020a5d08(int);
#define H(p,o) (*(u16 *)((p)+(o)))
#define W(p,o) (*(int *)((p)+(o)))
void func_020a16f4(int event, u16 *arg) {
 switch(event) {
 case 17: break;
 case 21: func_020a1bf8(0,1,(int)arg); break;
 case 0:
  if(arg[8] && arg[8]<16) func_020a1bf8(arg[8],2,(int)arg);
  break;
 case 1:
  if(arg[8] && arg[8]<16) {
   H(data_021a98fc+2*(arg[8]-1),0x148a)=0;
   func_020945f4(data_021a98fc+0x14a8+4*(arg[8]-1),0,4);
   func_020945f4(data_021a98fc+0x1340+22*(arg[8]-1),0,22);
   func_020a5d08(arg[8]);
   H(data_021a98fc+2*(arg[8]-1),0x1754)=0;
   {
    int n=arg[8];
    int idx=n-1;
    int group=*(signed char *)(data_021a98fc+0x1526+idx);
    if(group!=-1) {
     int off=(u8)group*0x5d4;
     int mask=~(1<<n);
     H(data_021a98fc+off,0x1d4e)&=mask;
     H(data_021a98fc+off,0x1d50)|=1<<n;
     *(signed char *)(data_021a98fc+0x1526+idx)=-1;
     H(data_021a98fc+off,0x1d4c)&=mask;
    }
   }
   if(H(data_021a98fc,0x1536)&(1<<arg[8])) {
    --*(u8 *)(data_021a98fc+0x1535);
    H(data_021a98fc,0x1536)&=~(1<<arg[8]);
   }
   if(W(data_021a98fc+4*(arg[8]-1),0x14e8)==8) func_020a1bf8(arg[8],9,0);
   func_020a1bf8(arg[8],3,(int)arg);
   W(data_021a98fc+4*(arg[8]-1),0x14e8)=0;
  }
  break;
 case 3: func_020a112c((int)arg); break;
 case 25: func_020a0a4c(); break;
 case 28: {
  u8 i; int a,b;
  for(i=0;i<16;i++) {
   int off=i*0x5d4;
   if(*(u8 *)(data_021a98fc+off+0x1d52) && H(data_021a98fc+off,0x1d50)) {
    func_020a33a8(data_021a98fc+0x186c+off,data_021a98fc+0x1340,H(data_021a98fc+off,0x1d4e),H(data_021a98fc+off,0x1d50));
    H(data_021a98fc+off,0x1d50)=0;
   }
  }
  a=func_020a36c8(); b=func_020a36b4();
  func_020a323c(a,b,func_020a3654());
  break;
 }
 case 255:
  switch(arg[1]) {
   case 1: case 4: case 5: case 6: case 8: case 9: func_020a0978(0,9); break;
   case 0: case 2: case 3: case 7: case 10: case 11: case 12: case 13: case 14: case 15:
   default: func_020a0978(0,8); break;
  }
  break;
 case 256:
  switch(arg[0]) {
   case 0: case 7: case 8: case 13: case 14: case 15: case 17: case 18: case 21: case 25: case 29: func_020a0978(0,9); break;
   case 1: case 2: case 3: case 4: case 5: case 6: case 9: case 10: case 11: case 12: case 16: case 19: case 20: case 22: case 23: case 24: case 26: case 27: case 28:
   default: func_020a0978(0,8); break;
  }
  break;
 }
 if(event==17) {
  void (*callback)(int,int,int)=*(void (**)(int,int,int))(data_021a98fc+0x14e4);
  func_02094504(0,data_021a98fc,0x7d00);
  data_021a98fc=0;
  if(callback) callback(0,12,0);
 }
}


