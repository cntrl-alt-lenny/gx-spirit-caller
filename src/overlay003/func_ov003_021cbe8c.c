typedef struct { int pad[3]; int count; } State;
extern int func_ov003_021cbf08(State *s);
extern int func_ov003_021cc010(State *s);
extern int func_ov003_021cc0d8(State *s);
extern int func_ov003_021ceeb4(void);

int func_ov003_021cbe8c(State *s) {
    switch (s->pad[0]) {
    case 0:
        if (func_ov003_021cbf08(s))
            s->pad[0] = 1;
        break;
    case 1:
        if (func_ov003_021ceeb4() == 0)
            s->pad[0] = 2;
        if (func_ov003_021cc0d8(s))
            s->pad[0] = 2;
        break;
    case 2:
        if (func_ov003_021cc010(s))
            return 1;
        break;
    }
    return 0;
}
