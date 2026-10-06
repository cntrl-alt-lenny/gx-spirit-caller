extern int func_02079e20(short *arr, int n);
extern void *func_020945f4(void *dst, int value, int n);
void func_02079d30(unsigned short *out, unsigned short *a, unsigned short *b, int capacity)
{
    int i;
    unsigned int carry;
    int count = func_02079e20((short *)a, capacity);
    int other = func_02079e20((short *)b, capacity);
    if (count < other) count = other;
    if (count != capacity) count++;
    carry = 0;
    for (i = 0; i < count; i++) {
        unsigned int value = carry + (a[i] + b[i]);
        out[i] = value;
        carry = value >> 16;
    }
    if (out == a || out == b) return;
    func_020945f4(out+i, 0, (capacity-i)*2);
}
