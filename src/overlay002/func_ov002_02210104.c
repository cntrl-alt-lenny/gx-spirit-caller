#include "ov002_core.h"

extern void func_ov002_0220eb00(void *self, int *out);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern void func_ov002_021df818(void *self, int side, int val);
extern void func_ov002_021e05fc(int side, int val);

#define BIT0(x)  (((unsigned)((x) << 31)) >> 31)

typedef struct {
    u16 f_0;
    u16 f_2;
} Self02210104;

int func_ov002_02210104(Self02210104 *self) {
    int local[2];
    int side;

    func_ov002_0220eb00(self, local);
    func_ov002_021e2b3c();

    side = 1 - BIT0(self->f_2);
    if (local[side] < 0) {
        func_ov002_021df818(self, side, -local[side]);
    }

    side = BIT0(self->f_2);
    if (local[side] < 0) {
        func_ov002_021df818(self, side, -local[side]);
    }

    side = BIT0(self->f_2);
    if (local[side] > 0) {
        func_ov002_021e05fc(side, local[side]);
    }

    side = 1 - BIT0(self->f_2);
    if (local[side] > 0) {
        func_ov002_021e05fc(side, local[side]);
    }

    func_ov002_021e2c5c();
    return 0;
}
