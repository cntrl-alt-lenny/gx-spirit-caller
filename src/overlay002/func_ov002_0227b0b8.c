/* func_ov002_0227b0b8: default tier (8 callee-saved regs, even, no
 * r3-spill; genuine sub sp,#0x2c for an address-taken local buffer).
 * Scans 5 fixed row-entries of data_ov002_022cf16c (0x868 stride,
 * C-60 table family), dispatching one of two callback functions per
 * valid entry and tracking the max of a field written into a local
 * buffer by func_ov002_0227b090.
 */

extern char data_ov002_022cf16c[];
extern int func_ov002_021be384(int player, int i, int one);
extern int func_ov002_021be4a0(int player, int i, int one);
extern void func_ov002_0227b090(int player, int i, void *buf);

int func_ov002_0227b0b8(int player, int count, int mode) {
    int i;
    int max = -1;
    char *row_base = data_ov002_022cf16c + (player & 1) * 0x868;
    char *cursor = row_base + 0x30;
    char buf[0x2c];

    for (i = 0; i <= 4; i++, cursor += 0x14) {
        int id;
        int result;

        if (i == count)
            continue;

        id = *(int *)cursor;
        id = (unsigned int)(id << 19) >> 19;
        if (id == 0)
            continue;

        if (mode != 0) {
            result = func_ov002_021be384(player, i, 1);
        } else {
            result = func_ov002_021be4a0(player, i, 1);
        }
        if (result == 0)
            continue;

        func_ov002_0227b090(player, i, buf);
        {
            int v = *(int *)(buf + 0x14);
            if (v > max)
                max = v;
        }
    }

    return max;
}
