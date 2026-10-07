extern void func_0207f8c8(int *p, int x);
extern void func_0207e8b8(int *self);
extern int func_0207fd48(int *a, void *b);

void func_0207fd60(int *a, void *b, int c)
{
    a[12] = c;
    a[13] = -1;
    func_0207f8c8(a + 14, 1);
    func_0207e8b8(a);
    func_0207fd48(a, b);
}
