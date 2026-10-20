typedef struct { int f_0, f_4; unsigned short h_8, h_a; } state_4cl_t;
typedef struct { int f_0, f_4; unsigned short f_8, f_a; } state_021_4set_t;
typedef struct { int a, b; } Pair;
typedef Pair pair_0208904c_t;
typedef struct { int field_0, field_4, field_8, field_c, field_10; char pad14[4]; int field_18, field_1c; } Obj_t;
typedef struct { char pad0[8]; int ctx; unsigned int flags; char pad1[0x20]; Pair rec; char tail[0x10]; } Self;
struct Obj;
typedef struct {
    int f0;
    char obj[0x5c];
    int f60, f64;
    char pad68[0xc];
    int f74, f78, f7c, f80, f84;
    state_021_4set_t f88, f94, fa0;
    char padac[4];
    unsigned short fb0;
    char padb2[0xa];
    unsigned char fbc;
    char padbd[4];
    unsigned char fc1;
    char padc2[2];
} Entry;
extern state_4cl_t data_0219d070, data_0219d07c;
extern char data_0219d148[24][24];
extern Entry data_0219d388[8];
extern unsigned char data_0219d9a8[16];
extern struct { int a; char *b; } data_0219d068;
extern char data_0219d088[];
extern void func_0207d1b8(state_4cl_t *p, unsigned short v);
extern void func_0207d12c(char *r0, char *r1);
extern void func_0208904c(pair_0208904c_t *out);
extern void func_02098388(Obj_t *obj);
extern int func_02098088(Self *self, Pair p);
extern void func_020885a0(struct Obj *o);
extern void func_020385bc(state_021_4set_t *p, int v);
extern int func_02097ff0(int *self);
extern void func_0203c16c(void);
extern void func_02091d24(char *ctx, void (*entry)(void), int arg, char *stack, int size, int priority);
typedef struct { char _pad[0x64]; unsigned int flag; } ctx_020919d8_t;
extern void func_020919d8(ctx_020919d8_t *ctx);
void func_0203abe0(int priority) {
    Entry *p = data_0219d388;
    int i;
    char *q;
    Pair pair;
    Self ctx;
    func_0207d1b8(&data_0219d070, 0);
    func_0207d1b8(&data_0219d07c, 0);
    q = data_0219d148[0];
    for (i=0; i<24; i++,q+=24) func_0207d12c((char *)&data_0219d07c,q);
    func_0208904c(&pair);
    func_02098388((Obj_t *)&ctx);
    func_02098088(&ctx,pair);
    for (i=0; i<16; i++) data_0219d9a8[i]=0;
    for (i=0; i<8; i++,p++) {
        p->fbc=i;
        p->f60=p->f64=*(int *)((char *)&ctx+0x24);
        func_020885a0((struct Obj *)p->obj);
        p->fb0=0;
        p->f74=0; p->f78=0; p->f7c=0; p->f80=0; p->f84=0;
        p->fc1=0;
        func_020385bc(&p->f88,127);
        func_020385bc(&p->f94,127);
        func_020385bc(&p->fa0,64);
    }
    func_02097ff0((int *)&ctx);
    data_0219d068.a=0;
    func_02091d24(data_0219d088,func_0203c16c,0,data_0219d068.b+0x600,0x600,priority);
    func_020919d8((ctx_020919d8_t *)data_0219d088);
}



