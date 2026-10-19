typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct State {
 u32 player:1; u32 slot:4; u32 active:1; u32 mode:2; u32 card:15; u32 key:9;
 u16 flags; u16 id; u8 count; u8 count2; char pad[12];
 u16 low:8; u16 state:3; u16 high:5;
};
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
extern struct State data_ov002_022cd300;
extern int func_ov002_021bc6e8(int arg0);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021b947c(u32 key);
extern int func_ov002_021b9aa8(u32 a, u32 b);
extern void func_ov002_02254a2c(int a);
extern void func_ov002_0227a8fc(void);
void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e) {
 int slot;
 slot = func_ov002_021bc6e8(a);
 if (slot < 0) return;
 if (func_ov002_021bb068(0x135d) != 0) c = 1;
 data_ov002_022cd300.player = a;
 data_ov002_022cd300.slot = slot;
 data_ov002_022cd300.active = c;
 data_ov002_022cd300.mode = d;
 data_ov002_022cd300.count = data_ov002_022cd300.count2 = 0;
 data_ov002_022cd300.card = b->card;
 data_ov002_022cd300.key = b->value * 2 + b->bit;
 data_ov002_022cd300.state = 3;
 data_ov002_022cd300.flags = (u16)e | 4;
 data_ov002_022cd300.id = e >> 16;
 if ((u8)((u16)func_ov002_021b947c(data_ov002_022cd300.key) >> 8) == 14)
  data_ov002_022cd300.flags |= 0x20;
 if (func_ov002_021b9aa8(a, data_ov002_022cd300.key) >= 0)
  func_ov002_02254a2c(a);
 func_ov002_0227a8fc();
}

