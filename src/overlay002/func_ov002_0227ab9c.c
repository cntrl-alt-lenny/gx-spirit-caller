typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct State {
 u32 player:1; u32 slot:4; u32 active:1; u32 mode:2; u32 card:15; u32 key:9;
 u16 flags; u16 id; u8 count; u8 count2; char pad[12];
 u16 low:8; u16 state:3; u16 high:5;
};
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; u32 rest[4]; };
struct Player { char pad[0x30]; struct Record records[105]; char tail[4]; };
extern struct State data_ov002_022cd300;
extern struct Player data_ov002_022cf16c[];
extern void func_ov002_0227a8fc(void);
void func_ov002_0227ab9c(int a, int b) {
 struct Record *r;
 data_ov002_022cd300.player = a;
 data_ov002_022cd300.slot = b;
 data_ov002_022cd300.active = 1;
 data_ov002_022cd300.mode = 0;
 r = &data_ov002_022cf16c[a & 1].records[b];
 data_ov002_022cd300.count = data_ov002_022cd300.count2 = 0;
 data_ov002_022cd300.key = r->value * 2 + r->bit;
 data_ov002_022cd300.card = r->card;
 data_ov002_022cd300.state = 2;
 data_ov002_022cd300.flags = 1;
 data_ov002_022cd300.id = 0;
 func_ov002_0227a8fc();
}

