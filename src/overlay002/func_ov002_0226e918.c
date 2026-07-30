extern int data_ov002_022cd300;
extern int func_ov002_02270184(int player, int i, int c);

int func_ov002_0226e918(int arg0, int arg1) {
    int val = data_ov002_022cd300;
    int player;
    int i;

    val = (val & ~1) | (arg0 & 1);
    val &= 0xff8000ff;
    val |= ((unsigned int)arg1 << 17) >> 9;
    data_ov002_022cd300 = val;
    *(unsigned short *)((char *)&data_ov002_022cd300 + 6) = (unsigned short)arg1;

    *(unsigned short *)((char *)&data_ov002_022cd300 + 0x16) &= ~2;
    *(unsigned char *)((char *)&data_ov002_022cd300 + 8) = 0;

    for (player = 0; player < 2; player++) {
        for (i = 0; i <= 4; i++) {
            if (func_ov002_02270184(player, i, 0) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
