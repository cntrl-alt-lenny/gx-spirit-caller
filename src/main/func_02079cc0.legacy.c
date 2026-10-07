void func_02079cc0(unsigned short *out, unsigned short *in, unsigned int carry, int count)
{
    int i = 0;
    for (; i < count; i++) {
        carry += in[i];
        out[i] = carry;
        carry >>= 16;
        if (carry == 0) break;
    }
    if (out == in) return;
    for (++i; i < count; i++) out[i] = in[i];
}
