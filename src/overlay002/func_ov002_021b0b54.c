/* func_ov002_021b0b54: id/value setter, paired with the func_ov002_021b0b0c
 * getter. For id < 53 write cd31c[id] = value directly; otherwise treat
 * (id-54) as a bit index into the cd3f0 bit-array and set/clear that bit
 * depending on whether value is nonzero. */
extern int data_ov002_022cd31c[];
extern unsigned int data_ov002_022cd3f0[];

void func_ov002_021b0b54(int id, int value) {
    int t;
    if (id < 53) {
        data_ov002_022cd31c[id] = value;
        return;
    }
    t = id - 54;
    if (value != 0)
        data_ov002_022cd3f0[t / 32] |= 1 << (t % 32);
    else
        data_ov002_022cd3f0[t / 32] &= ~(1 << (t % 32));
}
