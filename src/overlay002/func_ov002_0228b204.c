typedef struct {
    char _pad0[2];
    unsigned short b0 : 1;
    unsigned short _rest2 : 15;
    char _pad1[2];
    unsigned short f_6 : 8;
    unsigned short _rest6 : 8;
    char _pad2[4];
    unsigned short f_c;
} Ov002Self_0228b204;

extern char data_ov002_022cf16c[];

typedef struct {
    unsigned int id : 13;
} Ov002Slot_0228b204;

extern int func_ov002_0223de94(Ov002Self_0228b204 *self, int idx);
extern int func_ov002_021b39c4(int player, int idx, int zero);
extern int func_0202e340(int id);
extern int func_ov002_021ff3bc(Ov002Self_0228b204 *self, Ov002Self_0228b204 *arg1);
extern int func_ov002_022575c8(Ov002Self_0228b204 *self, int player, int idx);
extern int func_ov002_021bd030(int player);

int func_ov002_0228b204(Ov002Self_0228b204 *self, Ov002Self_0228b204 *arg1) {
    int idx;
    int id;

    if (!arg1) {
        return 0;
    }
    if (arg1->b0 == self->b0) {
        return 0;
    }

    if (arg1->f_6 != 1) {
        goto end0;
    }
    {
        int r;
        unsigned char t;

        t = (unsigned char)(((unsigned short)func_ov002_0223de94(arg1, 0)) >> 8);
        if (t > 10) {
            goto end0;
        }

        r = func_ov002_0223de94(arg1, 0);
        idx = (unsigned char)(((unsigned short)r) >> 8);
        if ((r & 0xff) != self->b0) {
            return 0;
        }

        r = func_ov002_021b39c4(self->b0, idx, 0);
        if (r != 0xffff) {
            if ((r & 0xff) == self->b0) {
                idx = (unsigned char)(((unsigned short)r) >> 8);
            }
        }
    }

    id = ((Ov002Slot_0228b204 *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + idx * 0x14 + 0x30))->id;

    if (!func_0202e340(id)) {
        goto end0;
    }

    if (idx >= 5) {
        self->f_c = 2;
        if (!func_ov002_021ff3bc(self, arg1)) {
            goto end0;
        }
        if (!func_ov002_022575c8(self, self->b0, idx)) {
            goto end0;
        }
        return 1;
    } else {
        self->f_c = 1;
        if (func_ov002_021bd030(self->b0) < 0) {
            goto end0;
        }
        if (func_ov002_022575c8(self, self->b0, idx) != 0) {
            return 1;
        }
    }

end0:
    return 0;
}
