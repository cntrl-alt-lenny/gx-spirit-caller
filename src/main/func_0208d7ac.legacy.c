typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern u16 data_021a6304[];
extern void func_0208dce4(int mask);
void func_0208d7ac(u16 v)
{
    u16 t = data_021a6304[7];
    u16 c = data_021a6304[0];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[7] = v;
    switch (v) {
    case 0:
        *(u32 *)0x04000000 &= ~0x40000000;
        break;
    case 0x10:
        *(u32 *)0x04000000 |= 0x40000000;
        *(u8 *)0x04000244 = 0x84;
        break;
    case 0x40:
        *(u32 *)0x04000000 |= 0x40000000;
        *(u8 *)0x04000246 = 0x8c;
        break;
    case 0x60:
        *(u8 *)0x04000246 = 0x8c;
    case 0x20:
        *(u8 *)0x04000245 = 0x84;
        *(u32 *)0x04000000 |= 0x40000000;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}




