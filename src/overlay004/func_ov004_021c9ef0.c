/* func_ov004_021c9ef0: init a VRAM region via func_0208df0c + fill,
 * then (if self != 0) run a sized draw for self's glyph/id via
 * func_0202c0c0/func_020054a4, and always append a final glyph draw
 * via func_0208e1cc. */
extern void *func_0208df0c(void);
extern int data_02102c90[];
extern void func_02001d0c(void *a, int b, int c);
extern void func_02094504(int a, void *b, int c);
extern int func_0202c0c0(void *id);
extern int func_020054a4(int a, int b);
extern void func_02004f58(void *a, int b, void *c, int d, int e, int f);
extern void *func_0208e1cc(void);
extern void func_02001e94(void *a, void *b, int c, int d);

void func_ov004_021c9ef0(void *selfv) {
    char *r5 = (char *)func_0208df0c();
    func_02001d0c(data_02102c90, 0x20, 2);
    func_02094504(0, r5 + 0x820, 0x800);
    if (selfv == 0) return;
    {
        int r4 = func_0202c0c0(selfv);
        int half = func_020054a4(r4, 0xc);
        func_02004f58(data_02102c90, r4, r5 + 0x820, 0x80 - half / 2, 0, 0xc);
    }
    {
        char *e1cc = (char *)func_0208e1cc();
        func_02001e94(data_02102c90, e1cc + 0x580, 0x41, 0);
    }
}
