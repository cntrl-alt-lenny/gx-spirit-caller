/* func_ov002_021b9e00: guarded per-player 0x868 read (Cluster A). If
 * func_020310d8 accepts the current func_ov002_021b9ecc handle, returns the
 * int at row arg1 of player (arg0&1)'s cf1a8 table; else 0. */
extern int data_ov002_022cf1a8[];
extern int func_ov002_021b9ecc(int a, int b);
extern int func_020310d8(int a);
int func_ov002_021b9e00(int arg0, int arg1) {
    if (func_020310d8(func_ov002_021b9ecc(arg0, arg1)) == 0)
        return 0;
    return *(int *)((char *)data_ov002_022cf1a8 + (arg0 & 1) * 0x868 + arg1 * 20);
}
