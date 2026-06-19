/* func_ov006_021bf348: text-layout family (021c4768 shape) — clear a glyph
 * buffer, glyph from obj[20]+1161, emit at x = 165 - width/2. */
extern void *func_0208dcb4(void);
extern int   func_02094410(int a, void *b, int c);
extern void  func_02001d48(int c);
extern void  func_02001d78(void *p, int a);
extern int   func_0202c06c(int id);
extern int   func_02005538(int g, int a, int b);
extern void  func_02004f3c(void *p, int g, void *r, int x, int e, int f);
struct Ov006Mode3 { int pad; unsigned chan : 3; };
extern struct Ov006Mode3 data_02104e6c;
int func_ov006_021bf348(int *obj) {
    void *q = func_0208dcb4();
    func_02094410(0, (char *)q + 64, 4096);
    func_02001d48(data_02104e6c.chan);
    func_02001d78((char *)obj + 4, 5);
    {
        int g = func_0202c06c(obj[20] + 1161);
        func_02004f3c((char *)obj + 4, g, (char *)q + 64, 165 - func_02005538(g, 12, 5) / 2, 12, 12);
    }
    func_02001d78((char *)obj + 4, -1);
    return 1;
}
