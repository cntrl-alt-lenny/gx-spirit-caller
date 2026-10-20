typedef unsigned short u16;
typedef unsigned char u8;
struct Card { u16 id; u16 side:1; u16 unused2:13; u16 flipped:1; u16 unused3:1; u16 unused4:5; u16 active:1; u16 unused5:10; u16 pad[9]; u16 effect; u16 owner:1; u16 unused6:15; };
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 rest:10; } Card021c1e44;
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Node;
struct State { char pad[0xd0]; unsigned flags; };
extern struct State data_ov002_022d016c;
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c8470(int a, int b);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_021df818(struct Card *card, int side, int amount);
extern int func_ov002_021e05fc(int side, int amount);
int func_ov002_0221aa28(struct Card *self) {
 int packed;
 int side;
 int index;
 if ((data_ov002_022d016c.flags & 1)) return 0;
 if (!((data_ov002_022d016c.flags >> 1) & 1)) return 0;
 if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
  packed = func_ov002_0223de94((struct node *)self, 0);
  side = (u8)packed;
  index = (u8)((u16)packed >> 8);
  if (*(u16 *)(data_ov002_022cf1a4 + (side & 1) * 0x868 + index * 20)) {
   switch (self->id) {
   case 0x1380:
    func_ov002_021e05fc(self->side, func_ov002_021c8470(side, index));
    break;
   case 0x1404:
    if (!func_ov002_021c1e44((Card021c1e44 *)self, side, index)) {
     func_ov002_021d479c((side ? 0x8000 : 0) | 0x20, index, 0, 0);
     func_ov002_021df818(self, side, func_ov002_021c8470(side, index));
    }
    break;
   case 0x176a:
    if (!func_ov002_021c1e44((Card021c1e44 *)self, side, index)) {
     func_ov002_021d479c((side ? 0x8000 : 0) | 0x20, index, 0, 0);
     func_ov002_021e05fc(self->side, func_ov002_021c8470(side, index));
    }
    break;
   }
  }
 }
 return 0;
}

