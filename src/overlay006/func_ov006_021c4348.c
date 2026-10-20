typedef struct { short x0, y0, x1, y1; int value; } Rect;
extern Rect data_ov006_021cde48[];
int func_ov006_021c4348(char *self, int x, int y, int *out) {
    int i;
    Rect *p;
    out[0] = 0; out[1] = 0; out[2] = 0;
    p = data_ov006_021cde48;
    for (i = 0; i < 8; i++, p++) {
        if (x >= p->x0 && y >= p->y0 && x <= p->x1 && y <= p->y1) {
            out[0] = 1;
            out[1] = p->value;
            return 1;
        }
    }
    out[0] = 0;
    return 0;
}
