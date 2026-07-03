extern int func_ov002_0228ccb0(int a, int b, int c);
extern int func_ov002_0228cf9c(int a, int b, int c);

int func_ov002_0227d760(int a, int b, int c) {
    int n = 1 - a;
    int r = func_ov002_0228ccb0(n, c, 0);
    if (r >= 0)
        return (unsigned short)((n & 0xff) | ((unsigned char)r << 8));
    r = func_ov002_0228cf9c(a, c, 0);
    if (r < 0)
        return -1;
    return (unsigned short)((a & 0xff) | ((unsigned char)r << 8));
}
