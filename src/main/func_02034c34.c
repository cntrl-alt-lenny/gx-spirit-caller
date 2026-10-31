typedef struct { int f_0, f_4; unsigned short f_8, f_a; } state_021_4set_t;
typedef struct { int f_0; int f_4; int f_8, f_c; } state_021_4clear_t;
typedef struct { state_021_4set_t state; short f_c; short pad; } Entry;
typedef struct { char pad0[4]; int f4; char pad8[0x2c]; int f34; char pad38[0x32]; signed char f6a; char pad6b[2]; signed char f6d, f6e, f6f; char pad70[8]; } Item;
typedef struct { char pad0[4]; short f4, f6, f8; char pada[0x3e]; int f48; char pad4c[8]; int f54; } Global;
extern Global data_0219b2e0;
extern int data_0219b344[4];
extern Entry data_0219b3d0[3];
extern Item data_0219b760[28];
extern state_021_4clear_t data_0219b384, data_0219b36c, data_0219b354, data_0219b39c;
extern short data_020fe480;
extern void func_020385bc(state_021_4set_t *p, int v);
extern void func_020387ac(void);
extern void func_020388f0(int arg);
extern void func_02087ec8(int *p);
extern void func_02092844(state_021_4clear_t *p);
void func_02034c34(void) {
    int i;
    Entry *p;
    Item *q;
    data_0219b2e0.f8 = 0;
    data_0219b2e0.f48 = 0;
    data_0219b2e0.f4 = -1;
    for (i=0; i<4; i++) data_0219b344[i]=0;
    p=data_0219b3d0;
    for (i=0; i<3; i++,p++) {
        func_020385bc(&p->state,127);
        data_0219b3d0[i].f_c=127;
    }
    q=data_0219b760;
    for (i=0; i<28; i++,q++) {
        q->f34=0;
        q->f6a=q->f6d=q->f6e=-1;
        q->f6f=-1;
        func_02087ec8(&q->f4);
        q->f4=0;
    }
    func_020387ac();
    func_02092844(&data_0219b384);
    func_02092844(&data_0219b36c);
    func_02092844(&data_0219b354);
    func_02092844(&data_0219b39c);
    data_0219b2e0.f6=0;
    data_0219b2e0.f54=0;
    data_020fe480=-1;
    func_020388f0(0x55555555);
}
