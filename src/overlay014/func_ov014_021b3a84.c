typedef unsigned short u16;
typedef struct { int pad[14]; int frame; } State;
extern State data_021040ac;
int func_ov014_021b3a84(int unused, u16 *dst, const u16 *src, int count) {
    int phase = data_021040ac.frame & 63;
    int i;
    for (i = 0; i < count; i++) {

        u16 r, g, b;
        if (phase < 32) {
            int color = *src;
            r = color & 31;
            g = (color >> 5) & 31;
            b = (color >> 10) & 31;
            r = r + ((31 - r) * phase) / 32;
            g = g + ((31 - g) * phase) / 32;
            b = b + ((31 - b) * phase) / 32;
        } else {
            int color = *src;
            b = (color >> 10) & 31;
            g = (color >> 5) & 31;
            r = color & 31;
            r = r + ((31 - r) * (64 - phase)) / 32;
            g = g + ((31 - g) * (64 - phase)) / 32;
            b = b + ((31 - b) * (64 - phase)) / 32;
        }
        if (r > 31) r = 31;
        if (g > 31) g = 31;
        if (b > 31) b = 31;
        *dst++ = r | (g << 5) | (b << 10);
        src++;
    }
    return i;
}







