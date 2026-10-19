extern void func_ov022_021ab4b0(int rgb555, int *h_out, int *s_out, int *v_out);
extern unsigned short func_ov022_021ab5c8(int h, int s, int v);
void func_ov022_021ab804(unsigned short *src, unsigned short *dst, unsigned int packed) {
    int i = 0;
    int count = (unsigned short)packed;
    int amount = (unsigned short)(packed >> 16);
    int adjust = amount - 0x100;
    int h, s, v;
    for (; i < count; i++) {
        func_ov022_021ab4b0(*src, &h, &s, &v);
        v += adjust;
        v = v <= 0 ? 0 : v;
        v = v > 255 ? 255 : v;
        *dst++ = func_ov022_021ab5c8(h, s, v);
        src++;
    }
}




