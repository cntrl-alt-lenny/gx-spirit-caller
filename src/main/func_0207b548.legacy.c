typedef struct { unsigned char pad[0x2260]; int state; unsigned char pad2264[0x1c]; unsigned short f2280; } GxState;
extern GxState *data_021a088c;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
unsigned int func_0207b548(unsigned int flags)
{
    int state = OS_DisableIrq();
    GxState *ctx = data_021a088c;
    unsigned int mask = 0;
    unsigned int old = *(unsigned int *)((char *)ctx+0x2264);
    if (!ctx) { OS_RestoreIrq(state); return 0; }
    if (flags & 0x8000) {
        mask |= 0x3ffe;
        if (!(flags & 0x3ffe)) flags |= 0xa082;
    }
    if (flags & 0x20000) mask |= 0x10000;
    if (flags & 0x80000) mask |= 0x40000;
    if (flags & 0x200000) mask |= 0x100000;
    if (flags & 0x800000) mask |= 0x400000;
    *(unsigned int *)((char *)ctx+0x2264) = flags | (old & ~mask);
    OS_RestoreIrq(state);
    return old;
}
