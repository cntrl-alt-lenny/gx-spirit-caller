extern int func_02079e20(short *arr, int n);
extern void *func_020945f4(void *dst, int value, int n);
void func_02079bbc(unsigned short *out, unsigned short *a, unsigned short *b, int capacity)
{
    int i;
    int carry;
    int count = func_02079e20((short *)a, capacity);
    int other = func_02079e20((short *)b, capacity);
    if (count < other) count = other;
    if (count != capacity) count++;
    carry = 0;
    i = 0;
    while (i < count || (i < capacity && carry != 0)) {
        int value = carry + (a[i] - b[i]);
        out[i++] = value;
        carry = value >> 16;
    }
    if (out == a || out == b) return;
    func_020945f4(out+i, 0, (capacity-i)*2);
}
