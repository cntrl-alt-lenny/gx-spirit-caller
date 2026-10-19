typedef struct {
    unsigned short x, y;
    unsigned char width, height;
} Ov016Rect;
struct Ov016Row { char data[10]; };
extern struct Ov016Row data_ov016_021b9184[];
extern int func_ov016_021b287c(Ov016Rect *rect);
struct Ov016State { int pad[6]; int value; int kind; };
int func_ov016_021b5284(struct Ov016State *p) {
    int found = 15;
    int i;
    for (i = 0; i < 14; i++) {
        if (func_ov016_021b287c((Ov016Rect *)&data_ov016_021b9184[i + 1])) {
            found = i;
            break;
        }
    }
    if (found < 15) {
        switch (found) {
        case 0:
        case 1: p->value = found + 1; p->kind = 3; break;
        case 2: p->value = 3; p->kind = 2; break;
        case 3: p->value = 3; p->kind = 1; break;
        default: {
            int v = found - 4;
            if (v == 0) { p->value = 0; p->kind = 3; }
            else if (v >= 1 && v <= 9) {
                found -= 5;
                p->value = found % 3;
                p->kind = found / 3;
            }
            break;
        }
        }
        return 1;
    }
    return 0;
}
