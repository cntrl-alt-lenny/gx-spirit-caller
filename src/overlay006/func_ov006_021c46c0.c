/* func_ov006_021c46c0: text-layout family (021c4768 shape) — palette 13, glyph
 * from a fixed id, emit at x = 51 - width/2. */
extern void *func_0208dd9c(void);
extern void  func_02001d0c(void *p, int a, int b);
extern void  func_02001d68(int c);
extern void  func_02001d98(void *p, int a);
extern int   func_0202c0c0(int id);
extern int   func_02005554(int g, int a, int b);
extern void  func_02004f58(void *p, int g, void *r, int x, int e, int f);
struct Ov006Mode2 { int pad; unsigned chan : 3; };
extern struct Ov006Mode2 data_02104f4c;
int func_ov006_021c46c0(char *obj) {
    void *q = func_0208dd9c();
    func_02001d0c(obj + 16, 13, 3);
    func_02001d68(data_02104f4c.chan);
    func_02001d98(obj + 16, 5);
    {
        int g = func_0202c0c0(0x449);
        func_02004f58(obj + 16, g, (char *)q + 64, 51 - func_02005554(g, 12, 5) / 2, 5, 12);
    }
    func_02001d98(obj + 16, -1);
    return 1;
}
