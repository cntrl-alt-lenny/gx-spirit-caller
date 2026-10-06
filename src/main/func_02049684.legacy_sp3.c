extern void *data_0219dc80;
extern int func_02047804(void);
extern int func_020438b8(int a, int b, char *buf, int size);
extern int func_02049038(int id, char *a, char *b);

int func_02049684(int a, int b) {
    char buf[0x100];
    int n;
    if (data_0219dc80 == 0 || func_02047804() == 0) {
        return 0;
    }
    n = func_020438b8(a, b, buf, 0xff);
    if (n == -1) {
        return 0;
    }
    buf[n] = 0;
    return func_02049038(-1, 0, buf) == 0;
}
