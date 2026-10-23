typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    u32 id:13;
    u32 flag:1;
    u32 pad:8;
    u32 value:8;
    u32 rest:2;
    u32 other;
    u16 active;
    u16 pad2;
    u32 tail[2];
} Entry;
typedef struct { unsigned char pad[0x30]; Entry entries[5]; unsigned char tail[0x7d4]; } Player;
extern Player data_ov002_022cf16c[];
extern struct { unsigned char pad[0xd28]; u32 index; } data_ov002_022d016c;
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_02267644(u32 a) {
    u32 i = data_ov002_022d016c.index;
    Player *p;
    int id;
    u32 offset;
    u32 stride;
    u32 base;
    if (i < 5) {
        stride = 0x868;
        base = (u32)data_ov002_022cf16c;
        offset = stride * (a & 1);
        p = (Player *)(offset + base);
        do {
            id = func_ov002_021b9ecc(a, i);
            switch (id) {
            case 0x17d1: case 0x17d5: case 0x17d9:
            case 0x1812: case 0x1814: case 0x1817:
            case 0x1822: case 0x185e: case 0x1ad6:
            case 0x1ad7: case 0x1adc: case 0x1add:
                if (p->entries[i].active != 0) {
                    func_ov002_021e30b4(((u32)a << 31 & 0x80000000) | 0x04200000 | ((i << 16) & 0x1f0000) | (u16)id,
                        (u16)(p->entries[i].flag + (p->entries[i].value << 1)), 0);
                    data_ov002_022d016c.index++;
                    return 0;
                }
                break;
            }
            i = ++data_ov002_022d016c.index;
        } while (i < 5);
    }
    return 1;
}







