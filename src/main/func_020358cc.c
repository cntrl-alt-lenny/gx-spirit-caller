typedef struct {
    char        _pad[0x60];
    short      *value;
    short       limit;
    short       stage;
    char        _68[0xb];
    signed char active;
} obj_020358cc_t;

extern void func_02038168(obj_020358cc_t *o, int id);

void func_020358cc(obj_020358cc_t *o) {
    int limit;
    int value;
    int id;

    if (o->active != 1) {
        return;
    }
    limit = o->limit;
    value = *o->value;
    id = -1;
    switch (o->stage) {
    case 0:
        limit >>= 1;
        id = 0x20;
        break;
    case 1:
        limit >>= 2;
        id = 0x30;
        break;
    case 2:
        limit >>= 3;
        id = 0x40;
        break;
    }
    if (id < 0) {
        return;
    }
    if (value > limit) {
        return;
    }
    func_02038168(o, id + 0x100);
    o->stage++;
}
