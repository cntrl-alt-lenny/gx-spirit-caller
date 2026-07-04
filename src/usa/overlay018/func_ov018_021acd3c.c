/* func_ov018_021acd3c: step the current audio-dispatch phase fn-ptr;
 * advance the cursor only if the handler reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef int (*Ov018StepFn)(void);

extern GlobalAudioState data_02103fcc;
extern Ov018StepFn data_ov018_021ad63c[];
extern int func_020a9828(void);

int func_ov018_021acd3c(void) {
    Ov018StepFn fn;
    func_020a9828();
    fn = data_ov018_021ad63c[data_02103fcc.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_02103fcc.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
