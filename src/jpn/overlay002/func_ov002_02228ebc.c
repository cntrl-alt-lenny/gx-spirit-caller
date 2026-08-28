#include <nitro/types.h>

typedef struct {
    u16 f_0;
    u16 f_2;
} Self02228fac;

extern int  func_ov002_0223de48(void *self, int flag, int *outPtr);
extern u16  func_ov002_0223dda4(void *self, int idx);
extern int  func_ov002_02257564(void *self, int a, int b);
extern int  func_ov002_021d58dc(int a, int b, int c, int d, int e);
extern int  func_ov002_021e267c(int a0, int a1, int a2, int a3);

#define BIT0(x) (((unsigned)((x) << 31)) >> 31)

int func_ov002_02228ebc(Self02228fac *self) {
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

    func_ov002_021d58dc(lo, hi, self->f_0, 2, 0);
    func_ov002_021e267c(1 - BIT0(self->f_2), self->f_0, 1, 0);
ret0:
    return 0;
}
