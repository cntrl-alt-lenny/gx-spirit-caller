/* func_ov009_021ad7d4: step the current dispatch-table phase fn-ptr;
 * advance the cursor and clear the secondary field only if the handler
 * reports non-zero (done). */
typedef struct {
    int idx;
    int f4;
} Ov009DispatchState;

typedef int (*Ov009StepFn)(void);

extern Ov009DispatchState data_ov009_021adc94;
extern Ov009StepFn data_ov009_021adb9c[];

int func_ov009_021ad7d4(void) {
    Ov009StepFn fn = data_ov009_021adb9c[data_ov009_021adc94.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov009_021adc94.idx += 1;
            data_ov009_021adc94.f4 = 0;
        }
        return 0;
    }
    return 1;
}
