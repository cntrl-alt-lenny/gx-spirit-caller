typedef unsigned int u32;
struct State {
    char pad0[0x2a0];
    u32 f2a0;
    u32 f2a4;
    u32 f2a8;
    u32 f2ac;
};
struct ModeState {
    char pad0[0x268];
    u32 low:5;
    u32 mode:4;
    u32 next:4;
    u32 high:19;
};
extern struct State data_ov011_021d4000;
extern struct ModeState data_ov011_021d403c;
void func_ov011_021ceffc(void) {
    struct State *state = &data_ov011_021d4000;
    struct ModeState *mode = &data_ov011_021d403c;
    state->f2ac = (state->f2ac & ~0xc0000) | 0x40000;
    if (state->f2a0 == 0) {
        mode->next = mode->mode;
    }
}
