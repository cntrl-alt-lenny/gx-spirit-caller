typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct Bytes { u32 a:8; u32 b:8; u32 c:8; u32 d:8; };
struct State {
    u32 player:1; u32 slot:4; u32 active:1; u32 rest:26;
    u16 flags; u16 id; u8 count; u8 count2;
    u16 result[3]; u16 source[3]; u16 status;
    struct Bytes bytes;
};
struct Record { u32 pad:13; u32 bit:1; u32 pad2:8; u32 value:8; u32 pad3:2; u32 rest[4]; };
struct Player { char pad[0x30]; struct Record records[105]; char tail[4]; };
struct Other { char pad[0x300]; u32 flags; };
extern struct State data_ov002_022cd300;
extern struct Player data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern struct Other data_ov002_022cd968;
extern void func_ov002_021e2d20(int arg0, int arg1, int arg2);
extern void func_ov002_021b1570(int a, int b, void *c, int n);
void func_ov002_0227a8fc(void) {
    int i;
    data_ov002_022cd300.bytes.a = 0;
    data_ov002_022cd300.bytes.b = 0;
    data_ov002_022cd300.bytes.c = 0;
    data_ov002_022cd300.bytes.d = 0;
    data_ov002_022cd300.status |= 0x40;
    data_ov002_022cd300.status &= ~0x80;
    for (i = 0; i < data_ov002_022cd300.count; i++) {
        u16 id = data_ov002_022cd300.source[i];
        struct Record *r = &data_ov002_022cf16c[(u8)id & 1].records[(u8)(id >> 8)];
        data_ov002_022cd300.result[i] = r->value * 2 + r->bit;
    }
    if (data_ov002_022cd300.active || (data_ov002_022cd300.flags & 4))
        func_ov002_021e2d20(((data_ov002_022cd300.flags & 0x10) > 0) ^ data_ov002_022cd300.player, 0x10, 1);
    if (data_ov002_022cd744[data_ov002_022cd300.player] == 2) {
        data_ov002_022cd300.status |= 0x80;
        func_ov002_021b1570(0x15, -1, &data_ov002_022cd300, 0x1c);
        data_ov002_022cd968.flags &= ~2;
    }
}
