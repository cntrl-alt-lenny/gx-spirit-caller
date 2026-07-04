/* func_ov023_021b2214: step the current dispatch-table phase fn-ptr;
 * advance the cursor and clear the secondary field only if the handler
 * reports non-zero (done). */
typedef struct {
    int idx;
    int f4;
} Ov023DispatchState;

typedef int (*Ov023StepFn)(void);

extern Ov023DispatchState data_ov023_021b22a0;
extern Ov023StepFn data_ov023_021b2280[];

int func_ov023_021b2214(void) {
    Ov023StepFn fn = data_ov023_021b2280[data_ov023_021b22a0.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov023_021b22a0.idx += 1;
            data_ov023_021b22a0.f4 = 0;
        }
        return 0;
    }
    return 1;
}
