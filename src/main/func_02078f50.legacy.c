extern void *func_020945f4(void *dst, int value, int n);
void func_02078f50(unsigned short *out, unsigned char *in, int length, int capacity)
{
    func_020945f4(out, 0, capacity * 2);
    in += length - 1;
    while (length > 1) {
        *out++ = in[0] + (in[-1] << 8);
        length -= 2;
        in -= 2;
    }
    if (length > 0) *out = *in;
}
