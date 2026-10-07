typedef unsigned char u8;
typedef unsigned short u16;

extern u16 data_021a6304[];
extern void func_0208dce4(u16 v);

void func_0208d0bc(u16 v)
{
    u16 c = data_021a6304[0];
    u16 t = data_021a6304[10];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[10] = v;
    switch (v) {
    case 0:
        break;
    case 0x100:
        *(u8 *)0x04000249 = 0x82;
        break;
    case 8:
        *(u8 *)0x04000243 = 0x84;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
