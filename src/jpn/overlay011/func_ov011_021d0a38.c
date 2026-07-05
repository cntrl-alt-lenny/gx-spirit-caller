/* func_ov011_021d0a38: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov011StepFn)(void);

extern GlobalAudioState data_02103fcc;
extern Ov011StepFn data_ov011_021d37dc[];

int func_ov011_021d0a38(void) {
    Ov011StepFn fn = data_ov011_021d37dc[data_02103fcc.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_02103fcc.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
