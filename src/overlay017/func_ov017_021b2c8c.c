/* func_ov017_021b2c8c: step the current dispatch-table phase fn-ptr;
 * advance the cursor and clear the secondary field only if the handler
 * reports non-zero (done). */
typedef struct {
    int idx;
    int f4;
} Ov017DispatchState;

typedef int (*Ov017StepFn)(void);

extern Ov017DispatchState data_ov017_021b8520;
extern Ov017StepFn data_ov017_021b8020[];

int func_ov017_021b2c8c(void) {
    Ov017StepFn fn = data_ov017_021b8020[data_ov017_021b8520.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov017_021b8520.idx += 1;
            data_ov017_021b8520.f4 = 0;
        }
        return 0;
    }
    return 1;
}
