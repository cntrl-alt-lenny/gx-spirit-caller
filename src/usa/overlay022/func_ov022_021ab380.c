/* func_ov022_021ab380: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov022StepFn)(void);

extern GlobalAudioState data_02103fcc;
extern Ov022StepFn data_ov022_021ab8dc[];

int func_ov022_021ab380(void) {
    Ov022StepFn fn = data_ov022_021ab8dc[data_02103fcc.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_02103fcc.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
