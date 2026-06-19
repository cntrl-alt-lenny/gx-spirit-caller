/* func_ov002_021b9d20: guarded per-player 0x868 read (Cluster A). If
 * func_02031084 accepts the current func_ov002_021b9dec handle, returns the
 * int at row arg1 of player (arg0&1)'s cf1a8 table; else 0. */
extern int data_ov002_022cf0c8[];
extern int func_ov002_021b9dec(int a, int b);
extern int func_02031084(int a);
int func_ov002_021b9d20(int arg0, int arg1) {
    if (func_02031084(func_ov002_021b9dec(arg0, arg1)) == 0)
        return 0;
    return *(int *)((char *)data_ov002_022cf0c8 + (arg0 & 1) * 0x868 + arg1 * 20);
}
