typedef unsigned char u8;
typedef unsigned short u16;

extern u16 data_021a6304[];
extern void func_0208dce4(u16 v);

void func_0208d3fc(u16 v)
{
    u16 c = data_021a6304[0];
    u16 t = data_021a6304[5];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[5] = v;
    switch (v) {
    case 0:
        break;
    case 0x40:
        *(u8 *)0x04000246 = 0x83;
        break;
    case 0x60:
        *(u8 *)0x04000246 = 0x8b;
    case 0x20:
        *(u8 *)0x04000245 = 0x83;
        break;
    case 0x70:
        *(u8 *)0x04000246 = 0x9b;
    case 0x30:
        *(u8 *)0x04000245 = 0x93;
    case 0x10:
        *(u8 *)0x04000244 = 0x83;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
