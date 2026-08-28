#include <nitro/types.h>

typedef struct {
    u16 f_0;
    u16 f_2;
} Self0223163c;

extern int  func_ov002_0223de48(void *self, int flag, int *outPtr);
extern u16  func_ov002_0223dda4(void *self, int idx);
extern int  func_ov002_02257564(void *self, int a, int b);
extern void func_ov002_021de8e4(void *self, int a, int b);

int func_ov002_0223154c(Self0223163c *self) {
    int lo, hi;
    unsigned short v16;
    int r;

    if (!func_ov002_0223de48(self, 0, 0)) {
        goto ret0;
    }

    r = func_ov002_0223dda4(self, 0);
    lo = r & 0xff;
    v16 = (unsigned short)r;
    hi = (v16 >> 8) & 0xff;

    if (!func_ov002_02257564(self, lo, hi)) {
        goto ret0;
    }

    func_ov002_021de8e4(self, lo, hi);
ret0:
    return 0;
}
