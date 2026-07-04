/* func_ov005_021acea8: step the current dispatch-table phase fn-ptr;
 * advance the cursor on completion, or fully reset state if no handler
 * is installed for the current index. */
typedef struct {
    int idx;
    int f4;
    int f8;
    int fc;
} Ov005DispatchState;

typedef int (*Ov005StepFn)(void);

extern Ov005DispatchState data_ov005_021b1d4c;
extern Ov005StepFn data_ov005_021b16e8[];

int func_ov005_021acea8(void) {
    Ov005StepFn fn = data_ov005_021b16e8[data_ov005_021b1d4c.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov005_021b1d4c.idx += 1;
            data_ov005_021b1d4c.f4 = 0;
        }
        return 0;
    }
    data_ov005_021b1d4c.idx = 0;
    data_ov005_021b1d4c.f8 = 0;
    data_ov005_021b1d4c.fc = 0;
    return 1;
}
