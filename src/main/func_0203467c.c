typedef unsigned int u32;
typedef unsigned long long u64;

extern void *func_02034184(void);
extern void *func_02031d80(u32, u32, u32);
extern void func_02034754(void *, u32);
extern u64 func_02031c1c(void *, u32, u32, void (*)(void *), void (*)(void));
extern void func_02031d0c(void *);
extern int func_020345c0(void *);
extern void func_02034548(void *);
extern void func_02034574(void);

u64 func_0203467c(void)
{
    unsigned int address;
    u64 result;
    void *found;

    found = func_02034184();
    if (found != 0)
        return *(u64 *)((char *)found + 0x10);

    address = (unsigned int)func_02031d80(0x48C, 0x200000, 0x05000000);
    if (address != 0) {
        func_02034754((void *)address, 0x48C);
        result = func_02031c1c((void *)address, 0x200000, 0x05000000,
                               func_02034548, func_02034574);
        if (result == 0 || func_020345c0((void *)address) < 0) {
            func_02031d0c((void *)address);
            result = 0;
        }
    } else {
        result = 0;
    }
    return result;
}
