/* func_ov014_021b25ec: step the current dispatch-table phase fn-ptr;
 * advance the cursor and clear the secondary field only if the handler
 * reports non-zero (done). */
typedef struct {
    int idx;
    int f4;
} Ov014DispatchState;

typedef int (*Ov014StepFn)(void);

extern Ov014DispatchState data_ov014_021b4f40;
extern Ov014StepFn data_ov014_021b4bc0[];

int func_ov014_021b25ec(void) {
    Ov014StepFn fn = data_ov014_021b4bc0[data_ov014_021b4f40.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov014_021b4f40.idx += 1;
            data_ov014_021b4f40.f4 = 0;
        }
        return 0;
    }
    return 1;
}
