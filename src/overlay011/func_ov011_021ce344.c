typedef unsigned int u32;
struct State {
    char pad0[0x2a4];
    u32 low:5;
    u32 mode:4;
    u32 next:4;
    u32 high:19;
    char pad1[8];
    u32 field_2b0;
};
struct ModeState {
    char pad0[0x274];
    u32 field_274;
};
extern struct State data_ov011_021d4000;
extern struct ModeState data_ov011_021d403c;
extern void func_ov011_021ceffc(void);
void func_ov011_021ce344(void) {
    struct State *state = &data_ov011_021d4000;
    struct ModeState *mode = &data_ov011_021d403c;
    state->field_2b0 = (state->field_2b0 & 0xffe01fff) | 0x2000;
    if (state->mode != state->next) {
        func_ov011_021ceffc();
    } else {
        mode->field_274 = (mode->field_274 & 0xffe01fff) | 0x4000;
    }
}
