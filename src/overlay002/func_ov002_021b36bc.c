typedef unsigned short u16;
typedef unsigned char u8;
struct Rec0650 {
    u16 f0;
    unsigned short kind : 4;
    unsigned short pad : 12;
    u16 f4;
    u16 next;
};
extern char data_ov002_022cd3f4[];
extern struct Rec0650 data_ov002_022d0650[];
u16 func_ov002_021b36bc(int a, int b)
{
    int i;
    u16 cur;
    char *p = data_ov002_022cd3f4;
    for (i = 0; i < 2; i++, p += 0x14) {
        cur = *(u16 *)(p + 0xce);
        if (cur != 0) {
            do {
                struct Rec0650 *rec = &data_ov002_022d0650[cur];
                cur = rec->next;
                if (rec->kind >= 6) {
                    int f0 = rec->f0;
                    u8 side = f0;
                    u8 slot = f0 >> 8;
                    if (side == a && slot == b) {
                        int x, y;
                        if (i == 0) {
                            x = *(int *)data_ov002_022cd3f4;
                            y = *(int *)(data_ov002_022cd3f4 + 0x1c);
                        } else {
                            x = *(int *)(data_ov002_022cd3f4 + 4);
                            y = *(int *)(data_ov002_022cd3f4 + 0x20);
                        }
                        return (u8)x | ((u8)y << 8);
                    }
                }
            } while (cur != 0);
        }
    }
    return 0xffff;
}


