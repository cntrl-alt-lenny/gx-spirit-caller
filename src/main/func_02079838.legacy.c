extern int func_02079e20(short *arr, int n);
extern void func_020945f4(void *dst, int value, int n);
extern void func_02079ac4(unsigned short *arr, unsigned int carry, int i, int count);

void func_02079838(unsigned short *out, unsigned short *in, int capacity)
{
    int count;
    int i, j, k;
    unsigned int product;
    count = func_02079e20((short *)in, capacity);
    if (count * 2 < capacity)
        func_020945f4(out + count * 2, 0, (capacity - count * 2) * 2);
    i = 0;
    if (count > 0) {
        k = i;
        do {
            if (k >= capacity) break;
            product = in[i] * in[i];
            out[k] = product;
            if (k == capacity - 1) break;
            out[k + 1] = product >> 16;
            i++;
            k += 2;
        } while (i < count);
    }
    for (i = 0; i < count; i++) {
        for (j = i + 1; j < count && i + j < capacity; j++) {
            product = in[j] * in[i];
            if (product <= 0x7fff8000) {
                func_02079ac4(out, product * 2, i + j, capacity);
            } else {
                func_02079ac4(out, product, i + j, capacity);
                func_02079ac4(out, product, i + j, capacity);
            }
        }
    }
}
