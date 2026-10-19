typedef unsigned short u16;
typedef struct { unsigned char pad[0x38]; int phase; } State;
extern State data_021040ac;
int func_ov005_021b0a10(int unused, u16 *dst, const u16 *src, int count)
{
    int phase = data_021040ac.phase & 0x3f;
    int i;
    for (i = 0; i < count; i++) {

        u16 r, g, b;
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



