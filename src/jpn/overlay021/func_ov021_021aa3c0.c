/* func_ov021_021aa3c0: step the current dispatch-table phase fn-ptr.
 * If no handler is installed, fall back to a GlobalAudioState.f24 gate
 * that fires a one-shot notify via func_02007188. */
typedef struct {
    char _pad[0x24];
    int  f24;
} GlobalAudioStateF24View;

typedef struct {
    int idx;
    int f4;
} Ov021DispatchState;

typedef int (*Ov021StepFn)(void);

extern Ov021DispatchState data_ov021_021acda0;
extern Ov021StepFn data_ov021_021abdc0[];
extern GlobalAudioStateF24View data_02103fcc;
extern int data_ov021_021ad6f4;
extern void func_02007188(int a, int b, int c);

int func_ov021_021aa3c0(void) {
    Ov021StepFn fn = data_ov021_021abdc0[data_ov021_021acda0.idx];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov021_021acda0.f4 = 0;
        }
        return 0;
    }
    if (data_02103fcc.f24 == 0) {
        return 1;
    }
    func_02007188(9, -1, (int)&data_ov021_021ad6f4);
    return 0;
}
