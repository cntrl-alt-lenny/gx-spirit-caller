extern void *func_020498f0(void);
extern void func_020945f4(void *, int, unsigned int);
extern unsigned char data_0219dc94[];

struct State {
    unsigned char pad0[0xe];
    unsigned char count;
    unsigned char pad1[0x2c1];
    unsigned char entries[32];
    unsigned int mask;
};

int func_0204f8f0(unsigned char **out)
{
    int i;
    if (!func_020498f0()) return 0;
    func_020945f4(data_0219dc94, 0, 0x20);
    for (i = 0; i <= ((struct State *)func_020498f0())->count; i++) {
        if (!(((struct State *)func_020498f0())->mask &
              (1 << ((struct State *)func_020498f0())->entries[i]))) break;
        data_0219dc94[i] = ((struct State *)func_020498f0())->entries[i];
    }
    *out = data_0219dc94;
    return ((struct State *)func_020498f0())->count + 1;
}
