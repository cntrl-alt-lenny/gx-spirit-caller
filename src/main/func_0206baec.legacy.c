typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
    int f10;
    int f14;
} cfg_0206baec_t;

typedef struct {
    int a;
    int b;
} pair_0206baec_t;

extern cfg_0206baec_t *data_0219ecd8;
extern unsigned int data_0219ece4;
extern int data_0219eee8;
extern int data_0219eef8;
extern int data_0219ef1c;
extern pair_0206baec_t data_0219ef34;

void func_0206baec(void) {
    cfg_0206baec_t *c = data_0219ecd8;
    unsigned int fl = data_0219ece4;

    data_0219ef1c = c->f4;
    data_0219eee8 = c->f8;
    data_0219eef8 = c->fc;
    data_0219ef34.a = c->f10;
    data_0219ef34.b = c->f14;
    data_0219ece4 = fl | 2;
}
