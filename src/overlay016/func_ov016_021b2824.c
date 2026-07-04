/* func_ov016_021b2824: step the current dispatch-table phase fn-ptr;
 * advance the cursor and clear the secondary field only if the handler
 * reports non-zero (done). */
typedef struct {
    int idx;
    int f4;
} Ov016DispatchState;

typedef int (*Ov016StepFn)(void);

extern Ov016DispatchState data_ov016_021b9740;
extern Ov016StepFn data_ov016_021b8f80[];

int func_ov016_021b2824(void) {
    Ov016StepFn fn = data_ov016_021b8f80[data_ov016_021b9740.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov016_021b9740.idx += 1;
            data_ov016_021b9740.f4 = 0;
        }
        return 0;
    }
    return 1;
}
