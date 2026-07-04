/* func_ov013_021cb620: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov013StepFn)(void);

extern GlobalAudioState data_02103fcc;
extern Ov013StepFn data_ov013_021cb8d0[];

int func_ov013_021cb620(void) {
    Ov013StepFn fn = data_ov013_021cb8d0[data_02103fcc.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_02103fcc.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
