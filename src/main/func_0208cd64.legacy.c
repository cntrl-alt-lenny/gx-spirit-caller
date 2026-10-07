typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u16 data_021a62fc;
extern void func_02093a44(u16 a, u16 b);

u32 func_0208cd64(u16 *p)
{
    u32 v = *p;
    *p = 0;
    if (v & 0x1) {
        *(u8 *)0x04000240 = 0;
    }
    if (v & 0x2) {
        *(u8 *)0x04000241 = 0;
    }
    if (v & 0x4) {
        *(u8 *)0x04000242 = 0;
    }
    if (v & 0x8) {
        *(u8 *)0x04000243 = 0;
    }
    if (v & 0x10) {
        *(u8 *)0x04000244 = 0;
    }
    if (v & 0x20) {
        *(u8 *)0x04000245 = 0;
    }
    if (v & 0x40) {
        *(u8 *)0x04000246 = 0;
    }
    if (v & 0x80) {
        *(u8 *)0x04000248 = 0;
    }
    if (v & 0x100) {
        *(u8 *)0x04000249 = 0;
    }
    func_02093a44(v, data_021a62fc);
    return v;
}
