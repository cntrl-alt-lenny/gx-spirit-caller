/* func_ov020_021ada1c: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov020StepFn)(void);

extern GlobalAudioState data_021040ac;
extern Ov020StepFn data_ov020_021adf80[];

int func_ov020_021ada1c(void) {
    Ov020StepFn fn = data_ov020_021adf80[data_021040ac.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_021040ac.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
