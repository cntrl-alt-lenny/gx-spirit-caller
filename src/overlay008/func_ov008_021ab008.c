typedef struct { char pad[0x38]; int f38; } GlobalState;
extern GlobalState data_021040ac;
void func_ov008_021ab008(unsigned short *dst, const unsigned short *src, int count) {
    int i;
    int phase = data_021040ac.f38 & 0x3f;
    for (i = 0; i < count; i++) {
        unsigned short red, green, blue;

        if (phase < 32) {
            red = (*src & 31) + (31 - (*src & 31)) * phase / 32;
            green = ((*src >> 5) & 31) + (31 - ((*src >> 5) & 31)) * phase / 32;
            blue = ((*src >> 10) & 31) + (31 - ((*src >> 10) & 31)) * phase / 32;
        } else {
            red = (*src & 31) + (31 - (*src & 31)) * (64 - phase) / 32;
            green = ((*src >> 5) & 31) + (31 - ((*src >> 5) & 31)) * (64 - phase) / 32;
            blue = ((*src >> 10) & 31) + (31 - ((*src >> 10) & 31)) * (64 - phase) / 32;
        }
        if (red > 31) red = 31;
        if (green > 31) green = 31;
        if (blue > 31) blue = 31;
        *dst++ = red | (green << 5) | (blue << 10);
        src++;
    }
}

