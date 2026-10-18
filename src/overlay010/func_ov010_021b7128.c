typedef struct {
    char pad[0x54];
    unsigned short keys;
} InputState;
typedef struct {
    char pad[0xc];
    void *value;
} State;
typedef union {
    unsigned int value;
    struct {
        unsigned int low : 3;
        unsigned int active : 1;
        unsigned int rest : 28;
    } bits;
} Flags;
typedef struct {
    char pad[0x358];
    Flags flags;
} OverlayState;
extern InputState data_02104bac;
extern State data_ov010_021b9884;
extern OverlayState data_ov010_021b9890;

void *func_ov010_021b7128(void) {
    InputState *input = &data_02104bac;
    State *state = &data_ov010_021b9884;
    unsigned short keys = input->keys;
    void *result = state->value;
    OverlayState *overlay = &data_ov010_021b9890;
    if (keys & 2)
        overlay->flags.value |= 4;
    else if (keys & 1)
        overlay->flags.value |= 0x10;
    if (overlay->flags.bits.active == 1)
        overlay->flags.value |= 0x10;
    return result;
}








