extern int data_ov002_022cd220;
extern int func_ov002_0227539c(int player, int i, int c);

int func_ov002_0226de20(int player, int arg1) {
    int val = data_ov002_022cd220;
    int i;

    val = (val & ~1) | (player & 1);
    val &= 0xff8000ff;
    val |= ((unsigned int)arg1 << 17) >> 9;
    data_ov002_022cd220 = val;

    *(unsigned short *)((char *)&data_ov002_022cd220 + 0x16) |= 2;
    *(unsigned char *)((char *)&data_ov002_022cd220 + 8) = 0;

    for (i = 0; i <= 4; i++) {
        if (func_ov002_0227539c(player, i, 0) != 0) {
            return 1;
        }
    }
    return 0;
}
