typedef struct {
    char          _pad[0xeb4];
    unsigned int  flags;
} obj_020336cc_t;

extern void func_02032998(void);
extern void func_02032c78(void);
extern void func_02032a00(void);
extern int func_02046fc4(int a, void (*f1)(void), obj_020336cc_t *o1, void (*f2)(void),
                          obj_020336cc_t *o2, void (*f3)(void), obj_020336cc_t *o3);

int func_020336cc(obj_020336cc_t *o) {
    int r = func_02046fc4(0, func_02032c78, o, func_02032a00, o, func_02032998, o);
    o->flags |= 0x200;
    return r;
}
