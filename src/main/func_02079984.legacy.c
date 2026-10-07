extern int func_02079e20(short *arr, int n);
extern void *func_020945f4(void *dst, int value, int n);
void func_02079984(unsigned short *out, unsigned short *in, unsigned int multiplier, int capacity)
{
    int i;
    unsigned int carry;
    int count = func_02079e20((short *)in, capacity);
    carry = 0;
    for (i = 0; i < count; i++) {
        unsigned int value = multiplier * in[i] + carry;
        out[i] = value;
        carry = value >> 16;
    }
    if (i < capacity) out[i++] = carry;
    func_020945f4(out + i, 0, (capacity-i) * 2);
}
