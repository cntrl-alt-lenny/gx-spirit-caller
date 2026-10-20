typedef unsigned char u8;
typedef unsigned short u16;
extern u16 data_021a6304[];
extern void func_0208dce4(int mask);
void func_0208d4f0(u16 v)
{
    u16 c = data_021a6304[0];
    u16 t = data_021a6304[4];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[4] = v;
    if (v == 0) {
        *(u16 *)0x04000060 &= 0xcffe;
    } else {
        *(u16 *)0x04000060 = (*(u16 *)0x04000060 & ~0x3000) | 1;
        switch (v) {
        case 5:
            *(u8 *)0x04000240 = 0x83;
            *(u8 *)0x04000242 = 0x8b;
            break;
        case 9:
            *(u8 *)0x04000240 = 0x83;
            *(u8 *)0x04000243 = 0x8b;
            break;
        case 10:
            *(u8 *)0x04000241 = 0x83;
            *(u8 *)0x04000243 = 0x8b;
            break;
        case 11:
            *(u8 *)0x04000240 = 0x83;
            *(u8 *)0x04000241 = 0x8b;
            *(u8 *)0x04000243 = 0x93;
            break;
        case 13:
            *(u8 *)0x04000240 = 0x83;
            *(u8 *)0x04000242 = 0x8b;
            *(u8 *)0x04000243 = 0x93;
            break;
        case 8:
            *(u8 *)0x04000243 = 0x83;
            break;
        case 12:
            *(u8 *)0x04000243 = 0x8b;
        case 4:
            *(u8 *)0x04000242 = 0x83;
            break;
        case 14:
            *(u8 *)0x04000243 = 0x93;
        case 6:
            *(u8 *)0x04000242 = 0x8b;
        case 2:
            *(u8 *)0x04000241 = 0x83;
            break;
        case 15:
            *(u8 *)0x04000243 = 0x9b;
        case 7:
            *(u8 *)0x04000242 = 0x93;
        case 3:
            *(u8 *)0x04000241 = 0x8b;
        case 1:
            *(u8 *)0x04000240 = 0x83;
            break;
        }
    }
    func_0208dce4(data_021a6304[0]);
}


