struct Ov016FadeState { int pad[14]; int phase; };
extern struct Ov016FadeState data_021040ac;
int func_ov016_021b5424(int i, unsigned short *dst, const unsigned short *src, int count) {
    int phase = data_021040ac.phase & 63;
    for (i = 0; i < count; i++) {
        unsigned short r, g, b;

        if (phase < 32) {
            r = ((*src) & 31) + (31 - ((*src) & 31)) * phase / 32;
            g = (((*src) >> 5) & 31) + (31 - (((*src) >> 5) & 31)) * phase / 32;
            b = (((*src) >> 10) & 31) + (31 - (((*src) >> 10) & 31)) * phase / 32;
        } else {
            r = ((*src) & 31) + (31 - ((*src) & 31)) * (64 - phase) / 32;
            g = (((*src) >> 5) & 31) + (31 - (((*src) >> 5) & 31)) * (64 - phase) / 32;
            b = (((*src) >> 10) & 31) + (31 - (((*src) >> 10) & 31)) * (64 - phase) / 32;
        }
        if (r > 31) r = 31;
        if (g > 31) g = 31;
        if (b > 31) b = 31;
        *dst++ = r | (g << 5) | (b << 10);
        src++;
    }
    return i;
}

