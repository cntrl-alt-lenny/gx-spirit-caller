typedef unsigned short u16;

struct Self {
    u16 f_0;
    u16 bit0 : 1;
    u16 : 15;
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021bbf50(int x);
extern int func_ov002_0227d660(int x, int y);

int func_ov002_02295748(struct Self *self) {
    int p = self->bit0;
    if (*(int *)(data_ov002_022cf16c + ((1 - p) & 1) * 0x868) <= func_ov002_021bbf50(p) * 500)
        return 1;
    if (func_ov002_021bbf50(p) > 1) {
        if (func_ov002_0227d660(self->bit0, 0) >= 0)
            return 1;
    }
    return 0;
}
