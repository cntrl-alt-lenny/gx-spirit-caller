typedef unsigned short u16;
typedef unsigned int u32;

void func_0208e5ec(int a0, int a1, short a2, int a3, int a4)
{
    int v = a0 | (a1 << 16) | (a3 << 24);
    if (a4 != 0) {
        v |= 0x8000;
    }
    *(volatile u32 *)0x04000350 = v;
    *(volatile short *)0x04000354 = a2;
}
