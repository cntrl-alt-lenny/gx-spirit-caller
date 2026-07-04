/* func_ov022_021ab460: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov022StepFn)(void);

extern GlobalAudioState data_021040ac;
extern Ov022StepFn data_ov022_021ab9bc[];

int func_ov022_021ab460(void) {
    Ov022StepFn fn = data_ov022_021ab9bc[data_021040ac.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_021040ac.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
