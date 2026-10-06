typedef struct {
    void *self;          /* +0x00 */
    int a1;              /* +0x04 */
    int f_08;            /* +0x08 */
    unsigned long long f_0c; /* +0x0c */
    int a4;              /* +0x14 */
    int a3;              /* +0x18 */
    unsigned char b_1c;  /* +0x1c */
    unsigned char b_1d;  /* +0x1d */
    unsigned char b_1e;  /* +0x1e */
    unsigned char b_1f;  /* +0x1f */
    int f_20;            /* +0x20 */
    int f_24;            /* +0x24 */
    int a2;              /* +0x28 */
    int f_2c;            /* +0x2c */
    int f_30;            /* +0x30 */
    int f_34;            /* +0x34 */
    int f_38;            /* +0x38 */
    int f_3c;            /* +0x3c */
    int f_40;            /* +0x40 */
    int f_44;            /* +0x44 */
    int f_48;            /* +0x48 */
    int f_4c;            /* +0x4c */
    int f_50;            /* +0x50 */
    int f_54;            /* +0x54 */
    int f_58;            /* +0x58 */
} State;

extern State *data_0219dc80;

void func_02049554(State *state, int a1, int a2, int a3, int a4) {
    data_0219dc80 = state;
    state->self = 0;
    data_0219dc80->a1 = a1;
    data_0219dc80->f_08 = 0;
    data_0219dc80->f_0c = 0;
    data_0219dc80->a4 = a4;
    data_0219dc80->a3 = a3;
    data_0219dc80->b_1c = 0;
    data_0219dc80->b_1d = 0;
    data_0219dc80->b_1e = 0;
    data_0219dc80->b_1f = 0;
    data_0219dc80->f_20 = 0;
    data_0219dc80->f_24 = 0;
    data_0219dc80->a2 = a2;
    data_0219dc80->f_2c = 0;
    data_0219dc80->f_30 = 0;
    data_0219dc80->f_34 = 0;
    data_0219dc80->f_38 = 0;
    data_0219dc80->f_3c = 0;
    data_0219dc80->f_40 = 0;
    data_0219dc80->f_44 = 0;
    data_0219dc80->f_48 = 0;
    data_0219dc80->f_4c = 0;
    data_0219dc80->f_50 = 0;
    data_0219dc80->f_54 = 0;
    data_0219dc80->f_58 = 0;
}
