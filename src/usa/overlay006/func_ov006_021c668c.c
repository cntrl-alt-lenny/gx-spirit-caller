/* func_ov006_021c668c: text-layout family (021c4768 shape) — palette 32, glyph
 * 0x459, emit centred at x = 128 - width/2. */
extern void *func_0208dcb4(void);
extern void  func_02001cec(void *p, int a, int b);
extern void  func_02001d48(int c);
extern void  func_02001d78(void *p, int a);
extern int   func_0202c06c(int id);
extern int   func_02005538(int g, int a, int b);
extern void  func_02004f3c(void *p, int g, void *r, int x, int e, int f);
struct Ov006Mode4 { int pad; unsigned chan : 3; };
extern struct Ov006Mode4 data_02104e6c;
int func_ov006_021c668c(char *obj) {
    void *q = func_0208dcb4();
    func_02001cec(obj + 8, 32, 3);
    func_02001d48(data_02104e6c.chan);
    func_02001d78(obj + 8, 5);
    {
        int g = func_0202c06c(0x459);
        func_02004f3c(obj + 8, g, (char *)q + 64, 128 - func_02005538(g, 12, 5) / 2, 5, 12);
    }
    func_02001d78(obj + 8, -1);
    return 1;
}
