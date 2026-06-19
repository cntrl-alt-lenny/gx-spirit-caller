/* func_ov002_021b0a2c: id → flag bit. For arg0 < 53 the answer is the direct
 * cd31c[arg0] entry; otherwise it is bit (arg0-54) of the cd3f0 bit-array. */
extern int data_ov002_022cd23c[];
extern unsigned int data_ov002_022cd310[];
int func_ov002_021b0a2c(int arg0) {
    int t;
    if (arg0 < 53)
        return data_ov002_022cd23c[arg0];
    t = arg0 - 54;
    return (data_ov002_022cd310[t / 32] >> (t % 32)) & 1;
}
