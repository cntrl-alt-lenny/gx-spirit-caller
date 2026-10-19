typedef unsigned int u32;
extern unsigned int func_02089024(unsigned int idx);
extern void func_02089008(int idx, int arg);
extern int func_0208906c(u32 idx, void *dst, u32 n, int off);
extern void *func_020893f0(void);
extern void *func_020897fc(void *self, int size, int param3, int param4, int param5);
extern int func_02089bb4(int a, int unused, int b, int c);
extern void func_02094688(const void *src, void *dst, u32 n);
extern void func_020945f4(void *dst, int value, u32 n);
extern void func_020928e8(void *ptr, u32 n);
extern unsigned char data_021a5804[];

void *func_02089cd8(u32 idx, void *pool, int flag)
{
    char *result;
    u32 size;
    u32 bytes;
    void *ctx;
    int readSize;
    result = (char *)func_02089024(idx);
    if (result == 0) {
        if (func_0208906c(idx, data_021a5804, 0x3c, 0) != 0x3c)
            return 0;
        bytes = *(u32 *)(data_021a5804 + 0x38) * 4;
        size = bytes * 2 + 0x3c;
        if (pool == 0)
            return 0;
        if (flag == 0)
            ctx = 0;
        else
            ctx = func_020893f0();
        result = func_020897fc(pool, size + 0x20, (int)func_02089bb4, (int)ctx, idx);
        if (result == 0)
            return 0;
        readSize = func_0208906c(idx, result, bytes + 0x3c, 0);
        if (readSize != bytes + 0x3c)
            return 0;
        func_02094688(result + 0x3c, result + 0x3c + *(u32 *)(result + 0x38) * 4, bytes);
        func_020945f4(result + 0x3c, 0, bytes);
        func_020928e8(result, size);
        if (flag != 0)
            func_02089008(idx, (int)result);
    }
    return result;
}



