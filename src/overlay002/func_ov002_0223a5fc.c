typedef unsigned short u16;
typedef unsigned char u8;
struct Slot { u16 side:1; u16 kind:4; u16 number:9; u16 state:2; };
struct Node { u16 id; u16 side:1; u16 rest:15; u16 pad4; struct { u16 lo:8; u16 hi:8; } count; struct Slot slots[5]; u16 start; };
struct node;
struct Record { unsigned card:13; unsigned bit:1; unsigned pad:8; unsigned value:8; unsigned pad2:2; };
struct Global { char pad[0x5a8]; int state; };
extern struct Global data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021de9d4(int a, int b, int c);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_021bc618(int arg0);
/* The original supplies only the first argument to this four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int *func_ov002_021afb74(void);
extern void func_ov002_021ae638(int p, unsigned int b, unsigned int c);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, unsigned e);
int func_ov002_0223a5fc(struct Node *self) {
 int x, y;
 int ret;
 struct Record *r;
 int flags;
 switch (data_ov002_022ce288.state) {
 case 0x80:
  if (func_ov002_0223df38(self, 0, 0)) {
   ret = func_ov002_0223de94((struct node *)self, 0);
   x = (u8)ret;
   y = (u8)((u16)ret >> 8);
   if (func_ov002_0225764c((int)self, x, y)) {
    *(u16 *)((char *)self + 0xa) = func_ov002_021b9ecc(x, y);
    *(u16 *)((char *)self + 0xc) = ((struct Record *)(data_ov002_022cf16c + (x & 1) * 0x868 + y * 20 + 0x30))->bit;
    if (func_ov002_021de9d4((int)self, x, y)) {
     func_ov002_021e286c(*(u16 *)((char *)self + 0xc));
     return 0x7f;
    }
   }
  }
  return 0;
 case 0x7f:
  if (!func_ov002_021bc618(*(u16 *)((char *)self + 0xc))) return 0;
  if (!func_ov002_021ca2b8(self->side)) return 0;
  if (!func_ov002_0225368c(self->side, self->id, *(u16 *)((char *)self + 0xa) | (*(u16 *)((char *)self + 0xc) << 16))) return 0;
  func_ov002_021ae400(self->side, 0xf0);
  return 0x7e;
 case 0x7e:
  func_ov002_021af9d0(self->side, 6, self->id, *(u16 *)((char *)self + 0xa) | (*(u16 *)((char *)self + 0xc) << 16));
  return 0x7d;
 case 0x7d:
  if (data_ov002_022cd744[self->side] == 1) {
   *(int *)(data_ov002_022d016c + 0xd44) = 0;
  } else {
   r = (struct Record *)func_ov002_021afb74();
   func_ov002_021ae638(0xf7, ((struct Record *)func_ov002_021afb74())->value * 2 + r->bit, 1);
  }
  return 0x7c;
 case 0x7c:
  flags = 0;
  if (*(u16 *)((char *)self + 0xc) != self->side) flags = 0x10;
  func_ov002_0227ac64(*(u16 *)((char *)self + 0xc), (struct Record *)func_ov002_021afb74(), 1, *(int *)(data_ov002_022d016c + 0xd44), (u16)flags | (self->id << 16));
  break;
 }
 return 0;
}

