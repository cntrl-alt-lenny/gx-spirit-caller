typedef struct {
    char          _pad[0xeb4];
    unsigned int  flags;
} obj_020337b8_t;

extern void func_02032b30(void);
extern void func_02032bfc(void);
extern void func_02046c88(int a, void (*f1)(void), obj_020337b8_t *o1, void (*f2)(void),
                          obj_020337b8_t *o2);

void func_020337b8(obj_020337b8_t *o, int a) {
    o->flags &= ~0x2000;
    o->flags &= ~0x1000;
    o->flags &= ~0x4000;
    o->flags &= ~0x10000;
    o->flags &= ~0x40000;
    func_02046c88(a, func_02032b30, o, func_02032bfc, o);
}
