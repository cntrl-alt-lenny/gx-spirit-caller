extern int func_020602c4(int src, char *key, char *buf, int size);
extern int func_020aac84(int a0, int a1, ...);
extern int func_0205fe18(int a, int b, int c, int d, int e);
extern char data_021011bc[];
extern char data_021011c4[];

int func_0205fd94(int a0, int a1, int a2, int src) {
    char buf[0x40];
    int v[3];
    int n;

    n = func_020602c4(src, data_021011bc, buf, 0x40);
    if (n == 0) {
        return n;
    }
    n = func_020aac84((int)buf, (int)data_021011c4, &v[0], &v[1], &v[2]);
    if (n != 3) {
        return n;
    }
    return func_0205fe18(a0, (int)v, a1, 2, 0);
}
