/* func_ov006_021bf454: text-layout family (021c4768 shape) — clear a glyph
 * buffer, glyph from obj[20]+1161, emit at x = 165 - width/2. */
extern void *func_0208dd9c(void);
extern int   func_02094504(int a, void *b, int c);
extern void  func_02001d68(int c);
extern void  func_02001d98(void *p, int a);
extern int   func_0202c0c0(int id);
extern int   func_02005554(int g, int a, int b);
extern void  func_02004f58(void *p, int g, void *r, int x, int e, int f);
struct Ov006Mode3 { int pad; unsigned chan : 3; };
extern struct Ov006Mode3 data_02104f4c;
int func_ov006_021bf454(int *obj) {
    void *q = func_0208dd9c();
    func_02094504(0, (char *)q + 64, 4096);
    func_02001d68(data_02104f4c.chan);
    func_02001d98((char *)obj + 4, 5);
    {
        int g = func_0202c0c0(obj[20] + 1161);
        func_02004f58((char *)obj + 4, g, (char *)q + 64, 165 - func_02005554(g, 12, 5) / 2, 12, 12);
    }
    func_02001d98((char *)obj + 4, -1);
    return 1;
}
