extern unsigned short data_ov004_02200f18[];

int func_ov004_021db874(unsigned char *src, unsigned short *dst)
{
    int n = 0;
    int i = n;

    while (src[i] != 0) {
        unsigned int c = src[i];
        unsigned char *p = src + i;

        if (c < 0x80) {
            dst[n++] = c;
        } else if (c >= 0xa0 && c <= 0xdf) {
            dst[n++] = ((c - 0x40) & 0xff) | 0xff00;
        } else if (c <= 0xfc && p[1] >= 0x40 && p[1] <= 0xfc) {
            int t = p[1];
            int idx;
            unsigned short u = 0;
            int s = c;
            if (s >= 0xe0) {
                idx = (s - 0xc1) * 0xbc;
            } else {
                idx = (s - 0x81) * 0xbc;
            }
            if (t >= 0x80) {
                idx += t - 0x41;
            } else {
                idx += t - 0x40;
            }
            if ((int)idx < 0x2c10) {
                u = data_ov004_02200f18[idx];
            }
            if (u == 0) {
                u = 0x3f;
            }
            dst[n++] = u;
            i++;
        } else {
            dst[n++] = 0x3f;
        }
        i++;
    }
    dst[n] = 0;
    return n + 1;
}
