typedef unsigned short u16;
typedef unsigned char u8;
struct Node;
struct node;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct Global { char pad[0x5a8]; int state; };
extern struct Global data_ov002_022ce288;
extern char data_ov002_022cf178[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021decac(int a, int b, int c);
extern void func_ov002_0226af58(int arg0, int arg1, int arg2);
int func_ov002_0223ae68(struct Self *self) {
 int ret, x, y;
 int side;
 switch (data_ov002_022ce288.state) {
 case 0x80:
  if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
   ret = func_ov002_0223de94((struct node *)self, 0);
   x = (u8)ret;
   y = (u8)((u16)ret >> 8);
   if (func_ov002_0225764c((int)self, x, y)) {
    func_ov002_021decac((int)self, x, y);
    return 0x7f;
   }
  }
  return 0;
 case 0x7f:
  side = 1 - self->side;
  if (*(int *)(data_ov002_022cf178 + (side & 1) * 0x868))
   func_ov002_0226af58(side, 1, 1);
  return 0;
 }
 return 0;
}
