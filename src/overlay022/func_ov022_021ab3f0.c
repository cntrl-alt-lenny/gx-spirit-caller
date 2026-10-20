typedef struct {
    char pad[0x874];
    void *task874;
    void *task878;
} OverlayState;
typedef struct {
    char pad[0x8bc];
    int active;
} OverlayControl;
extern OverlayState data_ov022_021abae8;
extern OverlayControl data_ov022_021abaa0;
extern int func_02036590(unsigned int id, int arg);
extern void Task_Invoke(void *p);
extern void func_020058b4(void);

int func_ov022_021ab3f0(void) {
    OverlayState *state = &data_ov022_021abae8;
    func_02036590(0x8f00000, 0);
    func_02036590(0x8f00003, 0);
    if (data_ov022_021abaa0.active != 0) {
        Task_Invoke(state->task874);
        state->task874 = 0;
    }
    if (state->task878 != 0) {
        Task_Invoke(state->task878);
        state->task878 = 0;
    }
    func_020058b4();
    return 1;
}
