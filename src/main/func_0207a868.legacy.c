typedef struct { unsigned short pad0,state,pad4,pad6,kind,mask,padc,count; char *items[16]; unsigned short ids[16]; } Event;
typedef struct { int f0; unsigned short f4,f6,f8; unsigned char bytes[6]; unsigned short mode,len; unsigned char data[32]; unsigned short extra; } Msg;
extern void *data_021a088c;
extern int func_02079e4c(unsigned int x);
extern int OsCountZeroBits(unsigned int x);
extern void func_0207a7d4(void *self);
extern void func_0207af28(void);
extern void func_0207b038(int a0);
extern void func_0207b0e0(unsigned short a,unsigned short b,int c,int d,int e);
extern int func_0207b13c(int a,int b,int c,int d);
extern unsigned short func_0207b18c(int x);
extern void func_0207c698(char *a,int b);
extern void func_020928cc(void *p,unsigned int size);
extern int func_0209eb00(int a0);
extern int func_0209eb48(int a0,Msg *msg);
extern long long func_020b3a7c(unsigned int a,unsigned int b);
#define G(off) (*(int *)((char *)data_021a088c + off))
#define H(off) (*(unsigned short *)((char *)data_021a088c + off))
void func_0207a868(Event *self) {
 int result=20;
 int i;
 unsigned int n;
 int count;
 switch(self->state) {
 case 0:
  if(G(0x2260)==5) { func_0207b038(6); func_0207b13c(0,0,0,0x704); }
  switch(G(0x2260)) {
  case 6:
   H(0x2280)=7;
   if(self->kind==5) {
    func_020928cc((void *)G(0x2288),H(0x228c));
    for(i=0;i<self->count;i++) {
     func_0207c698(self->items[i],self->ids[i]);
     func_0207b0e0(7,0,(int)self->items[i],(int)self,0x71a);
    }
   }
   if((G(0x2264)&0xc00000)==0xc00000 && (count=func_02079e4c(G(0x2264)&0x3ffe))!=0) {

    n=G(0x2284);
    if((int)(func_020b3a7c(n,count)>>32)==0) func_0207b0e0(8,0,n,0,0x728);
   }
   H(0x228e)=(1<<func_0207b18c((unsigned short)(32-OsCountZeroBits(self->mask))))>>1;
   func_020928cc((void *)G(0x2288),H(0x228c));
   G(0x2284)++;
   result=func_0209eb48((int)func_0207a868,(Msg *)((char *)data_021a088c+0x2288));
   break;
  case 7: result=func_0209eb00((int)func_0207a7d4); break;
  case 13: func_0207af28(); return;
  }
  switch(result) {
  case 2: return;
  case 8: func_0207b038(12); func_0207b13c(1,0,0,0x753); return;
  case 3: default: func_0207b038(11); func_0207b13c(7,0,0,0x75c); return;
  }
 case 1: func_0207af28(); return;
 case 2: case 3: case 4: default:
  func_0207b038(11); func_0207b13c(7,0,0,0x76d); return;
 }
}

