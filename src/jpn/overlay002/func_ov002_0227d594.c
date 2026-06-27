

typedef unsigned char  u8;
typedef unsigned short u16;

extern int func_ov002_0228ccb0(int a, int b, int c);
extern int func_ov002_0228cf9c(int a, int b, int c);

int func_ov002_0227d594(int a, int b, int c)
{
    int r;
    int alt = 1 - a;
    r = func_ov002_0228ccb0(alt, c, 0);
    if (r >= 0)
        return (u16)((u8)alt | ((u8)r << 8));
    r = func_ov002_0228cf9c(a, c, 1);
    if (r < 0)
        return -1;
    return (u16)((u8)a | ((u8)r << 8));
}
