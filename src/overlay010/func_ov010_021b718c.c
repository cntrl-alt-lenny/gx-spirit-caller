typedef struct { char pad[0x18]; int remaining; } Timer;
typedef struct { char pad[8]; int total; int current; } State;
extern Timer data_ov010_021b9884;
extern State data_ov010_021b9890;
extern int func_020b3870(int numerator, int denominator);

int func_ov010_021b718c(int amount) {
    Timer *timer = &data_ov010_021b9884;
    State *state = &data_ov010_021b9890;
    int half;
    if ((timer->remaining -= amount) < 0)
        state->current = 0;
    half = func_020b3870(151 * state->current, state->total) / 2;
    *(volatile unsigned short *)0x04001040 = 0x4e4;
    *(volatile unsigned short *)0x04001044 = (((111 - half) << 8) & 0xff00) | ((111 + half) & 0xff);
    if (state->current == 0) {
        state->total = 0;
        return 1;
    }
    return 0;
}
