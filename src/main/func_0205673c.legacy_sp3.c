typedef struct Owner Owner;
typedef struct { int first, second; } Pair;
struct Owner { unsigned char bytes[0x1a4]; Pair slots[6]; char tail[0x2bc]; };
extern int func_020453e8(int a);
/* Original caller passes only the allocation pointer. */
extern int func_020453b4();
/* This caller supplies three arguments to the argument-preserving thunk. */
extern int func_020a73d4(int x, int fill, int size);
extern int func_0205d944(Owner **pp);
extern void func_020604a4(int a, ...);
extern int func_02056594(Owner **pp);
extern void func_020566f4(void **a0);
extern void func_02055320(void);
extern int func_02055330(void);
extern void func_020a9950(void *p);
extern char data_020fff40[];
#define I(o) (*(int *)((char *)p + (o)))
int func_0205673c(Owner **out, int a, int b) {
    Owner *p;
    int i;
    int result;
    *out = 0;
    p = (Owner *)func_020453e8(0x490);
    if (p == 0) return 1;
    func_020a73d4((int)p, 0, 0x490);
    p->bytes[0] = 0;
    I(0x418) = 0;
    I(0x100) = 1;
    I(0x104) = 0;
    I(0x108) = 0;
    I(0x10c) = 0;
    I(0x46c) = a;
    I(0x470) = b;
    if (func_0205d944(&p) == 0) {
        func_020453b4((int)p);
        p = 0;
        return 1;
    }
    I(0x420) = 0;
    for (i = 0; i < 6; i++) {
        p->slots[i].first = 0;
        p->slots[i].second = 0;
    }
    I(0x460) = 0;
    func_020604a4((int)&p, data_020fff40);
    result = func_02056594(&p);
    if (result != 0) {
        func_020566f4((void **)&p);
        return result;
    }
    func_02055320();
    func_020a9950((void *)func_02055330());
    *out = p;
    return 0;
}



