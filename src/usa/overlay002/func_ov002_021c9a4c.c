/* func_ov002_021c9a4c: set/clear bit arg1 of player (arg0&1)'s cf288 flag word
 * (arg2 != 0 = set). */
extern int data_ov002_022cf1a8[];
void func_ov002_021c9a4c(int arg0, int arg1, int arg2) {
    if (arg2 != 0)
        *(int *)((char *)data_ov002_022cf1a8 + (arg0 & 1) * 0x868) |= 1 << arg1;
    else
        *(int *)((char *)data_ov002_022cf1a8 + (arg0 & 1) * 0x868) &= ~(1 << arg1);
}
