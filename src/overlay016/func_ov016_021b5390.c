struct Ov016State {
    int pad[6];
    int value;
    int kind;
};

int func_ov016_021b5390(struct Ov016State *p) {
    switch (p->kind) {
    case 0:
        return p->value + 1;
    case 1:
        if (p->value < 3) return p->value + 4;
        return 13;
    case 2:
        if (p->value < 3) return p->value + 7;
        return 12;
    case 3:
        switch (p->value) {
        case 0: return 0;
        case 1: return 10;
        case 2: return 11;
        }
    }
}
