typedef int (*StepFn)(void);

typedef struct {
    int index;
    int field_04;
} StepState;

extern StepState data_ov002_022d0f2c;
extern StepFn data_ov002_022cba04[];

int func_ov002_0229ad88(void) {
    StepFn fn = data_ov002_022cba04[data_ov002_022d0f2c.index];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov002_022d0f2c.index++;
            data_ov002_022d0f2c.field_04 = 0;
        }
        return 0;
    }
    return 1;
}
