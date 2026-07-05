/* func_ov016_021b2724: step the current dispatch-table phase fn-ptr;
 * advance the cursor and clear the secondary field only if the handler
 * reports non-zero (done). */
typedef struct {
    int idx;
    int f4;
} Ov016DispatchState;

typedef int (*Ov016StepFn)(void);

extern Ov016DispatchState data_ov016_021b95e0;
extern Ov016StepFn data_ov016_021b8e20[];

int func_ov016_021b2724(void) {
    Ov016StepFn fn = data_ov016_021b8e20[data_ov016_021b95e0.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov016_021b95e0.idx += 1;
            data_ov016_021b95e0.f4 = 0;
        }
        return 0;
    }
    return 1;
}
