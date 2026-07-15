extern int func_020b3870(int num, int den);

void func_ov022_021ab4b0(int rgb555, int *h_out, int *s_out, int *v_out) {
    int r = (rgb555 & 0x1f) << 3;
    int g = (rgb555 & 0x3e0) >> 2;
    int b = (rgb555 & 0x7c00) >> 7;
    int minc, delta, s, h;

    *v_out = (((r > g) ? r : g) > b) ? ((r > g) ? r : g) : b;

    minc = (((r > g) ? g : r) > b) ? b : ((r > g) ? g : r);

    delta = *v_out - minc;
    s = (*v_out == 0) ? 0 : func_020b3870(delta * 255, *v_out);
    *s_out = s;

    h = 0;
    if (*s_out != 0) {
        if (r == *v_out) {
            h = func_020b3870((g - b) << 8, delta);
        } else if (g == *v_out) {
            h = func_020b3870((b - r) << 8, delta) + 0x200;
        } else if (b == *v_out) {
            h = func_020b3870((r - g) << 8, delta) + 0x400;
        }
        h = (h * 60) >> 8;
        if (h < 0) h += 360;
    }
    *h_out = h;
}
