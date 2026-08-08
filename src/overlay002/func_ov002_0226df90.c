/* func_ov002_0226df90: gate on bit17 of the per-(arg0&1)-row
 * data_ov002_022cf288 entry being clear, then on func_ov002_021b3ecc and
 * func_ov002_021bb068 guards. Then count how many of 5 iterations (i=0..4)
 * of func_ov002_021bc8c8(1-arg0,1-arg0,i) are nonzero; return count>=2. */
extern int data_ov002_022cf288[];
extern int func_ov002_021b3ecc(int arg0, int a, int b);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bc8c8(int a, int b, int c);

int func_ov002_0226df90(int arg0) {
    int rowOff = (arg0 & 1) * 0x868;
    int count = 0;
    int entry = *(int *)((char *)data_ov002_022cf288 + rowOff);
    int i, other;

    if (((unsigned int)entry >> 17) & 1)
        return count;
    if (func_ov002_021b3ecc(arg0, 11, 0x12f3) != 0)
        return count;
    if (func_ov002_021bb068(0x13f2) > 0)
        return count;

    i = count;
    other = 1 - arg0;
    do {
        if (func_ov002_021bc8c8(other, other, i) != 0)
            count++;
        i++;
    } while (i <= 4);

    return count >= 2;
}
