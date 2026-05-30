/* func_ov002_021b3014: Cluster A 2-D 0x868 lookup forwarded to the 6-arg
 * sink func_ov002_021b2ebc with mode 0 (two trailing stack args = 0). */
extern unsigned short data_ov002_022cf1a6[];
extern int func_ov002_021b2ebc(int a, int b, int c, int d, int e, int f);
void func_ov002_021b3014(int arg0, int arg1, int arg2) {
    unsigned short v = *(unsigned short *)((char *)data_ov002_022cf1a6 + (arg0 & 1) * 0x868 + arg1 * 20);
    func_ov002_021b2ebc(arg0, v, arg2, 0, 0, 0);
}
