typedef struct { unsigned int low:14; unsigned int flag:1; unsigned int high:17; } Packed;
typedef struct { char _pad[0x68]; int *f_68; } state_ov002_022ac028_t;
typedef struct {
    int f0;
    int mode;
    unsigned int bits;
    unsigned int mask;
    int f10;
    int kind;
    int pad18[2];
    int index;
    int pad24[10];
    int value;
} Self;
extern int func_ov002_021afaf0(void);
extern void *func_ov002_021afb90(int i);
extern int func_ov002_022ac028(state_ov002_022ac028_t *p, int idx);
int func_ov002_022a0f8c(Self *self, int i)
{
    int count;
    int mode;
    switch (self->mode) {
    case 3:
        return ((Packed *)func_ov002_021afb90(i))->flag;
    case 5:
        return (self->bits >> (i + 1)) & 1;
    case 6:
    case 9:
        if ((self->mask >> (i + 1)) & 1)
            return 0;
        return ((unsigned short)(self->bits >> 16) >> (i + 1)) & 1;
    }
    if (self->mode < 0) {
        count = func_ov002_021afaf0();
        if (count > 1) {
            switch (self->kind) {
            case 0:
                mode = -self->mode;
                if (mode < 0x27)
                    return self->value == count;
                if (self->value > 0 || mode == 0x48)
                    return 1;
                return 0;
            case 1:
                if (func_ov002_022ac028((state_ov002_022ac028_t *)self, self->index) == 0) {
                    if (self->value < func_ov002_021afaf0())
                        return 1;
                }
                return 0;
            case 2:
                return func_ov002_022ac028((state_ov002_022ac028_t *)self, self->index) > 0;
            }
        }
    }
    return 1;
}

