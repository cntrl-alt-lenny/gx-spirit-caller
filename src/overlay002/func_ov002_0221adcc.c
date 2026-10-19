typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;
struct node { char _pad[8]; u16 arr8[5]; u16 f18; };
struct Self {
 u16 id;
 u16 side:1; u16 index:5; u16 rest2:10;
 u16 rest4:6; u16 value:9; u16 pad4:1;
 u16 f6; u16 f8; u16 fa; u16 state;
};
struct Slot { u32 lo:13; u32 bit:1; u32 pad:8; u32 hi:8; u32 tail:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223df38(struct node *, int, int *);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021c2084(struct Self *, int, int, int);
extern int func_ov002_021de64c(int a, int b, int c, int unused3);
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
int func_ov002_0221adcc(struct Self *self) {
 switch (self->state) {
 case 1:
  if (func_ov002_0223df38((struct node *)self, 0, 0)) {
   int packed = (u16)func_ov002_0223de94((struct node *)self, 0);
   int side = packed & 0xff;
   int index = ((u16)packed >> 8) & 0xff;
   if (func_ov002_0225764c((int)self, side, index)) {
    if (func_ov002_021c2084(self, side, index, 1)) {
     func_ov002_021de64c((int)self, side, index, 2);
    }
   }
  }
  return 0;
 case 2:
  {
   struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30 + self->index * 20);
   if (self->value != slot->bit + (slot->hi << 1)) return 0;
   if (*(u16 *)(data_ov002_022cf1a4 + (self->side & 1) * 0x868 + self->index * 20) == 0) return 0;
   func_ov002_021d90c0(self->side, self->index, self->f8);
  }
  return 0;
 }
 return 0;
}



