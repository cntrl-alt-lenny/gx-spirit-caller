typedef struct { int f0, f4, f8, fc; } Req;
typedef struct { int f0, f4; } Out;
extern void func_0201e7e0();
extern int func_0201ef10(int);
extern int func_0201ede4(int, int);
extern void func_0201ef90(int *, int *, int *, int, int, int, Req *, int, int, Out *);
extern int func_ov000_021acaac(int *);
struct State {
    int a0, a4, a8;
    char pad[0x5c];
    Out out;
    int task;
    int *ptr;
    int a78, a7c;
    char pad80[0x18];
    unsigned flags;
    unsigned low:16;
    unsigned high:16;
};
void func_ov000_021ac920(struct State *s, int *input, int value) {
    int table[4];
    int i;
    int mode;
    if (s->out.f0 != 0) func_ov000_021acaac((int *)s);
    for (i=0; i<4; i++) table[i]=input[i];
    if ((s->flags << 2) >> 31) table[3]=0;
    s->high=value;
    func_0201e7e0();
    mode = func_0201ef10((s->flags << 15) >> 27);
    func_0201ef90(&s->a0, &s->a4, &s->a8, s->a78, s->a7c,
        mode, (Req *)table,
        (s->flags << 7) >> 31, value, &s->out);
    if ((s->flags << 2) >> 31) {
        s->task=func_0201ede4((int)&s->ptr,input[3]);
        s->ptr[1]=(s->flags << 7) >> 31;
        s->flags |= 0x40000000;
    }
}

