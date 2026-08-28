/* func_ov004_021c9e10: init a VRAM region via func_0208de24 + fill,
 * then (if self != 0) run a sized draw for self's glyph/id via
 * func_0202c06c/func_02005488, and always append a final glyph draw
 * via func_0208e0e4. */
extern void *func_0208de24(void);
extern int data_02102bb0[];
extern void func_02001cec(void *a, int b, int c);
extern void func_02094410(int a, void *b, int c);
extern int func_0202c06c(void *id);
extern int func_02005488(int a, int b);
extern void func_02004f3c(void *a, int b, void *c, int d, int e, int f);
extern void *func_0208e0e4(void);
extern void func_02001e74(void *a, void *b, int c, int d);

void func_ov004_021c9e10(void *selfv) {
    char *r5 = (char *)func_0208de24();
    func_02001cec(data_02102bb0, 0x20, 2);
    func_02094410(0, r5 + 0x820, 0x800);
    if (selfv == 0) return;
    {
        int r4 = func_0202c06c(selfv);
        int half = func_02005488(r4, 0xc);
        func_02004f3c(data_02102bb0, r4, r5 + 0x820, 0x80 - half / 2, 0, 0xc);
    }
    {
        char *e1cc = (char *)func_0208e0e4();
        func_02001e74(data_02102bb0, e1cc + 0x580, 0x41, 0);
    }
}
