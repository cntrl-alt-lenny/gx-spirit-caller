typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u16 data_021a6304[];
extern void func_0208dce4(u16 v);

void func_0208d6f4(u16 v)
{
    u16 c = data_021a6304[0];
    u16 t = data_021a6304[8];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[8] = v;
    switch (v) {
    case 0x20:
        *(u32 *)0x04000000 |= 0x80000000;
        *(u8 *)0x04000245 = 0x85;
        break;
    case 0x40:
        *(u32 *)0x04000000 |= 0x80000000;
        *(u8 *)0x04000246 = 0x85;
        break;
    case 0:
        *(u32 *)0x04000000 &= ~0x80000000;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
