typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;
struct Self { u16 id; u16 player:1; u16 row:5; u16 rest:10; u16 pad4:6; u16 value:9; u16 pad5:1; u16 pad6; u16 slots[2]; u16 key; u16 saved; };
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Node;
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
struct State { char pad[0x5a8]; int step; };
struct Command { char pad[0xd44]; int mode; char pad2[0x28]; u32 player; int pad3; int index; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_02257b48(void *p, void *q);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_02290500(int a, int b, int (*cb)(int,int,int));
extern int func_ov002_022107b4(int a, int b, int c);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern void func_ov002_021ae638(int p, unsigned int b, unsigned int c);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021b9b64(int unused0);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_022392e4(struct Self *self, void *arg) {
 int packed = func_ov002_0223de94((struct node *)self, 0);
 int player = packed & 0xff;
 int row = ((int)(u16)packed >> 8) & 0xff;
 switch (data_ov002_022ce288.step) {
 case 0x80:
  if (func_ov002_0223df38((struct Node *)self,0,0) != 0 && func_ov002_0225764c((int)self,player,row) != 0 && func_ov002_02257b48(self,arg) != 0) {
   func_ov002_021ae400(self->player,0x11e);
   return 0x7f;
  }
  return 0;
 case 0x7f:
  if (data_ov002_022cd744[self->player] == 1) func_ov002_02290500(self->player,self->id,func_ov002_022107b4);
  else func_ov002_022592ec((int)func_ov002_022107b4);
  return 0x7e;
 case 0x7e:
  if (func_ov002_022593f4() != 0) {
   struct Record *entry = (struct Record *)(data_ov002_022cf16c + (data_ov002_022d016c.player & 1) * 0x868 + 0x120);
   self->key = entry[data_ov002_022d016c.index].value * 2 + entry[data_ov002_022d016c.index].bit;
   if (data_ov002_022cd744[self->player] == 1) data_ov002_022d016c.mode = 0;
   else func_ov002_021ae638(0xf7,self->key,1);
   return 0x7d;
  }
  return 0x80;
 case 0x7d: {
  int flags;
  self->saved = func_ov002_021bc6c4(player);
  flags = 0;
  if (player != self->player) flags = 0x10;
  func_ov002_0227ac64(player,(struct Record *)func_ov002_021b9b64(self->key),1,data_ov002_022d016c.mode,(u16)flags | ((u32)self->id << 16));
  return 0x7c;
 }
 case 0x7c: {
  int amount = func_ov002_021c8470(player,self->saved);
  if (amount > 0xffff) amount = 0xffff;
  func_ov002_021d59cc(player,row,(u16)((u8)self->player | ((u8)self->row << 8)),0x17,(u16)amount);
  func_ov002_021d59cc(player,self->saved,(u16)((u8)self->player | ((u8)self->row << 8)),7,0);
  func_ov002_021d59cc(player,self->saved,self->id,3,self->value);
  return 0;
 }
 }
 return 0;
}

