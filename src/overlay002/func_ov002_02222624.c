/* func_ov002_02222624: tick 021e2b3c; r=02257704(self); if 021de408(self,r)
 * call 021df818(self, 1-bit0 of self->f2, 1000); tick 021e2c5c. Returns 0. */
typedef unsigned short u16;
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_02257704(void *self);
extern int  func_ov002_021de408(void *self, int n);
extern void func_ov002_021df818(void *self, int a, int b);

struct Self22624 { u16 _0; u16 b0:1; u16 :15; };

int func_ov002_02222624(struct Self22624 *self) {
    int r;
    func_ov002_021e2b3c();
    r = func_ov002_02257704(self);
    if (func_ov002_021de408(self, r) != 0) {
        func_ov002_021df818(self, 1 - self->b0, 0x3e8);
    }
    func_ov002_021e2c5c();
    return 0;
}
