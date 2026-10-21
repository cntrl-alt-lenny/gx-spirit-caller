typedef struct {
    char _pad_0x00[0x20];
    unsigned int _pad_lo22 : 22;
    unsigned int bit_22 : 1;
    unsigned int _pad_hi : 9;
} state_t;
typedef union {
    unsigned int value;
    struct {
        unsigned int low : 9;
        unsigned int bit9 : 1;
        unsigned int bit10 : 1;
        unsigned int bit11 : 1;
        unsigned int high : 20;
    } bits;
} Flags;
typedef struct {
    char pad0[0x1ac];
    state_t sub;
    char pad1[0xa0];
    Flags flags;
} State;
extern unsigned short data_02104bac[];
extern State data_ov000_021c75c4;
extern unsigned int func_02001e84(state_t *p);
extern int func_02001e5c(void *p);
extern unsigned int func_02006164(void);
extern int func_02037208(int a0, int r1, int r2, int r3);
void func_ov000_021ae218(void) {
    State *s = &data_ov000_021c75c4;
    if (!(data_02104bac[0x2a] & 1) && !func_02006164())
        return;
    if (s->flags.bits.bit11 && !s->flags.bits.bit9) {
        if (func_02001e84(&s->sub) || func_02001e5c(&s->sub)) {
            if (!s->flags.bits.bit10)
                func_02037208(0x9b, -1, 0, 1);
        }
    }
    s->flags.value |= 0x200;
    if (func_02001e5c(&s->sub))
        s->flags.value &= ~0x800;
}
