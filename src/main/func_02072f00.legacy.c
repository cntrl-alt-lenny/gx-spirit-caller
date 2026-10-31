typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern u32 data_0219ef1c;
extern unsigned short func_02073fc8(unsigned char *p, unsigned int n, unsigned int sum);
extern unsigned int func_02073fac(unsigned int arg);
extern void func_020730fc(void *header, u32 length, void *data, u32 size, u32 address, u8 protocol);
#define SWAP(x) (((x) >> 8) | ((x) << 8))
void func_02072f00(u8 *data, u32 size, void *ctx) {
    u8 *obj = *(u8 **)((u8 *)ctx + 0x4c);
    u8 *p = obj + 0x22;
    u16 n;
    int sum;
    n = (u16)(data_0219ef1c >> 16);
    *(u16 *)(p - 12) = SWAP(n);
    n = (u16)data_0219ef1c;
    *(u16 *)(p - 10) = SWAP(n);
    n = (u16)(*(u32 *)((u8 *)ctx + 0x1c) >> 16);
    *(u16 *)(p - 8) = SWAP(n);
    n = (u16)*(u32 *)((u8 *)ctx + 0x1c);
    *(u16 *)(p - 6) = SWAP(n);
    *(u16 *)(p - 4) = 0x1100;
    n = size + 8;
    *(u16 *)(p + 4) = SWAP(n);
    *(u16 *)(p - 2) = *(u16 *)(p + 4);
    n = *(u16 *)((u8 *)ctx + 0x18);
    *(u16 *)(p + 2) = SWAP(n);
    n = *(u16 *)((u8 *)ctx + 0xa);
    *(u16 *)((u8 *)obj + 0x22) = SWAP(n);
    *(u16 *)(p + 6) = 0;
    sum = func_02073fc8(p - 12, 20, 0);
    sum = func_02073fc8(data, size, sum);
    sum = func_02073fac((u16)sum);
    *(u16 *)(p + 6) = SWAP(sum);
    func_020730fc(p, 8, data, size, *(u32 *)((u8 *)ctx + 0x1c), 0x11);
}

