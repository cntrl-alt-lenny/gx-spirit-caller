void func_020827ec(int *a, int *b, int s, int flag)
{
    if (flag != 0) {
        a[0] += s;
        a[1] += s;
        a[2] += s;
    } else {
        a[0] += (s * b[0]) >> 12;
        a[1] += (s * b[1]) >> 12;
        a[2] += (s * b[2]) >> 12;
    }
}
