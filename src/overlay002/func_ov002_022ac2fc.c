typedef struct { int f0,f4,f8,fc,f10,f14,f18,f1c; } Obj0229f088;
typedef struct { char pad[4]; int f4; char pad8[0x2c]; int f34; } ObjA16;
struct State {
    int f0,f4,f8,fc,f10,f14,f18,f1c,f20,f24,f28;
    char pad2c[0x34];
    int f60,f64; int *f68; char pad6c[4]; int *f70;
    char pad74[0x120];
    int f194; Obj0229f088 f198,f1b8,f1d8;
    int f1f8,f1fc,f200,f204,f208,f20c,f210,f214,f218;
    unsigned char f21c; char pad21d[3];
    int f220,f224,f228,f22c; unsigned char f230; char pad231[3];
    int f234,f238,f23c,f240;
};
extern char *func_0202b7cc(int idx);
extern int func_020a978c(char *, const char *, ...);
extern int func_ov002_021afaf0(void);
extern void *func_ov002_021afbc4(void);
extern void func_ov002_0229f088(Obj0229f088 *obj,int a,int b,int idx,int c,int d);
extern void func_ov002_0229f9a4(struct State *,int,char *,int);
extern void func_ov002_022ac0c0(struct State *self);
/* This call supplies only self, while other callers supply a second argument. */
extern void func_ov002_022a04b0();
extern void func_ov002_022ac9ec(struct State *,int);
extern int func_ov002_022a16b0(ObjA16 *s);
extern void func_ov002_022aeb60(void *self);
extern int data_ov002_022cd73c[];
extern int data_ov002_022cdc78[];
extern char data_ov002_022d1a9c[];
void func_ov002_022ac2fc(struct State *self,int kind) {
    char buf[0x100];
    char *text;
    char *fmt;
    if (kind < 5) {
        text=func_0202b7cc(0x246+(kind-1)*2+(data_ov002_022cdc78[0]==(data_ov002_022cd73c[1]^1)));
    } else if (kind == 5) {
        text=func_0202b7cc(0x24e);
    } else if (kind >= 8 && kind <= 0x26) {
        fmt=func_0202b7cc(0x250);
        func_020a978c(buf,fmt,func_ov002_021afaf0());
        text=buf;
    } else if (kind >= 0x29 && kind <= 0x47) {
        fmt=func_0202b7cc(0x251);
        func_020a978c(buf,fmt,func_ov002_021afaf0());
        text=buf;
    } else if (kind == 0x48) {
        text=func_0202b7cc(0x252);
    } else {
        text=func_0202b7cc(0x24f);
    }
    func_ov002_0229f9a4(self,-kind,text,0);
    func_ov002_022ac0c0(self);
    self->f28=0;
    self->f24=(int)func_ov002_021afbc4();
    self->f60=0;
    self->f64=0;
    func_ov002_022a04b0(self);
    func_ov002_022ac9ec(self,0);
    if (kind <= 5) {
        func_ov002_0229f088(&self->f198,14,16,1,0xac40,0);
        self->f194=1;
        self->f14=self->f1c=0;
    } else if (func_ov002_021afaf0()>1 || kind==0x48) {
        func_ov002_0229f088(&self->f1b8,10,16,14,0xa040,0);
        func_ov002_0229f088(&self->f1d8,10,16,13,0xac40,0);
        func_ov002_0229f088(&self->f198,18,16,11,0xb840,0);
        self->f1d8.f0=0;
        self->f1d8.f18=0;
        self->f194=3;
        self->f14=0;
    } else {
        func_ov002_0229f088(&self->f198,14,16,10,0xac40,0);
        self->f194=1;
        self->f14=0;
    }
    if ((int)func_ov002_021afbc4()>6) {
        if (self->f21c!=1) {
            self->f21c=1;
            self->f214=-1;
        }
        { int y=func_ov002_022a16b0((ObjA16 *)self);
        self->f1fc=32;
        self->f200=y+0x69; }
        self->f220=22;
        self->f224=24;
        self->f228=24;
        self->f22c=0x90;
        self->f240=6;
        self->f230=1;
        { int n=(int)func_ov002_021afbc4();
        self->f238=0;
        self->f23c=n-6;
        self->f214=-1; }
    }
    func_ov002_022aeb60(data_ov002_022d1a9c);
}

