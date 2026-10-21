typedef struct { char pad[0x54]; int timer; } Control;
typedef struct { int pad[2]; int duration; int remaining; } State;
extern Control data_ov022_021abaa0;
extern State data_ov022_021abae8;
extern int func_020b3870(int num, int den);
extern void func_0208c884(unsigned short *a0, int a1);

int func_ov022_021ab330(void) {
    State *state = &data_ov022_021abae8;
    int value;
    data_ov022_021abaa0.timer -= 0x1000;
    if (data_ov022_021abaa0.timer < 0) state->remaining = 0;
    value = -16 - func_020b3870(-(state->remaining << 4), state->duration);
    func_0208c884((unsigned short *)0x0400006c, value);
    func_0208c884((unsigned short *)0x0400106c, value);
    if (state->remaining != 0) return 0;
    state->remaining = 0;
    state->duration = 0;
    func_0208c884((unsigned short *)0x0400006c, -16);
    func_0208c884((unsigned short *)0x0400106c, -16);
    *(volatile unsigned int *)0x04000000 &= ~0x1f00;
    *(volatile unsigned int *)0x04001000 &= ~0x1f00;
    return 1;
}
