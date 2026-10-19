typedef unsigned short u16;
extern void func_ov020_021ada74(int rgb555, int *h_out, int *s_out, int *v_out);
extern u16 func_ov020_021adb8c(int h, int s, int v);
void func_ov020_021add24(u16 *src, u16 *dst, unsigned int packed) {
    int h, s, v;
    int i;
    int count = (u16)packed;
    u16 offset = packed >> 16;
    for (i = 0; i < count; i++) {
        func_ov020_021ada74(*src++, &h, &s, &v);
        h = (h + offset) % 360;
        *dst++ = func_ov020_021adb8c(h, s, v);
    }
}
