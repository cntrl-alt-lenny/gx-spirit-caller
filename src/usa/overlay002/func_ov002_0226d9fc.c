/* func_ov002_0226d9fc: same D016C-style global bit-pack header as the
 * shipped func_ov002_0226de20 sibling, then a nested loop a=0,1 x b=0..4
 * calling func_ov002_02270bb8(a,b,0); return 1 on the first nonzero
 * result, else 0. */
extern int data_ov002_022cd220;
extern int func_ov002_02270bb8(int a, int b, int c);

int func_ov002_0226d9fc(int player, int arg1) {
    int val = data_ov002_022cd220;
    int a, b;

    val = (val & ~1) | (player & 1);
    val &= 0xff8000ff;
    val |= ((unsigned int)arg1 << 17) >> 9;
    data_ov002_022cd220 = val;

    *(unsigned short *)((char *)&data_ov002_022cd220 + 0x16) |= 2;
    *(unsigned char *)((char *)&data_ov002_022cd220 + 8) = 0;

    for (a = 0; a < 2; a++) {
        for (b = 0; b <= 4; b++) {
            if (func_ov002_02270bb8(a, b, 0) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
