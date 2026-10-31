typedef unsigned short u16;
struct Node0223def4 {
 u16 kind;
 u16 owner:1; u16 rest2:15;
 u16 pad4;
 u16 low6:8; u16 count:8;
 u16 arr8[5]; u16 f18;
};
struct State { char pad[0x5a8]; int state; int index; };
extern struct State data_ov002_022ce288;
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021b9b64(int unused0);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021c33e4(int a, int b, int c);
/* Original supplies only r0 to this four-argument thunk. */
extern int func_ov002_021ca2b8();
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_0221af90(struct Node0223def4 *self) {
 int n;

 switch (self->kind) {
 case 0x138a: n=3; break;
 case 0x156a: n=2; break;
 case 0x18a4: n=3; break;
 }
 switch (data_ov002_022ce288.state) {
 case 0x80:
  if (func_ov002_021bc618(self->owner)<n) return 0;
  if (func_ov002_021ca2b8(self->owner)==0) return 0;
  for(n=0;n<self->count;n++) {
   int slot=func_ov002_0223def4(self,n);
   int index=func_ov002_021b99b4(self->owner,slot);
   if(index<0) return 0;
   if(func_ov002_021c33e4(self->owner,self->owner,index)==0) return 0;
  }
  data_ov002_022ce288.index=0;
  func_ov002_021e2b3c((int)&data_ov002_022ce288);
  return 0x7f;
 case 0x7f:
  { int slot=func_ov002_0223def4(self,data_ov002_022ce288.index); int card=func_ov002_021b9b64(slot); func_ov002_0227adb8(self->owner,card,1,self->kind<<16); }
  data_ov002_022ce288.index++;
  return data_ov002_022ce288.index<n ? 0x7f:0x7e;
 case 0x7e:
  func_ov002_021e2c5c((int)&data_ov002_022ce288);
  return 0;
 }
 return 0;
}


