/* func_ov006_021c4b20: text-layout family (021c4768 shape) — palette 32, glyph
 * id from a table indexed by obj[22], emit centred at x = 128 - width/2. */
extern void *func_0208dd9c(void);
extern void  func_02001d0c(void *p, int a, int b);
extern void  func_02001d68(int c);
extern void  func_02001d98(void *p, int a);
extern int   func_0202c0c0(int id);
extern int   func_02005554(int g, int a, int b);
extern void  func_02004f58(void *p, int g, void *r, int x, int e, int f);
struct Ov006Mode5 { int pad; unsigned chan : 3; };
extern struct Ov006Mode5 data_02104f4c;
extern char data_ov006_021cde2e[];
int func_ov006_021c4b20(int *obj) {
    void *q = func_0208dd9c();
    func_02001d0c((char *)obj + 16, 32, 3);
    func_02001d68(data_02104f4c.chan);
    func_02001d98((char *)obj + 16, 5);
    {
        int g = func_0202c0c0(*(short *)(data_ov006_021cde2e + obj[22] * 4));
        func_02004f58((char *)obj + 16, g, (char *)q + 64, 128 - func_02005554(g, 12, 5) / 2, 5, 12);
    }
    func_02001d98((char *)obj + 16, -1);
    return 1;
}
