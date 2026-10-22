typedef unsigned short u16;
struct Ov002Self { u16 a; };
struct Node;
struct node;
extern int data_ov002_022cd3f4[];
extern int func_ov002_02257594(void *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
int func_ov002_02230a30(struct Ov002Self *self, int arg1) {
 int side = data_ov002_022cd3f4[1];
 int slot = data_ov002_022cd3f4[8];
 int packed, a, b;
 if (func_ov002_02257594(self, arg1) == 0) return 0;
 if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0) {
  packed = func_ov002_0223de94((struct node *)self, 0);
  a = packed & 0xff;
  b = ((u16)packed >> 8) & 0xff;
  if (func_ov002_0225764c((int)self, a, b) != 0) {
   func_ov002_021d5a08(self, side, slot, self->a, 4, (u16)func_ov002_021c8470(a, b));
  }
 }
 return 0;
}
