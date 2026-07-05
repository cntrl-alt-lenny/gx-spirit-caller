/* func_ov008_021aaec4: step the current audio-dispatch phase fn-ptr;
 * on completion, clear two secondary u16 fields and advance the cursor. */
typedef struct {
    char _pad[0xb6c];
    int  fb6c;
} GlobalAudioState;

typedef struct {
    char           _pad0[0x2];
    unsigned short f2;
    unsigned short f4;
} Ov008SecondaryState;

typedef int (*Ov008StepFn)(void);

extern GlobalAudioState data_02103fcc;
extern Ov008StepFn data_ov008_021b2320[];
extern Ov008SecondaryState data_ov008_021b2660;

int func_ov008_021aaec4(void) {
    Ov008StepFn fn = data_ov008_021b2320[data_02103fcc.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov008_021b2660.f2 = 0;
            data_ov008_021b2660.f4 = 0;
            data_02103fcc.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
