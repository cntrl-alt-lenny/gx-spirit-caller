typedef unsigned short u16;
typedef unsigned char u8;
struct Rec0650 {
    u16 f0;
    unsigned short kind : 4;
    unsigned short pad : 12;
    u16 f4;
    u16 next;
};
extern char data_ov002_022cf1a6[];
extern struct Rec0650 data_ov002_022d0650[];
int func_ov002_021b33b0(int a, int b, int player, int idx)
{
    u16 cur;
    cur = *(u16 *)(data_ov002_022cf1a6 + (player & 1) * 0x868 + idx * 0x14);
    if (cur != 0) {
        do {
            struct Rec0650 *rec = &data_ov002_022d0650[cur];
            cur = rec->next;
            if (rec->kind >= 10) {
                int f0 = rec->f0;
                u8 side = f0;
                u8 slot = f0 >> 8;
                if (side == a && slot == b)
                    return 1;
            }
        } while (cur != 0);
    }
    return 0;
}
