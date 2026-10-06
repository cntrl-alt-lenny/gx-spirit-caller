typedef struct {
    char pad[0x3c];
    int f3c;
    int f40;
    char pad2[0xb64 - 0x44];
    int state;
} State_02001448;

typedef struct {
    char pad[0x10];
    unsigned int f10;
    unsigned int f14;
} Obj_02001448;

extern State_02001448 data_021040ac;
extern int func_0200111c(void);
extern void func_02000cc4(void);
extern Obj_02001448 *func_02018b94(void);

int func_02001448(void) {
    State_02001448 *s = &data_021040ac;
    Obj_02001448 *o;

    if (func_0200111c() != 0) {
        return 0;
    }
    switch (data_021040ac.f3c - 1) {
    case 0:
        switch (data_021040ac.f40) {
        case 1:
            func_02000cc4();
            s->state = 0x17;
            break;
        case 2:
            func_02000cc4();
            s->state = 0x1f;
            break;
        }
        break;
    case 1:
        switch (data_021040ac.f40) {
        case 1:
            func_02000cc4();
            s->state = 0x19;
            break;
        case 2:
            func_02000cc4();
            s->state = 0x1b;
            break;
        }
        o = func_02018b94();
        o->f14 &= ~0xff;
        o = func_02018b94();
        o->f10 &= ~0x200;
        break;
    case 2:
        func_02000cc4();
        s->state = 0x2b;
        break;
    case -1:
        return 1;
    }
    return 0;
}
