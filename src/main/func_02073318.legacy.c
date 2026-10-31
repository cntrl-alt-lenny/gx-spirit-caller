typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern u32 data_0219ef1c;
extern u8 data_02101eb8[];
extern u8 data_0219ef2c[];
extern int func_02073f84(int a0, int a1);
extern void func_02073450(void *a0, void *a1, int a2, int a3, int a4, unsigned short a5);
extern int func_02073e54(unsigned int arg);
extern void func_02094688(void *src, void *dst, int n);
extern void func_02073ac0(void *a, void *b, unsigned char *packet, unsigned int size, void *extra, unsigned int extra_size);
/* The IRQ primitive returns the prior mask in r0, which this caller uses. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
#define SWAP(x) (((x) >> 8) | ((x) << 8))
void func_02073318(void *header, u32 prefix, void *data, u32 length, u32 address, u32 offset) {
    u8 *p = header;
    u16 n;
    int mask;
    n = prefix + 0x14 + length;
    *(u16 *)(p - 18) = SWAP(n);
    n = offset;
    *(u16 *)(p - 14) = SWAP(n);
    *(u16 *)(p - 10) = 0;
    mask = func_02073f84((int)(p - 0x14), 0x14);
    *(u16 *)(p - 10) = SWAP(mask);
    if (address != 0x7f000001 && address != data_0219ef1c) {
        func_02073450(p - 0x14, (void *)(prefix + 0x14), (int)data, length, address, 0x800);
    }
    if (address != 0x7f000001 && address != data_0219ef1c) {
        if (func_02073e54(address) == 0) return;
    }
    func_02094688(data_02101eb8, p - 0x1c, 8);
    mask = OS_DisableIrq();
    func_02073ac0(data_0219ef2c, data_0219ef2c, p - 0x1c, prefix + 0x1c, data, length);
    OS_RestoreIrq(mask);
}
