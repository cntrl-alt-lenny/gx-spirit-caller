/* func_ov015_021b5a14: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov015StepFn)(void);

extern GlobalAudioState data_021040ac;
extern Ov015StepFn data_ov015_021b5cc8[];

int func_ov015_021b5a14(void) {
    Ov015StepFn fn = data_ov015_021b5cc8[data_021040ac.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_021040ac.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
