typedef struct {
    char pad[0xb64];
    int state;
} State;
typedef struct {
    char pad[0x14];
    unsigned int id : 8;
    unsigned int rest : 24;
    int unused;
    unsigned int low : 8;
    signed int value : 8;
    signed int kind : 5;
    unsigned int high : 11;
} Entry;
extern State data_021040ac;
extern void func_02000cc4(void);
extern int func_02000d4c(void);
extern void func_02000e34(void);
extern void func_020124f4(int, int, int);
extern void func_020125ac(int);
extern void func_02018b34(int value);
extern int func_02018b48(void);
extern char *func_02018b94(void);
int func_02000fc8(void) {
    State *s = &data_021040ac;
    switch (func_02018b48()) {
    case 1:
        if (((Entry *)func_02018b94())->kind == 4) {
            func_020125ac(1);
        } else {
            func_020124f4(((Entry *)func_02018b94())->id,
                         ((Entry *)func_02018b94())->kind,
                         ((Entry *)func_02018b94())->value);
        }
        func_02000cc4();
        s->state = 0x33;
        break;
    case 2: func_02000e34(); break;
    case 3: func_02000cc4(); s->state = 0xd; break;
    case 4: s->state = func_02000d4c() - 1; break;
    case 5: func_02000cc4(); s->state = 0x29; break;
    case 6: func_02000cc4(); s->state = 3; break;
    case 7: s->state = 0x23; break;
    case 8: func_02000cc4(); s->state = 0x21; break;
    case 9: func_02000cc4(); s->state = 0x2b; break;
    case 10: func_02000cc4(); s->state = 0xb; break;
    default: return 0;
    }
    func_02018b34(0);
    return 1;
}
