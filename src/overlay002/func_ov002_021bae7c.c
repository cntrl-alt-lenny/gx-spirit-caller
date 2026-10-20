typedef unsigned int u32;
typedef unsigned short u16;
extern int func_0202e234(int x);
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_021b9ecc(int player, int idx);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf26c[];
extern char data_ov002_022cf274[];
extern char data_ov002_022d016c[];

int func_ov002_021bae7c(int player, int id, int except) {
    int i;
    int count = 0;
    if (func_0202e234(id)) {
        char *p = data_ov002_022cf16c + (player & 1) * 0x868;
        for (i = 0; i <= 4; p += 20, i++) {
            if (func_ov002_021b9ecc(player, i) == id && i != except) {
                u32 flags = *(u32 *)(p + 0x40);
                if ((*(u16 *)(p + 0x38) & ~((flags >> 6) & 1) & ~(((flags >> 1) | (flags >> 2)) & 1)) &&
                    !(*(u32 *)(data_ov002_022d016c + 0xd4) & (1 << ((player << 4) + i))))
                    count++;
            }
        }
    } else if (func_0202b8c0(id) != 2) {
        char *p = data_ov002_022cf16c + (player & 1) * 0x868 + 0x64;
        for (i = 5; i < 10; p += 20, i++) {
            if (func_ov002_021b9ecc(player, i) == id && i != except) {
                u32 flags = *(u32 *)(p + 0x40);
                if ((*(u16 *)(p + 0x38) & ~((flags >> 6) & 1) & ~(((flags >> 1) | (flags >> 2)) & 1)) &&
                    !(*(u32 *)(data_ov002_022d016c + 0xd4) & (1 << ((player << 4) + i))))
                    count++;
            }
        }
    } else {
        if (func_ov002_021b9ecc(player, 10) == id) {
            int off = (player & 1) * 0x868;
            u32 flags = *(u32 *)(data_ov002_022cf274 + off);
            if ((*(u16 *)(data_ov002_022cf26c + off) & ~((flags >> 6) & 1) & ~(((flags >> 1) | (flags >> 2)) & 1)) &&
                !(*(u32 *)(data_ov002_022d016c + 0xd4) & (1 << ((player << 4) + 10))))
                count++;
        }
    }
    return count;
}



