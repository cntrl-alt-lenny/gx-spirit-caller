/* func_ov023_021b2314: step the current dispatch-table phase fn-ptr;
 * advance the cursor and clear the secondary field only if the handler
 * reports non-zero (done). */
typedef struct {
    int idx;
    int f4;
} Ov023DispatchState;

typedef int (*Ov023StepFn)(void);

extern Ov023DispatchState data_ov023_021b23a0;
extern Ov023StepFn data_ov023_021b2380[];

int func_ov023_021b2314(void) {
    Ov023StepFn fn = data_ov023_021b2380[data_ov023_021b23a0.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov023_021b23a0.idx += 1;
            data_ov023_021b23a0.f4 = 0;
        }
        return 0;
    }
    return 1;
}
