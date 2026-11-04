extern int func_020670f4(int c);

void func_02067024(unsigned char *src, int len, unsigned char *dst) {
    int i = 0;
    int j;
    unsigned char in[3];
    unsigned char out[4];
    while (i < len) {
        for (j = 0; j <= 2; j++) {
            if (i < len) in[j] = *src++;
            else in[j] = 0;
            i++;
        }
        out[0] = in[0] >> 2;
        out[1] = ((in[0] & 3) << 4) + (in[1] >> 4);
        out[2] = ((in[1] & 15) << 2) + (in[2] >> 6);
        out[3] = in[2] & 63;
        for (j = 0; j <= 3; j++) {
            *dst++ = func_020670f4(out[j]);
        }
    }
    *dst = 0;
}

