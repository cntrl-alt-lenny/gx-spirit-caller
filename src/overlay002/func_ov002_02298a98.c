typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u32 id:13; u32 flag:1; u32 pad:8; u32 tag:8; u32 rest:2; char tail[16]; } Slot;
typedef union {
    u32 words[6];
    struct { u16 id; u16 side:1; u16 index:5; u16 pad:6; u16 kind:2; u16 rest:2; u16 low:6; u16 tag:9; u16 high:1; u16 tail[9]; } b;
} Card;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021bdc94(int a, int b);
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021bcf18(int, int, int, int);
extern int func_ov002_02257ab8(int a, int b);
extern int func_0202f9e8(int);
int func_ov002_02298a98(int player, int index) {
    int id;
    if (func_ov002_021bdc94(player, index) != 0) {
        id = func_ov002_021b9ecc(player, index);
        switch (id) {
        case 0x1533: case 0x16fa: case 0x19f1:
            return 1;
        case 0x11f5:
            return *(u32 *)(data_ov002_022cf178 + (player & 1) * 0x868) <= 5;
        case 0xffa: case 0x1086: case 0x119b: case 0x11c3:
        case 0x1200: case 0x1227: case 0x13ab: case 0x13b0: case 0x1413:
        case 0x152a: case 0x152b: case 0x152e: case 0x16ba: case 0x179a:
        case 0x17e0: case 0x186e: case 0x1877: case 0x18ba: case 0x18bb: {
            Slot *slot = (Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
            Card card = {0};
            card.b.id = id;
            card.b.side = (u16)player;
            card.b.index = (u16)index;
            card.b.tag = (u16)(slot[index].tag * 2 + slot[index].flag);
            card.b.kind = 1;
            if (func_ov002_02257ab8((int)&card, 1-player) == 0) return 0;
            break;
        }
        case 0x11f0:
            if (func_ov002_021bcf18(1-player, 0, 1, 1) < 2) return 0;
            break;
        }
        return func_0202f9e8(id);
    }
    return 0;
}


