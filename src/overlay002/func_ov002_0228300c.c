typedef unsigned int u32;
struct Row { u32 id:13; u32 rest:19; u32 pad[4]; };
struct Entry { unsigned short id:13; unsigned short rest:3; unsigned short pad; };
extern char data_ov002_022cf16c[];
extern struct Entry data_ov002_022d0254[];
extern unsigned int func_0202b890(int id);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_02280c40(int a, int b, int c, int d, int e);
int func_ov002_0228300c(int side, int card, int flags) {
    int count = (unsigned char)flags;
    int mask = (unsigned char)((unsigned short)flags >> 8);
    int i, scan;
    int previous = -1;
    int result = 0;
    int j, attr, start;
    struct Row *row;
    struct Entry *entry;
    if (card == 0x171f) {
        entry = data_ov002_022d0254;
        for (scan = 1; scan < 256; entry++, scan++) {
            if ((scan & 1) == side) {
                switch (entry->id) {
                case 0x10d9:
                case 0x1242:
                case 0x13a4:
                case 0x16a8:
                case 0x1767:
                case 0x17ed:
                    return 0x2;
                case 0x10d4:
                case 0x1140:
                case 0x123b:
                case 0x1397:
                case 0x188c:
                    return 0x4;
                case 0x10db:
                case 0x16ab:
                case 0x18c0:
                case 0x1928:
                case 0x196c:
                case 0x1a2c:
                    return 0x8;
                case 0x1234:
                case 0x12ee:
                case 0x17e1:
                case 0x17e3:
                case 0x1827:
                case 0x1860:
                case 0x18c1:
                case 0x1929:
                case 0x196d:
                case 0x1a2d:
                    return 0x10;
                case 0x10ea:
                case 0x138b:
                case 0x17e4:
                case 0x1861:
                case 0x18bf:
                case 0x1927:
                case 0x196b:
                case 0x19f0:
                case 0x19f1:
                case 0x1a2b:
                    return 0x20;
                case 0x1184:
                case 0x12ef:
                case 0x1826:
                case 0x182a:
                case 0x18c2:
                case 0x192a:
                case 0x196e:
                case 0x1a2e:
                case 0x1a30:
                case 0x1a40:
                    return 0x40;
                }
            }
        }
    }
    row = (struct Row *)(data_ov002_022cf16c + ((1-side)&1)*0x868);
    for (i = 0; i < 2; i++) {
        previous = func_ov002_02280c40(side, 1-side, previous, 1, 0);
        if (previous >= 0) {
            attr = func_0202b890(((struct Row *)((char *)row + 0x30))[previous].id);
            if (attr > 0 && attr <= 6 && (mask & (1 << attr)) && count != 0) {
                result |= 1 << attr;
                mask ^= 1 << attr;
                count--;
            }
        }
    }
    for (i = 0; i < count; i++) {
        start = func_ov002_021b00d0(6);
        for (j = 0; j < 6; j++) {
            attr = (j + start) % 6 + 1;
            if (mask & (1 << attr)) {
                result |= 1 << attr;
                mask ^= 1 << attr;
                break;
            }
        }
    }
    return result;
}
