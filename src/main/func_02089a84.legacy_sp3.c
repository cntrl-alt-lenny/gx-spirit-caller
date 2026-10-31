typedef unsigned int u32;
extern int func_02095de0(char *arr, int idx);
extern int func_02095e60(void *p);
extern void *func_020897fc(void *self, int size, int param3, int param4, int param5);
extern void func_02089b64(int a0, int a1, int a2, int a3);
extern int func_0208906c(u32 idx, void *dst, u32 n, int off);
extern void func_020928e8(void *addr, int len);
extern void func_02095e28(char *param0, int param1, int param2);

int func_02089a84(char *a, u32 b, u32 c, void *d)
{
    u32 size;
    u32 start;
    u32 end;
    u32 count;
    int *row;
    void *buf;
    if (func_02095de0(a, b) != 0) return 1;
    count = func_02095e60(a);
    row = (int *)(a + (*(int *)(a + 0x38) + b) * 4);

    start = row[15];
    if (b < count - 1) end = row[16];
    else end = *(u32 *)(a + 8);

    size = end - start;
    if (d == 0) return 0;
    buf = func_020897fc(d, size + 0x20, (int)func_02089b64, (int)a, b);
    if (buf == 0) return 0;
    if (size != func_0208906c(c, buf, size, start)) return 0;
    func_020928e8(buf, size);
    func_02095e28(a, b, (int)buf);
    return 1;
}




