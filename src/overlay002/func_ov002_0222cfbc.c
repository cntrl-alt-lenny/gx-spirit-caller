typedef unsigned short u16;
typedef struct { u16 w0; u16 bit0:1; u16 pad1:13; u16 bit14:1; u16 pad15:1; } S021ff3bc;
struct Node0223def4 { char pad[8]; u16 arr8[5]; u16 f18; };
struct Arg { u16 id; u16 side:1; u16 rest:15; u16 w4; u16 low:8; u16 count:8; };
struct State { char pad[0x5a8]; int mode; int index; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int func_ov002_021b99b4(int player,int id);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021c33e4(int a,int b,int c);
/* Original caller omits unused parameter. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_021ff3bc(S021ff3bc *p,int unused1);
extern int func_ov002_0223def4(struct Node0223def4 *self,int idx);
extern int func_ov002_0227adb8(int a,int b,int c,int d);
int func_ov002_0222cfbc(struct Arg *self,int unused1) {
 int i, count, slot;
 switch(data_ov002_022ce288.mode) {
 case 0x80:
  if(func_ov002_021ff3bc((S021ff3bc *)self,unused1)==0) return 0;
  if(self->id==0x1951) {
   count=0;
   for(i=0;i<self->count;i++) {
    slot=func_ov002_021b99b4(self->side,func_ov002_0223def4((struct Node0223def4 *)self,i));
    if(slot>=0 && func_ov002_021c33e4(self->side,self->side,slot)!=0) count++;
   }
   if(func_ov002_021bc618(self->side)<count) return 0;
  }
  func_ov002_021e2b3c();
  data_ov002_022ce288.index=0;
  return 0x7f;
 case 0x7f:
  if(data_ov002_022ce288.index<self->count && func_ov002_021bc618(self->side)!=0) {
   slot=func_ov002_021b99b4(self->side,func_ov002_0223def4((struct Node0223def4 *)self,data_ov002_022ce288.index));
   if(slot>=0 && func_ov002_021c33e4(self->side,self->side,slot)!=0) {
    func_ov002_0227adb8(self->side,(int)(data_ov002_022cf16c+(self->side&1)*0x868+0x418+slot*4),1,self->id<<16);
   }
   data_ov002_022ce288.index++;
   return 0x7f;
  }
  return 0x7e;
 case 0x7e:
  func_ov002_021e2c5c((int)self);
  return 0;
 default: return 0;
 }
}

