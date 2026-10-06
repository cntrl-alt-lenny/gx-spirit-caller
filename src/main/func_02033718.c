typedef struct {
    char          _pad[0xeb4];
    unsigned int  flags;
} obj_02033718_t;

extern void func_020329dc(void);
extern void func_02032ac4(void);
extern void func_02046f24(int a, int b, void (*f1)(void), obj_02033718_t *o1,
                          void (*f2)(void), obj_02033718_t *o2);

void func_02033718(obj_02033718_t *o, int a, int b) {
    o->flags &= ~0x2000;
    o->flags &= ~0x1000;
    o->flags &= ~0x4000;
    o->flags &= ~0x10000;
    o->flags &= ~0x40000;
    func_02046f24(a, b, func_02032ac4, o, func_020329dc, o);
}
