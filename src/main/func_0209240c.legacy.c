extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091a8c(void *);
extern void func_02091a0c(void *);
extern long long func_020b3870(int numerator, int denominator);

typedef struct Container {
    char          full[0x08];
    char          empty[0x08];
    int          *base;
    int           capacity;
    int           index;
    int           count;
} Container;

int func_0209240c(Container *c, int value, int flagarg)
{
    int irq = OS_DisableIrq();
    if (c->capacity <= c->count) {
        flagarg &= 1;
        do {
            if (flagarg == 0) {
                OS_RestoreIrq(irq);
                return 0;
            }
            func_02091a8c(c);
        } while (c->capacity <= c->count);
    }
    c->index = func_020b3870(c->index + c->capacity - 1, c->capacity) >> 32;
    c->base[c->index] = value;
    c->count = c->count + 1;
    func_02091a0c(c->empty);
    OS_RestoreIrq(irq);
    return 1;
}
