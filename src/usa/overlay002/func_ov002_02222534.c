/* func_ov002_02222534: tick 021e2b3c; r=02257704(self); if 021de408(self,r)
 * call 021df818(self, 1-bit0 of self->f2, 1000); tick 021e2c5c. Returns 0. */
typedef unsigned short u16;
extern void func_ov002_021e2a4c(void);
extern void func_ov002_021e2b6c(void);
extern int  func_ov002_0225761c(void *self);
extern int  func_ov002_021de318(void *self, int n);
extern void func_ov002_021df728(void *self, int a, int b);

struct Self22624 { u16 _0; u16 b0:1; u16 :15; };

int func_ov002_02222534(struct Self22624 *self) {
    int r;
    func_ov002_021e2a4c();
    r = func_ov002_0225761c(self);
    if (func_ov002_021de318(self, r) != 0) {
        func_ov002_021df728(self, 1 - self->b0, 0x3e8);
    }
    func_ov002_021e2b6c();
    return 0;
}
