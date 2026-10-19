typedef struct { short a, b, c, d; } Rect;
typedef struct { Rect rect[5]; } Rects;
typedef struct { int a, b, c, d, e; char pad[32]; Rect rect[5]; } State;
typedef struct { int a, b, count, value; } Input;
extern State data_ov000_021b1d4c;
extern Rects data_ov016_021b8e34;
/* The original caller passes this pointer although the C callee ignores it. */
extern int func_ov005_021aa4b0(State *s);
int func_ov016_021b75c8(Input *arg) {
    State *s = &data_ov000_021b1d4c;
    Rects local = data_ov016_021b8e34;
    int i;
    if (arg->count > 6) {
        func_ov005_021aa4b0(s);
        s->a = 0;
        for (i = 0; i < 5; i++) {
            s->rect[i].a = local.rect[i].a;
            s->rect[i].b = local.rect[i].b;
            s->rect[i].c = local.rect[i].c;
            s->rect[i].d = local.rect[i].d;
        }
        s->b = arg->value;
        s->c = arg->count - 6;
        s->d = 6;
        s->e = 0;
    }
    return 1;
}



