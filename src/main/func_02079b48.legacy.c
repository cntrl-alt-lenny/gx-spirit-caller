void func_02079b48(unsigned short *out, unsigned short *in, unsigned int borrow, int count)
{
    int i = 0;
    for (; i < count; i++) {
        unsigned int value = in[i] - borrow;
        borrow = (value >> 16) & 1;
        out[i] = value;
        if (!borrow) break;
    }
    if (out == in) return;
    for (++i; i < count; i++) out[i] = in[i];
}
