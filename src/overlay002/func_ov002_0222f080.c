typedef unsigned int u32;
typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; u16 f4, f6, index, count; };
struct State { char pad[0x5a8]; int phase, total; };
struct Result { char pad[0xd44]; int value; };
extern struct State data_ov002_022ce288;
extern struct Result data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae484(int x);
extern void func_ov002_021af9d0(int,int,int,int);
extern u32 *func_ov002_021b004c(int id);
extern u32 func_ov002_021b4618(u32 x);
extern int func_ov002_021bc618(int arg0);
/* Original caller supplies only r0 to this four-parameter thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021de408(int a,int b);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
extern int func_ov002_02257704(void *self);
extern int func_ov002_0227adb8(int a,int b,int c,int d);
int func_ov002_0222f080(struct Self *self) {
 int n;
 switch(data_ov002_022ce288.phase) {
 case 0x80:
  n=func_ov002_02257704(self);
  n=func_ov002_021b4618(n & func_ov002_021de408((int)self,n));
  if(n==0) return 0;
  if(func_ov002_021ca2b8(self->side)==0) return 0;
  self->count=n;
  return 0x7f;
 case 0x7f:
  n=func_ov002_0225368c(self->side,self->id,0);
  if(n>=func_ov002_021bc618(self->side)) n=func_ov002_021bc618(self->side);
  if(n!=0) {
   int count=self->count;
   if(count>=n) count=n;
   self->count=count;
   if(data_ov002_022cd744[self->side]==1) data_ov002_022d016c.value=1;
   else func_ov002_021ae484(0x2f);
   return 0x7e;
  }
  func_ov002_021ae400(self->side,0x122);
  return 0;
 case 0x7e:
  if(data_ov002_022d016c.value==0) return 0;
  func_ov002_021ae400(self->side,0x11d);
  return 0x7d;
 case 0x7d:
  func_ov002_021af9d0(self->side,(self->count>=0x20?0x20:self->count)+0x27,self->id,0);
  return 0x7c;
 case 0x7c:
  func_ov002_021e2b3c((int)self);
  data_ov002_022ce288.total=data_ov002_022d016c.value;
  self->index=0;
 case 0x7b:
  if(self->index<data_ov002_022ce288.total) {
   u32 *p=func_ov002_021b004c(self->index+1);
   func_ov002_0227adb8(self->side,(int)p,1,self->id<<16);
   self->index++;
   return 0x7b;
  }
  func_ov002_021e2c5c(data_ov002_022ce288.total);
  return 0;
 }
 return 0;
}


