struct State {
    char pad0[0x238];
    int x, y;
    char pad1[0x20];
    int out_x, out_y;
    char pad2[4];
    int base_x, base_y;
    char pad3[0x38];
    unsigned int low : 20;
    unsigned int mode : 8;
    unsigned int high : 4;
    unsigned int alpha : 8;
    unsigned int other : 24;
};
extern struct State data_ov011_021d4000;
void func_ov011_021ccf3c(void) {
    struct State *s = &data_ov011_021d4000;
    s->alpha = 0xff;
    s->out_x = s->x - s->base_x + 0x80000;
    s->out_y = s->y - s->base_y + 0x60000;
    s->mode = 0;
}
