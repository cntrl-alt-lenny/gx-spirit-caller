typedef struct {
    int w0;
    int w1;
    int w2;
} Rec_0200c594;

typedef struct {
    char pad[0x1c];
    Rec_0200c594 *recs;
    char pad2[0x40];
    unsigned int on : 1;
    unsigned int off : 1;
    unsigned int need : 1;
    unsigned int rest : 29;
    char pad3[0x18];
    unsigned int pad7c : 28;
    unsigned int armed : 1;
    unsigned int rest7c : 3;
    char pad4[0x1f8];
    int f278;
    int f27c;
    int f280;
} Obj_0200c594;

typedef struct {
    char pad[0xc];
    int count;
    int pad10;
    Obj_0200c594 *objs;
} List_0200c594;

extern List_0200c594 data_02186ae8;
extern void func_02092904(int a, int b);
extern void func_02090114(void);
extern void func_020900a0(int a, int b, int c);
extern void func_02090048(void);

int func_0200c594(void) {
    Obj_0200c594 *o = data_02186ae8.objs;
    int i;
    Rec_0200c594 *r;

    if (o == 0) {
        return 0;
    }
    for (i = 0; i < data_02186ae8.count; i++, o++) {
        if (o->f27c == 0 && o->off == 0 && o->on && o->need && o->armed) {
            r = &o->recs[o->f278];
            func_02092904(r->w0, r->w1);
            func_02090114();
            func_020900a0(r->w0, r->w2, r->w1);
            func_02090048();
            o->armed = 0;
            return 1;
        }
    }
    return 0;
}
