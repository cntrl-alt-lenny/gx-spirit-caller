typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
    int f10;
    int pad14;
    int pad18;
    int pad1c;
    unsigned flag : 1;
    unsigned : 31;
} Ov006Slot;

int func_ov006_021bd6bc(char *obj, int sel) {
    Ov006Slot *s = (Ov006Slot *)(obj + 0xa0) + sel;
    int v;
    if (s->flag) {
        v = (s->f8 + s->f4) * 10 + s->f0;
    } else {
        v = s->f8 + s->f4;
    }
    if (v >= s->fc)
        v = -1;
    return v;
}
