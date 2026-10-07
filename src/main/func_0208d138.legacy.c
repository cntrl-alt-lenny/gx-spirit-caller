typedef unsigned char u8;
typedef unsigned short u16;

extern u16 data_021a6304[];
extern void func_0208dce4(u16 v);

void func_0208d138(u16 v)
{
    u16 c = data_021a6304[0];
    u16 t = data_021a6304[9];
    data_021a6304[0] = ~v & (c | t);
    data_021a6304[9] = v;
    switch (v) {
    case 0:
        break;
    case 4:
        *(u8 *)0x04000242 = 0x84;
        break;
    case 0x180:
        *(u8 *)0x04000249 = 0x81;
    case 0x80:
        *(u8 *)0x04000248 = 0x81;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
