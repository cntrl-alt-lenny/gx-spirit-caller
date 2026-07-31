/* func_ov017_021b3ca8: per-tick dispatcher. If data_ov017_021b8a9c+8 is set,
 * runs a one-shot teardown (func_ov017_021b7ba0 gate -> func_ov017_021b7b5c +
 * func_ov017_021b34c4) and returns. Otherwise dispatches on self->f_4 (0/1):
 * f_4==0 drives a d-pad-controlled cursor index (self->f_c, data_02104bac
 * button bits) with a rect hit-test fallback (func_ov017_021b2d5c against
 * data_ov017_021b80a0[f_c]); f_4==1 drives a 2-step open sequence gated by
 * self->f_8 (func_ov017_021b5130 / func_ov017_021b4db0 against
 * data_ov017_021b8610).
 */
typedef struct {
    char pad0[4];
    int f_4;
    int f_8;
    int f_c;
} Self;

extern char data_ov017_021b8a9c[];
extern char data_02104f4c[];
extern char data_02104bac[];
extern char data_ov017_021b80a0[];
extern char data_ov017_021b8610[];

extern int func_ov017_021b7ba0(void *p);
extern int func_ov017_021b7b5c(void *p);
extern void func_ov017_021b34c4(void *self);
extern int func_ov017_021b3e6c(void *self);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov017_021b2d5c(void *r);
extern int func_ov017_021b5130(void *p);
extern int func_ov017_021b4db0(void *unused);

int func_ov017_021b3ca8(Self *self) {
    if (*(int *)(data_ov017_021b8a9c + 8) != 0) {
        if (func_ov017_021b7ba0(data_ov017_021b8a9c) != 0) {
            func_ov017_021b7b5c(data_ov017_021b8a9c);
            *(int *)(data_02104f4c + 0xa78) = 0;
            func_ov017_021b34c4(self);
        }
        return 0;
    }

    switch (self->f_4) {
    case 0: {
        unsigned short flag = *(unsigned short *)(data_02104bac + 0x52);
        if (flag != 0) {
            unsigned short bits = *(unsigned short *)(data_02104bac + 0x54);
            if (bits & 0x10) {
                self->f_c = self->f_c + 1;
                if (self->f_c > 4) self->f_c = 0;
                func_02037208(0x38, -1, 0, 1);
            } else if (bits & 0x20) {
                self->f_c = self->f_c - 1;
                if (self->f_c < 0) self->f_c = 4;
                func_02037208(0x38, -1, 0, 1);
            } else if (bits & 1) {
                return func_ov017_021b3e6c(self);
            } else if (bits & 2) {
                func_02037208(0x42, -1, 0, 1);
                return 1;
            }
        } else if (func_ov017_021b2d5c(data_ov017_021b80a0 + self->f_c * 10) != 0) {
            return func_ov017_021b3e6c(self);
        }
        break;
    }
    case 1:
        switch (self->f_8) {
        case 0:
            if (func_ov017_021b5130(data_ov017_021b8610) != 0) {
                self->f_8 = self->f_8 + 1;
            }
            break;
        case 1:
            if (func_ov017_021b4db0(data_ov017_021b8610) != 0) {
                func_ov017_021b34c4(self);
                self->f_4 = 0;
                self->f_8 = 0;
                self->f_c = *(int *)(data_ov017_021b8610 + 4);
            }
            break;
        }
        break;
    }
    return 0;
}
