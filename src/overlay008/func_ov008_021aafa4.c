/* func_ov008_021aafa4: step the current audio-dispatch phase fn-ptr;
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

extern GlobalAudioState data_021040ac;
extern Ov008StepFn data_ov008_021b2440[];
extern Ov008SecondaryState data_ov008_021b2780;

int func_ov008_021aafa4(void) {
    Ov008StepFn fn = data_ov008_021b2440[data_021040ac.fb6c];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov008_021b2780.f2 = 0;
            data_ov008_021b2780.f4 = 0;
            data_021040ac.fb6c += 1;
        }
        return 0;
    }
    return 1;
}
