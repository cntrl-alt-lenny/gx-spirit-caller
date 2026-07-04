/* func_ov011_021d0a88: set a state flag, then step the current
 * audio-dispatch phase fn-ptr; advance the cursor only if the handler
 * reports non-zero (done). */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef struct {
    char _pad[0x2bc];
    int  f2bc;
} Ov011ExtraState;

typedef int (*Ov011StepFn)(void);

extern GlobalAudioState data_02103fcc;
extern Ov011StepFn data_ov011_021d37dc[];
extern Ov011ExtraState data_ov011_021d3f20;

int func_ov011_021d0a88(void) {
    Ov011StepFn fn;

    data_ov011_021d3f20.f2bc |= 0x400000;
    fn = data_ov011_021d37dc[data_02103fcc.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_02103fcc.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
