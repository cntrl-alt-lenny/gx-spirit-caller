typedef struct { short x0, y0, x1, y1; int value; } Rect;
typedef struct { int a, b, count; unsigned int enabled:1; unsigned int rest:31; } Record;
extern Rect data_ov006_021cddfc[];
extern Rect data_ov006_021cde14[];
extern short data_ov006_021cde2c[][2];
int func_ov006_021c43bc(char *self, int x, int y, int *out) {
    Record *rec = (Record *)(self + 0x9c) + *(int *)(self + 0x64);
    int i;
    Rect *p;
    int top, j, bottom;
    out[0] = 0; out[1] = 0; out[2] = 0;
    p = data_ov006_021cddfc;
    for (i = 0; i < 2; i++, p++) {
        if (x >= p->x0 && y >= p->y0 && x <= p->x1 && y <= p->y1) {
            out[0] = 1; out[1] = p->value; return 1;
        }
    }
    if (data_ov006_021cde2c[*(int *)(self + 0x58)][0] == 2) {
        p = data_ov006_021cde14;
        for (i = 0; i < 2; i++, p++) {
            if (x >= p->x0 && y >= p->y0 && x <= p->x1 && y <= p->y1) {
                out[0] = 3; out[1] = i; return 1;
            }
        }
    }
    for (j = 0, top = 30, bottom = 46; j < 6; j++, top += 19, bottom += 19) {
        if (j < 1 || rec->enabled || j < rec->count) {
            if (x >= 15 && y >= top && x < 212 && y < bottom) {
                out[0] = 2; out[1] = j; return 1;
            }
        }
    }
    out[0] = 0; return 0;
}


