/* func_ov002_021b3fb8: Cluster A 2-D 0x868 lookup → 021b3cb0(v,arg2,-1),
 * normalised to 0/1. */
extern unsigned short data_ov002_022cf0c6[];
extern int func_ov002_021b3bd0(int a, int b, int c);
int func_ov002_021b3fb8(int arg0, int arg1, int arg2) {
    unsigned short v = *(unsigned short *)((char *)data_ov002_022cf0c6 + (arg0 & 1) * 0x868 + arg1 * 20);
    return func_ov002_021b3bd0(v, arg2, -1) != 0;
}
