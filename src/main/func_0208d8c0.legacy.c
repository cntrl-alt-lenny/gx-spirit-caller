typedef unsigned char u8;
typedef unsigned short u16;
extern u16 data_021a6304[];
extern void func_0208dce4(int mask);
void func_0208d8c0(u16 v)
{
    data_021a6304[0] = ~v & (data_021a6304[0] | data_021a6304[2]);
    data_021a6304[2] = v;
    switch (v) {
    case 0:
        break;
    case 3:
        *(u8 *)0x04000241 = 0x8a;
    case 1:
        *(u8 *)0x04000240 = 0x82;
        break;
    case 2:
        *(u8 *)0x04000241 = 0x82;
        break;
    case 0x70:
        *(u8 *)0x04000246 = 0x9a;
    case 0x30:
        *(u8 *)0x04000245 = 0x92;
    case 0x10:
        *(u8 *)0x04000244 = 0x82;
        break;
    case 0x50:
        *(u8 *)0x04000246 = 0x92;
        *(u8 *)0x04000244 = 0x82;
        break;
    case 0x60:
        *(u8 *)0x04000246 = 0x8a;
    case 0x20:
        *(u8 *)0x04000245 = 0x82;
        break;
    case 0x40:
        *(u8 *)0x04000246 = 0x82;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}




