typedef unsigned short u16;
typedef unsigned int u32;

void func_0208e6ac(int a, int b, int c, short d)
{
    if (a != 0) {
        *(volatile short *)0x0400035c = d;
        *(volatile u16 *)0x04000060 = (*(volatile u16 *)0x04000060 & ~0x3f40) | ((c << 8) | (b << 6) | 0x80);
    } else {
        *(volatile u16 *)0x04000060 = *(volatile u16 *)0x04000060 & 0xcf7f;
    }
}

