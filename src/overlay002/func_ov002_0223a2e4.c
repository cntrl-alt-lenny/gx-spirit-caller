typedef unsigned short u16;
typedef unsigned char u8;
struct Node;
struct node;
struct Self { u16 id; u16 side:1; u16 idx:5; u16 rest:10; };
struct Global { char pad[0x5a8]; int state; };
struct Other { char pad[0xb0]; u16 state; };
extern struct Global data_ov002_022ce288;
extern struct Other data_ov002_022d0e6c;
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
/* The original supplies only two arguments to this three-argument thunk. */
extern int func_ov002_0226b258();
extern int func_ov002_0220e518(void *self);
int func_ov002_0223a2e4(struct Self *self) {
 int ret;
 switch (data_ov002_022ce288.state) {
 case 0x80:
  if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
   ret = func_ov002_0223de94((struct node *)self, 0);
   if (func_ov002_0225764c((int)self, (u8)ret, (u8)((u16)ret >> 8))) return 0x7f;
  }
  return 0;
 case 0x7f:
  func_ov002_0226b258(self->side, self->idx);
  return 0x7e;
 case 0x7e:
  if (data_ov002_022d0e6c.state != 1 && data_ov002_022d0e6c.state != 6) func_ov002_0220e518(self);
  return 0;
 }
 return 0;
}
