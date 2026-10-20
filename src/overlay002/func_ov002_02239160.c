struct Self {
    unsigned short id;
    unsigned short player:1;
    unsigned short rest:15;
};
struct State {
    char pad[0x5a8];
    int step;
};
extern struct State data_ov002_022ce288;
/* The original passes fewer arguments than the four-argument thunk definition. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ded1c(int a, int b);
extern int func_ov002_022576d8(int arg0);
extern int func_ov002_02211b64(struct Self *self, int unused);

int func_ov002_02239160(struct Self *self, int unused) {
    int result;
    if (data_ov002_022ce288.step == 0x80) {
        if (func_ov002_021ca2b8(self->player, unused) == 0)
            return 0;
        if (func_ov002_021ded1c((int)self, func_ov002_022576d8((int)self)) != 0)
            return 0x7f;
        return 0;
    }
    data_ov002_022ce288.step++;
    result = func_ov002_02211b64(self, unused);
    if (result != 0)
        return result - 1;
    return 0;
}


