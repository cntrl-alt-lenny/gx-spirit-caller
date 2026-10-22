typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;
struct Self { u16 id; u16 side:1; u16 rest:15; u16 pad[3]; u16 card; u16 cards[2]; u16 count; };
struct node;
struct Node;
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 rest:2; };
extern struct { char pad[0x5a8]; int state, side, index; } data_ov002_022ce288;
extern struct { char pad[0xd94]; u32 cur; } data_ov002_022d016c;
extern struct { char pad[0xb0]; u16 value; } data_ov002_022d0e6c;
extern char data_ov002_022cf1a4[];
extern struct Record data_ov002_022cdc88[];
extern unsigned short func_0202b9b0(unsigned short key);
extern int func_0202e234(int x);
extern int func_0203058c(int a);
extern int func_02030808(int a);
extern int func_ov002_021b947c(u32 a);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bbda8(int a, int b);
extern int func_ov002_021bc618(int a);
/* This caller supplies only the first argument of the four-argument thunk. */
extern int func_ov002_021ca2b8();
extern void func_ov002_021d7c1c(void *a, void *b, void *c);
extern int func_ov002_021d873c(int a, int b);
extern void func_ov002_021e16a4(int a, int b, int c, int d);
extern int func_ov002_021e27c0(int a, int b);
extern int func_ov002_021e286c(int a);
/* This caller supplies none of the unused parameters. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern u16 func_ov002_0223de94(struct node *a, int b);
extern int func_ov002_0223df38(struct Node *a, int b, int *c);
extern int func_ov002_0225368c(int a, int b, int c);
extern void func_ov002_0226b034(int a, int b, int c);
extern void func_ov002_0226b054(int a);

extern void func_ov002_0226b0b0(int a, int b, int c);
extern int func_ov002_0226c708(u32 a, int b, int c);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_02234e20(struct Self *self) {
 int n = data_ov002_022ce288.side;
 int player = n ^ self->side;
 switch (data_ov002_022ce288.state) {
 case 0x80:
  self->cards[0] = 0;
  self->cards[1] = 0;
  if (func_ov002_021ca2b8(1-self->side) && func_ov002_021bc618(1-self->side)) {
   int i;
   data_ov002_022d016c.cur = 1-self->side;
   for (i=0;i<=4;i++) {
    if (func_ov002_0226c708(1-self->side,i,0)) {
     func_ov002_0226b034(1-self->side,self->id,0);
     return 0x7f;
    }
   }
  }
  return 0x7e;
 case 0x7f:
  func_ov002_021d873c((u8)data_ov002_022d0e6c.value,(u8)(data_ov002_022d0e6c.value>>8));
  self->cards[1] = func_ov002_021b9ecc((u8)data_ov002_022d0e6c.value,(u8)(data_ov002_022d0e6c.value>>8));
  return 0x7e;
 case 0x7e:
  if (func_ov002_021ca2b8(self->side) && func_ov002_021bc618(self->side) && func_ov002_0223df38((struct Node *)self,0,0)) {
   int v = func_ov002_0223de94((struct node *)self,0);
   int a = (u8)v;
   int b = (u8)((u16)v >> 8);
   int id = func_ov002_021b9ecc(a,b);
   if (*(u16 *)(data_ov002_022cf1a4+(a&1)*0x868+(short)b*0x14) && func_0202e234(id) && func_02030808(id))
    self->cards[0] = func_ov002_021b9ecc(a,b);
  }
  func_ov002_021e2b3c();
  data_ov002_022ce288.side = 0;
  return 0x7d;
 case 0x7d:
  self->card = self->cards[n];
  if (!self->card) return 0x64;
  self->count = func_ov002_0225368c(player,self->id,self->card);
  data_ov002_022ce288.index = 0;
  if (!self->count) {
   func_ov002_0226b0b0(player,self->id,0);
   return 0x78;
  }
  if (func_ov002_021bc618(player) >= self->count) return 0x7c;
  func_ov002_0226b0b0(player,self->id,1);
  return 0x7a;
 case 0x7c:
  if (data_ov002_022ce288.index < self->count) {
   struct Record *p = &data_ov002_022cdc88[data_ov002_022ce288.index];
   int mode = player!=self->side?2:0;
   func_ov002_0227ac64(player,p,1,mode,0);
   data_ov002_022ce288.index++;
   return 0x7c;
  }
  return 0x78;
 case 0x7a:
  if (data_ov002_022ce288.index < self->count) {
   struct Record *p = &data_ov002_022cdc88[data_ov002_022ce288.index];
   if ((u8)((u16)func_ov002_021b947c(p->value*2+p->bit)>>8)==11)
    func_ov002_021d7c1c(player,p,0);
   data_ov002_022ce288.index++;
   return 0x7a;
  }
  func_ov002_021e16a4(player,self->card,1,player!=self->side?1:0);
  return 0x78;
 case 0x78:
  {
   int num = func_ov002_021bbda8(player,self->card);
   if (num >= func_0202b9b0(self->card)) return 0x75;
   if (func_0203058c(self->card)) return 0x75;
   func_ov002_021e27c0(player,1);
   return 0x77;
  }
 case 0x77:
  func_ov002_0226b054(1-player);
  return 0x76;
 case 0x76:
  func_ov002_021e27c0(player,0);
  return 0x75;
 case 0x75:
  func_ov002_021e286c(player);
  return 0x64;
 case 0x64:
  if (++data_ov002_022ce288.side < 2) return 0x7d;
  func_ov002_021e2c5c();
  return 0;
 }
 return 0;
}


