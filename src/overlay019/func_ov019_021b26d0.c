/* func_ov019_021b26d0: step the current dispatch-table phase fn-ptr;
 * advance the cursor and clear the secondary field only if the handler
 * reports non-zero (done). */
typedef struct {
    int idx;
    int f4;
} Ov019DispatchState;

typedef int (*Ov019StepFn)(void);

extern Ov019DispatchState data_ov019_021b5e20;
extern Ov019StepFn data_ov019_021b5b20[];

int func_ov019_021b26d0(void) {
    Ov019StepFn fn = data_ov019_021b5b20[data_ov019_021b5e20.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov019_021b5e20.idx += 1;
            data_ov019_021b5e20.f4 = 0;
        }
        return 0;
    }
    return 1;
}
