/* func_ov002_021b4054: Cluster A 2-D 0x868 lookup → 021b3c5c(v,arg2,arg3),
 * normalised to 0/1. */
extern unsigned short data_ov002_022cf1a6[];
extern int func_ov002_021b3c5c(int a, int b, int c);
int func_ov002_021b4054(int arg0, int arg1, int arg2, int arg3) {
    unsigned short v = *(unsigned short *)((char *)data_ov002_022cf1a6 + (arg0 & 1) * 0x868 + arg1 * 20);
    return func_ov002_021b3c5c(v, arg2, arg3) != 0;
}
