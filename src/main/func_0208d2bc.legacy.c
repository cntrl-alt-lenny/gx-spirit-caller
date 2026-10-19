typedef unsigned char u8;
typedef unsigned short u16;
extern u16 data_021a6304[];
extern void func_0208dce4(int mask);

void func_0208d2bc(u16 v)
{
    u16 c = data_021a6304[0];
    u16 t = data_021a6304[6];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[6] = v;
    switch (v) {
    case 3:
        *(volatile u8 *)0x04000240 = 0x93;
    case 2:
        *(volatile u8 *)0x04000241 = 0x9b;
        *(volatile u16 *)0x04000060 |= 0x4000;
        break;
    case 12:
        *(volatile u8 *)0x04000242 = 0x93;
    case 8:
        *(volatile u8 *)0x04000243 = 0x9b;
        *(volatile u16 *)0x04000060 |= 0x4000;
        break;
    case 0:
        *(volatile u16 *)0x04000060 &= ~0x4000;
        break;
    case 1:
        *(volatile u8 *)0x04000240 = 0x9b;
        *(volatile u16 *)0x04000060 |= 0x4000;
        break;
    case 4:
        *(volatile u8 *)0x04000242 = 0x9b;
        *(volatile u16 *)0x04000060 |= 0x4000;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
