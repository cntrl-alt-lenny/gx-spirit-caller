/* func_ov002_0226d95c: RMW data_ov002_022cd300's packed int (bit0=player,
 * mask 0xff8000ff, bits8+ = arg1), set a flag bit at +0x16, zero byte +8;
 * gate on func_ov002_021bcd80(player,-1) >= func_ov002_0226d814(arg1);
 * else forward to func_ov002_021b1200(&func_ov002_022717f8). */
extern int func_ov002_021bcd80(int bit0, int mask);
extern int func_ov002_0226d814(int id);
extern int func_ov002_021b1200(int (*fn)(int, int, int));
extern int func_ov002_022717f8(int, int, int);
extern char data_ov002_022cd300[];

int func_ov002_0226d95c(int player, int arg1) {
    char *g = data_ov002_022cd300;
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
        int r1 = func_ov002_021bcd80(player, 0 - 1);
        int r2 = func_ov002_0226d814(arg1);
        if (r1 < r2)
            return 0;
    }
    return func_ov002_021b1200(func_ov002_022717f8) != 0;
}
