extern long long func_020b3988(unsigned int a, unsigned int b);

typedef struct {
    int field0;
    unsigned short field4;
} Q_02064d88;

typedef struct {
    Q_02064d88 *q;
} T_02064d88;

int func_02064d14(T_02064d88 *p, unsigned int divisor) {
    Q_02064d88 *q = p->q;
    return (int)(func_020b3988(q->field0 * q->field4, divisor) >> 32);
}
