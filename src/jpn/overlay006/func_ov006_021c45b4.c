/* func_ov006_021c45b4: text-layout family (021c4768 shape) — palette 13, glyph
 * from a fixed id, emit at x = 51 - width/2. */
extern void *func_0208dcb4(void);
extern void  func_02001cec(void *p, int a, int b);
extern void  func_02001d48(int c);
extern void  func_02001d78(void *p, int a);
extern int   func_0202c06c(int id);
extern int   func_02005538(int g, int a, int b);
extern void  func_02004f3c(void *p, int g, void *r, int x, int e, int f);
struct Ov006Mode2 { int pad; unsigned chan : 3; };
extern struct Ov006Mode2 data_02104e6c;
int func_ov006_021c45b4(char *obj) {
    void *q = func_0208dcb4();
    func_02001cec(obj + 16, 13, 3);
    func_02001d48(data_02104e6c.chan);
    func_02001d78(obj + 16, 5);
    {
        int g = func_0202c06c(0x449);
        func_02004f3c(obj + 16, g, (char *)q + 64, 51 - func_02005538(g, 12, 5) / 2, 5, 12);
    }
    func_02001d78(obj + 16, -1);
    return 1;
}
