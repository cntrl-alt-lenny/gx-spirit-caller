/* func_ov018_021ace14: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov018StepFn)(void);

extern GlobalAudioState data_021040ac;
extern Ov018StepFn data_ov018_021ad71c[];
extern int func_020a991c(void);

int func_ov018_021ace14(void) {
    Ov018StepFn fn;
    func_020a991c();
    fn = data_ov018_021ad71c[data_021040ac.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_021040ac.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
