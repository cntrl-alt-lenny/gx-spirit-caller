void func_02001bc8(unsigned short *out, unsigned short c1, unsigned short c2) {
    int w[2][3];
    int mix[3];
    int i;
    int j;

    w[0][0] = c2 & 0x1f;
    w[0][1] = (c2 & 0x3e0) >> 5;
    w[0][2] = (c2 & 0x7c00) >> 10;
    w[1][0] = c1 & 0x1f;
    w[1][1] = (c1 & 0x3e0) >> 5;
    w[1][2] = (c1 & 0x7c00) >> 10;
    out[0] = c2;
    for (i = 1; i < 15; i++) {
        for (j = 0; j < 3; j++) {
            mix[j] = ((16 - i) * w[0][j] + i * w[1][j] + 8) / 16;
        }
        out[i] = mix[0] | (mix[1] << 5) | (mix[2] << 10);
    }
    out[i] = c1;
}
