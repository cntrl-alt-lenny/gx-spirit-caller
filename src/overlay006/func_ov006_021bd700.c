typedef struct {
    int f0, f4, f8, fc, f10;
    int pad14, pad18, pad1c;
    unsigned flag : 1;
    unsigned : 31;
} Ov006Slot;

int func_ov006_021bd700(char *obj, int sel, int value) {
    Ov006Slot *s = (Ov006Slot *)(obj + 0xa0) + sel;
    int threshold;
    if (value >= s->fc && s->fc > 0)
        return 0;
    if (!s->flag) {
        s->f0 = 0;
        s->f4 = value;
        s->f8 = 0;
    } else {
        s->f0 = value % 10;
        s->f4 = value / 10;
        s->f8 = 0;
    }
    threshold = (*(int *)(obj + 0x50) == 4) ? 3 : 4;
    while (s->f4 > 0 && s->f10 - s->f8 > threshold) {
        s->f4--;
        s->f8++;
    }
    return 1;
}


