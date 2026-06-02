/* func_ov006_021c4768: lay out a text element — pick a glyph buffer, set
 * palette/spacing, and emit it at a computed x; return 1. */
extern char *func_ov006_021b6be0(void *p, int sel, int idx);
extern void *func_0208dd9c(void);
extern void  func_02001d0c(void *p, int a, int b);
extern void  func_02001d68(int c);
extern void  func_02001d98(void *p, int a);
extern int   func_02005554(void *p, int a, int b);
extern void  func_02004f58(void *p, void *q, void *r, int x, int e, int f);
extern char  data_ov006_0224f448[];
int func_ov006_021c4768(char *obj) {
    char *p = func_ov006_021b6be0(data_ov006_0224f448, 2, 0);
    char *q = (char *)func_0208dd9c();
    func_02001d0c(obj + 16, 19, 3);
    func_02001d68(*(unsigned char *)p);
    func_02001d98(obj + 16, 5);
    func_02004f58(obj + 16, p + 1, q + 1312, 75 - func_02005554(p + 1, 12, 5) / 2, 5, 12);
    func_02001d98(obj + 16, -1);
    return 1;
}
