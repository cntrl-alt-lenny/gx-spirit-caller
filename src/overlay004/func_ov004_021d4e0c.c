typedef struct { char pad[0xeb4]; unsigned int flags; } obj_02033718_t;
typedef struct { int f0; unsigned char b4,b5,buf[15],b15,pad[2]; int f18; } Obj_02033d3c;
typedef struct { int active; unsigned char state,mode,data[18],ctx[16]; } elem_02033d78_t;
extern void *func_0202c0c0(int);
extern void *func_0203268c(void);
/* The assembly consumes r0 from this tail-call wrapper; its C definition currently says void. */
extern int func_02033718(obj_02033718_t *, int, int);
extern void func_02033828(int,int,int);
extern void func_02033d3c(Obj_02033d3c *,void *,int);
extern void func_02033d78(elem_02033d78_t *,int);
extern int OS_SPrintf(char *,const char *,...);
extern char *func_020aaf10(char *,const char *);
extern void func_ov004_021cded0(int);
extern int func_ov004_021d3f44(char *);
extern int func_ov004_021d8798(void *,void *,int);
extern int data_021040ac[];
struct G594c { char pad[0x58]; unsigned short value; }; extern struct G594c data_0210594c;
extern char *data_ov004_02209ec0[];
extern char data_ov004_02209f88[],data_ov004_0220a010[],data_ov004_0220a01c[],data_ov004_0220a028[],data_ov004_0220a034[];
extern char data_ov004_0220a040[],data_ov004_0220a054[],data_ov004_0220a068[],data_ov004_0220a07c[],data_ov004_0220a094[];
struct G_e500 { char pad[0xc94]; int c94, c98; int c9c; char padca0[0x28]; int cc8; }; extern struct G_e500 data_ov004_0220e500;
extern int data_ov004_0220b500[],data_ov004_022915e8[];

static inline int total(int count, int base) { count *= 1000; return count + base; }
struct Widget { Obj_02033d3c obj; char tail[0xc]; };
struct State { char pad0[0x38]; int flag; char pad3c[0x21c]; int message; char pad25c[0x20]; struct Widget widget[5]; };
void func_ov004_021d4e0c(struct State *p) {
    char buf[256];
    int flag;
    int value;
    int *base;
    if (p->flag) { p->flag=0; flag=1; } else flag=0;
    if (flag) {
        func_ov004_021d8798(data_ov004_022915e8,func_0202c0c0(0x66c),3);
        func_ov004_021cded0(0);
        func_02033828((int)func_0203268c(),2,0x7530);
        func_02033d3c(&p->widget[0].obj,data_ov004_0220a010,data_ov004_0220e500.c94+1000);
        func_02033d3c(&p->widget[1].obj,data_ov004_0220a01c,data_021040ac[13]);
        func_02033d3c(&p->widget[2].obj,data_ov004_02209f88,total(data_ov004_0220e500.c9c,data_0210594c.value));
        func_02033d3c(&p->widget[3].obj,data_ov004_0220a028,data_ov004_0220e500.cc8);
        func_02033d3c(&p->widget[4].obj,data_ov004_0220a034,data_ov004_0220e500.c98);
        func_02033d78((elem_02033d78_t *)&p->widget[0],5);
        p->message=0;
    }
    if (p->message==0) {
        base = data_ov004_0220b500;
        OS_SPrintf(buf,data_ov004_0220a040,data_ov004_0220e500.c94+1000);
        if (data_ov004_0220e500.c98==0) {
            func_020aaf10(buf,data_ov004_0220a054);
            func_020aaf10(buf,data_ov004_02209ec0[data_021040ac[13]]);
        } else {
            func_020aaf10(buf,data_ov004_0220a068);
            func_020aaf10(buf,data_ov004_02209ec0[data_021040ac[13]]);
            func_020aaf10(buf,data_ov004_0220a07c);
        }
        if (base[0xf28]==0) func_020aaf10(buf,data_ov004_0220a094);
        p->message=func_02033718(func_0203268c(),2,(int)buf);
    }
    func_ov004_021d3f44((char *)p);
}

















