typedef unsigned int u32;
typedef unsigned short u16;
struct Slot { u32 id:13; u32 flag:1; u32 rest:18; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021b9ecc(int player, int index);
extern int func_0202e2f8(int unused0);
extern int func_0202e234(int x);
extern int func_ov002_021ca51c();
int func_ov002_021c23ac(int player, int index) {
    int id = func_ov002_021b9ecc(player, index);
    u32 flags;
    if (!id) return 0;
    if (id == 0x16f8) {
        u32 bits = *(u32 *)(data_ov002_022cf1ac + (player & 1)*0x868 + index*20);
        u32 h = *(u16 *)(data_ov002_022cf1a4 + (player & 1)*0x868 + index*20);
        if ((h & ~((bits >> 6) & 1)) & ~(((bits >> 1) | (bits >> 2)) & 1)) return 0;
    }
    if (func_0202e2f8(id)) return 0;
    flags = func_ov002_021ca51c();
    if (flags & 1) return 0;
    if (flags & 2) {
        if (func_0202e234(id)) return 0;
    }
    if (flags & 4) {
        if (!((struct Slot *)(data_ov002_022cf16c + (player & 1)*0x868 + index*20 + 0x30))->flag) return 0;
    }
    if (flags & 8) {
        if (((struct Slot *)(data_ov002_022cf16c + (player & 1)*0x868 + index*20 + 0x30))->flag == 1) return 0;
    }
    return 1;
}






