/* func_ov002_0226daec: same D016C-style global bit-pack header as the
 * shipped func_ov002_0226df10 sibling, then a nested loop a=0,1 x b=0..4
 * calling func_ov002_02270ca8(a,b,0); return 1 on the first nonzero
 * result, else 0. */
extern int data_ov002_022cd300;
extern int func_ov002_02270ca8(int a, int b, int c);

int func_ov002_0226daec(int player, int arg1) {
    int val = data_ov002_022cd300;
    int a, b;

    val = (val & ~1) | (player & 1);
    val &= 0xff8000ff;
    val |= ((unsigned int)arg1 << 17) >> 9;
    data_ov002_022cd300 = val;

    *(unsigned short *)((char *)&data_ov002_022cd300 + 0x16) |= 2;
    *(unsigned char *)((char *)&data_ov002_022cd300 + 8) = 0;

    for (a = 0; a < 2; a++) {
        for (b = 0; b <= 4; b++) {
            if (func_ov002_02270ca8(a, b, 0) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
