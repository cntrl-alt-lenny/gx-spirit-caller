typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern char data_021a63d0[];
extern u32 data_0219ef1c;
extern char data_0219f178[];
extern char data_0219ef76[];
extern u16 data_0219eec8;
extern u16 func_02073fc8(u8 *p, u32 n, u32 sum);
extern u32 func_02073fac(u32 arg);
extern void func_020730fc(void *header, u32 length, void *data, u32 size, u32 address, u8 protocol);
#define SWAP(x) (((x) >> 8) | ((x) << 8))
void func_02072c78(void *data, u32 size, char *ctx, u32 flags) {
    char *p;
    u32 length;
    u16 n;
    int checksum;
    if (*(u8 *)(ctx + 8) == 0) return;
    if (*(void **)(data_021a63d0 + 4) == data_0219f178) p = data_0219ef76;
    else p = *(char **)(ctx + 0x4c) + 0x22;
    if (flags & 2) length = 0x18;
    else length = 0x14;
    n = (u16)(data_0219ef1c >> 16);
    *(u16 *)(p - 12) = SWAP(n);
    n = (u16)data_0219ef1c;
    *(u16 *)(p - 10) = SWAP(n);
    n = (u16)(*(u32 *)(ctx + 0x1c) >> 16);
    *(u16 *)(p - 8) = SWAP(n);
    n = (u16)*(u32 *)(ctx + 0x1c);
    *(u16 *)(p - 6) = SWAP(n);
    *(u16 *)(p - 4) = 0x600;
    n = length + size;
    *(u16 *)(p - 2) = SWAP(n);
    n = *(u16 *)(ctx + 0xa);
    *(u16 *)(p + 0) = SWAP(n);
    n = *(u16 *)(ctx + 0x18);
    *(u16 *)(p + 2) = SWAP(n);
    n = (u16)(*(u32 *)(ctx + 0x28) >> 16);
    *(u16 *)(p + 4) = SWAP(n);
    n = (u16)*(u32 *)(ctx + 0x28);
    *(u16 *)(p + 6) = SWAP(n);
    n = (u16)(*(u32 *)(ctx + 0x24) >> 16);
    *(u16 *)(p + 8) = SWAP(n);
    n = (u16)*(u32 *)(ctx + 0x24);
    *(u16 *)(p + 10) = SWAP(n);
    *(u8 *)(p + 12) = (length >> 2) << 4;
    *(u8 *)(p + 13) = flags;
    n = *(u32 *)(ctx + 0x3c) - *(u32 *)(ctx + 0x44);
    *(u16 *)(p + 14) = SWAP(n);
    *(u16 *)(p + 16) = 0;
    *(u16 *)(p + 18) = 0;
    if (flags & 2) {
        n = (u16)((data_0219eec8 + 0x2040000U) >> 16);
        *(u16 *)(p + 20) = SWAP(n);
        n = (u16)(data_0219eec8 + 0x2040000U);
        *(u16 *)(p + 22) = SWAP(n);
    }
    checksum = func_02073fc8((u8 *)p - 12, length + 12, 0);
    checksum = func_02073fc8(data, size, checksum);
    checksum = func_02073fac((u16)checksum);
    *(u16 *)(p + 16) = SWAP(checksum);
    func_020730fc(p, length, data, size, *(u32 *)(ctx + 0x1c), 6);
    *(u32 *)(ctx + 0x28) += size;
    if (flags & 3) ++*(u32 *)(ctx + 0x28);
}

