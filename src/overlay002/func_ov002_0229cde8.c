extern void func_ov002_0229cdb8(void *a, char *s);

void func_ov002_0229cde8(void *a, int v)
{
    char buf[16];
    int i = 16;
    buf[--i] = 0;
    do {
        buf[--i] = '0' + v % 10;
        v /= 10;
    } while (v != 0);
    func_ov002_0229cdb8(a, &buf[i]);
}
