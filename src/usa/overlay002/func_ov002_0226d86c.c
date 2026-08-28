/* func_ov002_0226d86c: RMW data_ov002_022cd220's packed int (bit0=player,
 * mask 0xff8000ff, bits8+ = arg1), set a flag bit at +0x16, zero byte +8;
 * gate on func_ov002_021bcca0(player,-1) >= func_ov002_0226d724(arg1);
 * else forward to func_ov002_021b1120(&func_ov002_02271708). */
extern int func_ov002_021bcca0(int bit0, int mask);
extern int func_ov002_0226d724(int id);
extern int func_ov002_021b1120(int (*fn)(int, int, int));
extern int func_ov002_02271708(int, int, int);
extern char data_ov002_022cd220[];

int func_ov002_0226d86c(int player, int arg1) {
    char *g = data_ov002_022cd220;
    int val = *(int *)g;
    int newval = (val & ~1) | (player & 1);
    newval &= 0xff8000ff;
    newval |= (unsigned)(arg1 << 17) >> 9;
    *(int *)g = newval;

    {
        unsigned short flags = *(unsigned short *)(g + 0x16);
        flags |= 2;
        *(unsigned short *)(g + 0x16) = flags;
    }
    *(char *)(g + 8) = 0;

    {
        int r1 = func_ov002_021bcca0(player, 0 - 1);
        int r2 = func_ov002_0226d724(arg1);
        if (r1 < r2)
            return 0;
    }
    return func_ov002_021b1120(func_ov002_02271708) != 0;
}
