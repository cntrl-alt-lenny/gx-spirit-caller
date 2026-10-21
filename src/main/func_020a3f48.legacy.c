typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u8 tag; u8 count; u16 values[10]; } Input;
extern u8 *data_021a98fc, *data_021a98f8;
extern u16 data_021a98f0, data_021026f8, data_021026ec, data_021026f0, data_021026f4;
extern u16 *data_021026fc;
extern int data_02102700;
/* These assembly primitives use the ABI shown by their bodies. */
extern void Fill32(int, int, int);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_0209448c(int, int, int);
extern void func_02094688(const void *, void *, u32);
extern u16 func_0209e124(void);
extern u32 func_020a4180(void);
int func_020a3f48(u32 address, Input *input, u32 arg2, u32 arg3, u32 arg4) {
    u8 *p, *q;
    int saved, i;
    u16 *out;
    if (data_021a98fc != 0 && *(u16 *)(data_021a98fc + 0x1316) != 0)
        return 2;
    p = (u8 *)((address + 0x1f) & ~0x1f);
    q = (u8 *)(((u32)p + 0x1e1f) & ~0x1f);
    if (arg3 == 0x10000) arg3 = func_0209e124();
    saved = OS_DisableIrq();
    data_021a98f0 = arg4;
    data_021026f8 = 0xffff;
    data_021026ec = 5;
    data_021026f0 = 0x28;
    data_021026f4 = 0x28;
    data_02102700 = 1;
    data_021a98f8 = p;
    data_021a98fc = q;
    Fill32(0, (int)p, 0x1e00);
    func_0209448c(0, (int)q, 0x1340);
    out = (u16 *)(p + 0x530);
    for(i=0; i<input->count; i++) *out++ = input->values[i];
    out = (u16 *)(p + 0x538);
    i = 0;
    do {
        if (*data_021026fc == 0) break;
        *out++ = *data_021026fc++;
        i++;
    } while (i < 16);
    func_02094688(input, q + 0x1300, 0x16);
    if (input->count < 10) *(u16 *)(q + 0x1302 + input->count*2) = 0;
    *(u16 *)(p + 0x500) = 0x100;
    *(u16 *)(p + 0x502) = 8;
    *(u16 *)(p + 0x518) = 0;
    *(u16 *)(p + 0x51a) = 0;
    *(u16 *)(p + 0x52c) = 1;
    *(u8 **)(p + 0x504) = q + 0x400;
    *(u16 *)(p + 0xe) = 0;
    *(u16 *)(p + 0x12) = 0;
    *(u16 *)(p + 0x16) = 1;
    *(u16 *)(p + 0x14) = 0;
    *(u32 *)(p + 8) = arg2;
    *(u16 *)(p + 0xc) = arg3;
    *(u16 *)(p + 0x18) = func_020a4180() + 0xc8;
    *(u16 *)(p + 0x10) = 15;
    p[0x50c] = 0;
    p[0x50d] = 0;
    *(u16 *)(q + 0x1316) = 1;
    *(u32 *)(q + 0x131c) = 0;
    OS_RestoreIrq(saved);
    return 0;
}



