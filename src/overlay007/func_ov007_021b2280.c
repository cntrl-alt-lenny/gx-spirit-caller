/* func_ov007_021b2280: state-machine tick — call the current step's
 * function via data_ov007_021b2fa0[state]; on nonzero return, advance
 * to the next state and reset the substep counter. */

typedef int (*StepFn)(void);

extern StepFn data_ov007_021b2fa0[];
extern int data_ov007_021b3480[2];

int func_ov007_021b2280(void) {
    StepFn fn = data_ov007_021b2fa0[data_ov007_021b3480[0]];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov007_021b3480[0] += 1;
            data_ov007_021b3480[1] = 0;
        }
        return 0;
    }
    return 1;
}
