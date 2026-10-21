extern void func_02094550(int *src, int *dst, unsigned int count);

void func_0208aa50(short *a, short *b, unsigned int size)
{
    unsigned int count = size >> 1;
    unsigned int i;
    for (i = 0; i < count; i++) {
        a[i] = (a[i] + b[i] + 1) >> 1;
    }
    func_02094550((int *)a, (int *)b, size);
}
