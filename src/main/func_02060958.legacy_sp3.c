/* The wrapper forwards these two arguments to func_02060cbc. */
extern void *func_02060c9c(void *s, void *name);
/* Original calls pass only the string, fewer than the four-argument C thunk. */
extern int func_020ace00();
extern int func_02060b84(int a, int b, int c);
extern void func_02060604(int index, int a, int b, int c, int d);
extern unsigned char *func_020ab0c4(unsigned char *haystack, const unsigned char *needle);
extern unsigned char data_021013b4[], data_021013b8[], data_021013bc[];
extern unsigned char data_021013c0[], data_021013c8[], data_021013d0[], data_021013d8[];

void func_02060958(unsigned char *s) {
    int index, n, d, c, b, a;
    unsigned char *p;
    a = func_020ace00(func_02060c9c(s, data_021013c0));
    b = func_020ace00(func_02060c9c(s, data_021013b8));
    c = func_020ace00(func_02060c9c(s, data_021013b4));
    d = func_020ace00(func_02060c9c(s, data_021013bc));
    index = func_02060b84(1, b, c);
    if (index == -1) return;
    n = func_020ace00(func_02060c9c(s, data_021013c8));
    p = func_020ab0c4(s, data_021013d0);
    if (p == 0) {
        p = data_021013d8;
        n = 0;
    } else {
        p += 6;
    }
    func_02060604(index, a, d, (int)p, n);
}

