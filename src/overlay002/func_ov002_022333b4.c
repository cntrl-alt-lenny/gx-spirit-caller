typedef unsigned short u16;
struct Node;
struct node { u16 id; u16 side:1; u16 rest:15; char pad[8]; u16 result; };
struct Player { char pad[0x120]; int cards[0x1d2]; };
extern struct { char pad[0x5a8]; int mode; } data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern struct Player data_ov002_022cf16c[];
extern struct { char pad[0xd78]; int index; } data_ov002_022d016c;
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
/* This caller supplies only the two arguments used by the thunk. */
extern int func_ov002_021c84e0();
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
extern void func_ov002_02290500(int, int, int (*)(int,int,int));
extern int func_ov002_022107b4(int a,int b,int c);
int func_ov002_022333b4(struct node *self) {
 int v, lo, hi;
 switch (data_ov002_022ce288.mode) {
 case 0x80:
  if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
   v=func_ov002_0223de94(self,0);
   lo=v & 0xff;
   hi=((u16)v >> 8) & 0xff;
   if (func_ov002_0225764c((int)self,lo,hi)) {
    self->result=func_ov002_021c84e0(lo,hi);
    return 0x7f;
   }
  }
  return 0;
 case 0x7f:
  if(data_ov002_022cd744[self->side]==1) {
   func_ov002_02290500(self->side,self->id,func_ov002_022107b4);
  } else {
   func_ov002_021ae400(self->side,0x11e);
   func_ov002_022592ec((int)func_ov002_022107b4);
  }
  return 0x7e;
 case 0x7e:
  if (!func_ov002_022593f4()) return 0x7f;
  func_ov002_0227adb8(self->side,(int)&data_ov002_022cf16c[self->side & 1].cards[data_ov002_022d016c.index],1,self->id << 16);
  return 0;
 }
 return 0;
}
