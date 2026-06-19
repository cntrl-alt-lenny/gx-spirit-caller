/* func_ov006_021c465c: lay out a text element — pick a glyph buffer, set
 * palette/spacing, and emit it at a computed x; return 1. */
extern char *func_ov006_021b6ae0(void *p, int sel, int idx);
extern void *func_0208dcb4(void);
extern void  func_02001cec(void *p, int a, int b);
extern void  func_02001d48(int c);
extern void  func_02001d78(void *p, int a);
extern int   func_02005538(void *p, int a, int b);
extern void  func_02004f3c(void *p, void *q, void *r, int x, int e, int f);
extern char  data_ov006_0224f328[];
int func_ov006_021c465c(char *obj) {
    char *p = func_ov006_021b6ae0(data_ov006_0224f328, 2, 0);
    char *q = (char *)func_0208dcb4();
    func_02001cec(obj + 16, 19, 3);
    func_02001d48(*(unsigned char *)p);
    func_02001d78(obj + 16, 5);
    func_02004f3c(obj + 16, p + 1, q + 1312, 75 - func_02005538(p + 1, 12, 5) / 2, 5, 12);
    func_02001d78(obj + 16, -1);
    return 1;
}
