typedef unsigned short u16;

extern char data_ov002_022cf08c[];
extern int func_ov002_021b9dec(int player, int i);
extern int func_ov002_021b9c54(int player, int i);

int func_ov002_021bb8d4(int player, int target) {
    int i;
    int count = 0;
    char *row = data_ov002_022cf08c + (player & 1) * 0x868 + 0x64;
    for (i = 5; i <= 10; i++, row += 0x14) {
        int r = func_ov002_021b9dec(player, i);
        if (r > 0 && r == target) {
            unsigned int f40 = *(unsigned int *)(row + 0x40);
            u16 f38 = *(u16 *)(row + 0x38);
            if ((f38 & ~((f40 >> 6) & 1) & ~(((f40 >> 1) | (f40 >> 2)) & 1)) != 0) {
                if (func_ov002_021b9c54(player, i) != 0) {
                    count++;
                }
            }
        }
    }
    return count;
}
