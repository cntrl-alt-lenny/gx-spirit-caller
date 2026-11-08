typedef unsigned char u8;
typedef unsigned short u16;
extern u16 data_021a6304[];
extern void func_0208dce4(int mask);
void func_0208d204(int v)
{
    u16 c = data_021a6304[0];
    u16 t = data_021a6304[3];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[3] = v;
    switch (v) {
    case 12:
        *(u8 *)0x04000243 = 0x8a;
        *(u8 *)0x04000242 = 0x82;
        break;
    case 4:
        *(u8 *)0x04000242 = 0x82;
        break;
    case 8:
        *(u8 *)0x04000243 = 0x82;
        break;
    case 0:
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
