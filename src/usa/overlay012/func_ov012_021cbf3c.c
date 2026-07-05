/* func_ov012_021cbf3c: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov012StepFn)(void);

extern GlobalAudioState data_02103fcc;
extern Ov012StepFn data_ov012_021cc2f0[];

int func_ov012_021cbf3c(void) {
    Ov012StepFn fn = data_ov012_021cc2f0[data_02103fcc.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_02103fcc.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
