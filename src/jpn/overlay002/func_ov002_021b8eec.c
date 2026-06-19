/* func_ov002_021b8eec: 2-D strided index -> (v>>10)&1. */
extern char data_ov002_022cf0cc[];
int func_ov002_021b8eec(int a0, int a1) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf0cc + (a0 & 1) * 0x868 + a1 * 20);
    return (v >> 10) & 1;
}
