typedef unsigned int u32;
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern int func_ov002_021b9ecc(int player, int idx);

int func_ov002_021d96ec(int player, int val)
{
    int i;
    char *p = data_ov002_022cf16c + (player & 1) * 0x868 + 0x64;

    for (i = 5; i < 10; i++, p += 0x14) {
        if (val == func_ov002_021b9ecc(player, i)) {
            u32 f = *(u32 *)(p + 0x40);
            u16 h = *(u16 *)(p + 0x38);
            if (h & ~((f >> 6) & 1) & ~(((f >> 1) | (f >> 2)) & 1)) {
                return 1;
            }
        }
    }
    return 0;
}
