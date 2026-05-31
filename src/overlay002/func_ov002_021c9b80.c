/* func_ov002_021c9b80: set/clear bit arg2 of player (arg0&1)'s cf1ac row arg1
 * flag word (arg3 != 0 = set). 2-D sibling of func_ov002_021c9b2c. */
extern int data_ov002_022cf1ac[];
void func_ov002_021c9b80(int arg0, int arg1, int arg2, int arg3) {
    if (arg3 != 0)
        *(int *)((char *)data_ov002_022cf1ac + (arg0 & 1) * 0x868 + arg1 * 20) |= 1 << arg2;
    else
        *(int *)((char *)data_ov002_022cf1ac + (arg0 & 1) * 0x868 + arg1 * 20) &= ~(1 << arg2);
}
