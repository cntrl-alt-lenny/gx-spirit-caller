/* func_ov011_021d0b4c: set a state flag, then step the current
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

extern GlobalAudioState data_021040ac;
extern Ov011StepFn data_ov011_021d38bc[];
extern Ov011ExtraState data_ov011_021d4000;

int func_ov011_021d0b4c(void) {
    Ov011StepFn fn;

    data_ov011_021d4000.f2bc |= 0x400000;
    fn = data_ov011_021d38bc[data_021040ac.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_021040ac.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
