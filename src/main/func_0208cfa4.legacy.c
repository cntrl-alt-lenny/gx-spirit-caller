typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u16 data_021a6304[];
extern void func_0208dce4(int mask);

void func_0208cfa4(u16 v)
{
    u16 c = data_021a6304[0];
    u16 t = data_021a6304[12];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[12] = v;
    switch (v) {
    case 0x100:
        *(u32 *)0x04001000 |= 0x80000000;
        *(u8 *)0x04000249 = 0x83;
        break;
    case 0:
        *(u32 *)0x04001000 &= ~0x80000000;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
