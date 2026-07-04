/* func_ov021_021aa4a0: step the current dispatch-table phase fn-ptr.
 * If no handler is installed, fall back to a GlobalAudioState.f24 gate
 * that fires a one-shot notify via func_020071a4. */
typedef struct {
    char _pad[0x24];
    int  f24;
} GlobalAudioStateF24View;

typedef struct {
    int idx;
    int f4;
} Ov021DispatchState;

typedef int (*Ov021StepFn)(void);

extern Ov021DispatchState data_ov021_021ace80;
extern Ov021StepFn data_ov021_021abea0[];
extern GlobalAudioStateF24View data_021040ac;
extern int data_ov021_021ad7d4;
extern void func_020071a4(int a, int b, int c);

int func_ov021_021aa4a0(void) {
    Ov021StepFn fn = data_ov021_021abea0[data_ov021_021ace80.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov021_021ace80.f4 = 0;
        }
        return 0;
    }
    if (data_021040ac.f24 == 0) {
        return 1;
    }
    func_020071a4(9, -1, (int)&data_ov021_021ad7d4);
    return 0;
}
