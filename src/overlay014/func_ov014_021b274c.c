/* func_ov014_021b274c: if self->f2c==0, run one of two setup calls
 * (func_020aadf8 vs func_02094504) depending on whether a bitfield
 * match holds between data_02104f4c's field_4 and its byte at 0xa3c;
 * either way, fall into the shared reset tail that clears self's first
 * 4 fields, then either arms self via func_ov005_021ad018 or defers to
 * func_ov014_021b2fb8. Always returns 1.
 */

extern void func_02094504(int a, void *b, int c);
extern void func_020aadf8(void *a, void *b);
extern int func_ov005_021ad018(void *a, int b);
extern void func_ov014_021b2fb8(void *self);

typedef struct {
    char _pad4[4];
    unsigned int mode : 3;
    char _pad_rest[0xa3c - 4 - 4];
    unsigned char mode2 : 3;
} D104f4c;
extern D104f4c data_02104f4c;
extern char data_02105989[];
extern char data_ov014_02235094[];
extern char data_ov014_021b5040[];

int func_ov014_021b274c(char *self) {
    if (*(int *)(self + 0x2c) == 0) {
        func_02094504(0, data_ov014_02235094, 0x4c);
        if (data_02104f4c.mode == data_02104f4c.mode2) {
            func_020aadf8(self + 0xc, data_02105989);
        } else {
            func_02094504(0, self + 0xc, 0x20);
        }
    }

    *(int *)(self + 0x2c) = 0;
    *(int *)(self + 0x8) = 0;
    *(int *)self = 0;
    *(int *)(self + 0x4) = 0;

    if (*(int *)(data_ov014_021b5040 + 0x44) != 0) {
        *(int *)(self + 0x2c) = 1;
        func_ov005_021ad018(self + 0xc, 3);
    } else {
        func_ov014_021b2fb8(self);
    }
    return 1;
}
