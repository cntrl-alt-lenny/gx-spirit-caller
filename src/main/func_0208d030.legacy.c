typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern u16 data_021a6304[];
extern void func_0208dce4(int mask);

void func_0208d030(u16 v)
{
    u16 c = data_021a6304[0];
    u16 t = data_021a6304[11];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[11] = v;
    switch (v) {
    case 0x80:
        *(volatile u32 *)0x04001000 |= 0x40000000;
        *(volatile u8 *)0x04000248 = 0x82;
        break;
    case 0:
        *(volatile u32 *)0x04001000 &= ~0x40000000;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
