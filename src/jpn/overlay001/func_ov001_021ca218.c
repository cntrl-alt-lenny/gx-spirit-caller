/* func_ov001_021ca218: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov001StepFn)(void);

extern GlobalAudioState data_02103fcc;
extern Ov001StepFn data_ov001_021ca2a4[];

int func_ov001_021ca218(void) {
    Ov001StepFn fn = data_ov001_021ca2a4[data_02103fcc.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_02103fcc.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
