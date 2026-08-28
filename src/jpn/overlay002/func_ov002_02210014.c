#include "ov002_core.h"

extern void func_ov002_0220ea10(void *self, int *out);
extern void func_ov002_021e2a4c(void);
extern void func_ov002_021e2b6c(void);
extern void func_ov002_021df728(void *self, int side, int val);
extern void func_ov002_021e050c(int side, int val);

#define BIT0(x)  (((unsigned)((x) << 31)) >> 31)

typedef struct {
    u16 f_0;
    u16 f_2;
} Self02210104;

int func_ov002_02210014(Self02210104 *self) {
    int local[2];
    int side;

    func_ov002_0220ea10(self, local);
    func_ov002_021e2a4c();

    side = 1 - BIT0(self->f_2);
    if (local[side] < 0) {
        func_ov002_021df728(self, side, -local[side]);
    }

    side = BIT0(self->f_2);
    if (local[side] < 0) {
        func_ov002_021df728(self, side, -local[side]);
    }

    side = BIT0(self->f_2);
    if (local[side] > 0) {
        func_ov002_021e050c(side, local[side]);
    }

    side = 1 - BIT0(self->f_2);
    if (local[side] > 0) {
        func_ov002_021e050c(side, local[side]);
    }

    func_ov002_021e2b6c();
    return 0;
}
