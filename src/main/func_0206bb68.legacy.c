typedef struct Config {
    int mode;
    int pad[5];
    int (*alloc)(int);
    int f1c;
    int f20;
    int size;
    int buffer;
    void *value;
    int width;
    int height;
} Config;
typedef struct State {
    int mode;
    int (*alloc)(int);
    int f8;
    void (*callback)(void);
    int (*ready)(void);
    int f14;
    int f18;
    int buffer;
    int size;
    int width;
    int f28;
    int f2c;
} State;
extern Config *data_0219ecd8;
extern State data_0219ecec;
extern int data_0219ecdc, data_0219ece0, data_0219ece4, data_0219ef1c;
extern short data_02101e64[];
extern int func_0206bab0(void);
extern void func_0206bad4(void);
extern void func_0206baec(void);
extern void func_0206dbbc(void);
extern void func_02073a5c(int a, int b, int c, int d);
extern void func_02074088(void *value);
extern void func_02074124(void *p);
extern void func_02074194(State *p);
extern void func_0207cbbc(int arg);
extern void func_020945f4(void *dest, int value, unsigned int size);
void func_0206bb68(void) {
    State *s = &data_0219ecec;
    Config *cfg = data_0219ecd8;
    int width, height;
    void *value;
    func_020945f4(s, 0, 0x30);
    s->alloc = cfg->alloc;
    s->f8 = cfg->f1c;
    s->ready = func_0206bab0;
    s->f14 = 0;
    s->f18 = 0;
    s->f2c = data_0219ecdc;
    if (cfg->size) s->size = cfg->size;
    else s->size = 0x4000;
    if (cfg->buffer) s->buffer = cfg->buffer;
    else s->buffer = data_0219ecd8->alloc(s->size);
    width = cfg->width;
    height = cfg->height;
    if (!width) width = 0x240;
    if (!height) height = 0x10c0;
    s->width = width - 0x28;
    data_02101e64[1] = height;
    data_02101e64[2] = height / 2;
    data_0219ef1c = 0;
    if (cfg->mode) {
        data_0219ece4 = 1;
        s->mode = 0;
        s->callback = func_0206bad4;
        s->f28 = data_0219ece0;
    } else {
        data_0219ece4 = 0;
        s->mode = 1;
        s->callback = func_0206baec;
    }
    value = cfg->value;
    if (!value) value = (void *)0xb;
    func_02074088(value);
    func_0207cbbc((int)func_02073a5c);
    func_02074124(func_0206dbbc);
    func_02074194(s);
}

