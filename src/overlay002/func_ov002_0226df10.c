extern int data_ov002_022cd300;
extern int func_ov002_0227548c(int player, int i, int c);

int func_ov002_0226df10(int player, int arg1) {
    int val = data_ov002_022cd300;
    int i;

    val = (val & ~1) | (player & 1);
    val &= 0xff8000ff;
    val |= ((unsigned int)arg1 << 17) >> 9;
    data_ov002_022cd300 = val;

    *(unsigned short *)((char *)&data_ov002_022cd300 + 0x16) |= 2;
    *(unsigned char *)((char *)&data_ov002_022cd300 + 8) = 0;

    for (i = 0; i <= 4; i++) {
        if (func_ov002_0227548c(player, i, 0) != 0) {
            return 1;
        }
    }
    return 0;
}
