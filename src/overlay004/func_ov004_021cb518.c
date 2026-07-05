/* func_ov004_021cb518: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov004StepFn)(void);

extern GlobalAudioState data_021040ac;
extern Ov004StepFn data_ov004_02209ac0[];

int func_ov004_021cb518(void) {
    Ov004StepFn fn = data_ov004_02209ac0[data_021040ac.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_021040ac.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
