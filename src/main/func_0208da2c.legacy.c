typedef unsigned char u8;
typedef unsigned short u16;
extern u16 data_021a6304[];
extern void func_0208dce4(int mask);
void func_0208da2c(int v)
{
    u16 t = data_021a6304[1];
    u16 c = data_021a6304[0];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[1] = v;
    switch (v) {
    case 8:
        *(u8 *)0x04000243 = 0x81;
        break;
    case 12:
        *(u8 *)0x04000243 = 0x89;
    case 4:
        *(u8 *)0x04000242 = 0x81;
        break;
    case 14:
        *(u8 *)0x04000243 = 0x91;
    case 6:
        *(u8 *)0x04000242 = 0x89;
    case 2:
        *(u8 *)0x04000241 = 0x81;
        break;
    case 15:
        *(u8 *)0x04000243 = 0x99;
    case 7:
        *(u8 *)0x04000242 = 0x91;
    case 3:
        *(u8 *)0x04000241 = 0x89;
    case 1:
        *(u8 *)0x04000240 = 0x81;
        break;
    case 11:
        *(u8 *)0x04000240 = 0x81;
        *(u8 *)0x04000241 = 0x89;
        *(u8 *)0x04000243 = 0x91;
        break;
    case 13:
        *(u8 *)0x04000243 = 0x91;
    case 5:
        *(u8 *)0x04000240 = 0x81;
        *(u8 *)0x04000242 = 0x89;
        break;
    case 9:
        *(u8 *)0x04000240 = 0x81;
        *(u8 *)0x04000243 = 0x89;
        break;
    case 10:
        *(u8 *)0x04000241 = 0x81;
        *(u8 *)0x04000243 = 0x89;
        break;
    case 0x70:
        *(u8 *)0x04000246 = 0x99;
    case 0x30:
        *(u8 *)0x04000245 = 0x91;
    case 0x10:
        *(u8 *)0x04000244 = 0x81;
        break;
    case 0x50:
        *(u8 *)0x04000246 = 0x91;
        *(u8 *)0x04000244 = 0x81;
        break;
    case 0x60:
        *(u8 *)0x04000246 = 0x89;
    case 0x20:
        *(u8 *)0x04000245 = 0x81;
        break;
    case 0x40:
        *(u8 *)0x04000246 = 0x81;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
