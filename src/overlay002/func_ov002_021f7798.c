typedef struct {
    unsigned short id;
    unsigned short lo : 6;
    unsigned short kind : 6;
    unsigned short mode : 2;
    unsigned short hi : 2;
} Rec;

extern int func_ov002_021f4a84(void *self, int arg);

int func_ov002_021f7798(Rec *self, int arg) {
    if (self->mode == 1 && self->kind == 5) {
        return 1;
    }
    switch (self->id) {
    case 0x1503:
        return func_ov002_021f4a84(self, arg);
    }
    return 1;
}
