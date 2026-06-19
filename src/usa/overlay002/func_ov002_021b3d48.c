/* func_ov002_021b3d48: Cluster A 2-D 0x868 lookup → handler 021b3d2c (raw
 * return). Reads the per-player/per-row u16 from the cf1a6 0x868 table. */
extern unsigned short data_ov002_022cf0c6[];
extern int func_ov002_021b3c4c(int a, int b);
int func_ov002_021b3d48(int arg0, int arg1, int arg2) {
    unsigned short v = *(unsigned short *)((char *)data_ov002_022cf0c6 + (arg0 & 1) * 0x868 + arg1 * 20);
    return func_ov002_021b3c4c(v, arg2);
}
