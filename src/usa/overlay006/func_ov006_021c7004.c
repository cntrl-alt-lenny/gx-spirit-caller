struct Ov006Mode4 { int pad; unsigned chan : 3; };
extern struct Ov006Mode4 data_02104e6c;
extern void func_02001cec(void *p, int a, int b);
extern void func_02001d48(int c);
extern void func_02001d78(void *p, int a);
extern int  func_0200506c(void *p, int g, void *r, int x, int e, int f);
extern int  func_02005538(int g, int a, int b);
extern int  func_0202c06c(int id);
extern int  func_0202c3f8(void);
extern int  func_0208ddac(void);
extern int  func_02094410(int a, int b, int c);

int func_ov006_021c7004(char *obj) {
    int q = func_0208ddac();
    int g;
    int w;
    func_02094410(0, q + 0x20, 0xc00);
    func_02001cec(obj + 4, 0x20, 3);
    func_02001d48(data_02104e6c.chan);
    func_02001d78(obj + 4, 5);
    if (*(int *)(obj + 0x38) == 0) {
        g = func_0202c06c(0x1cd);
    } else {
        g = func_0202c3f8();
    }
    w = func_02005538(g, 12, 5);
    func_0200506c(obj + 4, g, q + 0x20, 0x80 - w / 2, 6, 12);
    func_02001d78(obj + 4, -1);
    return 1;
}
