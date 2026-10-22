typedef struct state_t state_t;
typedef struct { unsigned int a,b,c; } triple_020822a0_t;
typedef triple_020822a0_t triple_020822c8_t;
struct Mtx33 { int m[9]; };
struct Obj;
extern char data_ov004_0220b500[], data_02104dac[], data_021040ac[];
extern int data_ov004_022915e8[];
extern state_t data_02102c90;
extern struct { int pad; unsigned int language:3; } data_02104f4c;
extern short data_020bef80[];
extern triple_020822a0_t data_ov004_02200e00[];
extern triple_020822c8_t data_ov004_02200de8;
extern struct Mtx33 data_021a1974;
extern struct { char pad[0xfc]; unsigned int flags; } data_021a18b8;
extern struct Obj data_ov004_02211548;
extern void func_02001d0c(state_t *, int, int);
extern int func_0201d530(int);
extern char *func_0202c0c0(int);
extern int func_0202b100(int);
extern int OS_SPrintf(char *, const char *, ...);
extern void func_ov004_021d8798(void *, const char *, int);
extern void func_0202ba94(int,int);
extern int func_02037208(int,int,int,int);
extern void func_ov004_021d0168(int);
extern void func_ov004_021d02f4(void);
extern void func_ov004_021d8d58(void *);
extern void func_ov004_021d9134(void *);
extern void func_ov004_021d03ec(int);
extern void MTX_Identity33_(struct Mtx33 *);
extern void MI_Copy36B(const void *,void *);
extern void func_020822a0(const triple_020822a0_t *);
extern void func_020822c8(const triple_020822c8_t *);
extern void func_020822f0(void);
extern void func_02084aec(struct Obj *);
extern void func_02084fe0(void);
extern void func_0208e318(int *,int,int,int,int);
static inline int active(void) { if (data_ov004_022915e8[0]) return 1; else return 0; }
int func_ov004_021d3578(void) {
    char text[256];
    triple_020822a0_t a;
    triple_020822c8_t b;
    struct Mtx33 m;
    char *s = data_ov004_0220b500;
    int count = *(int *)(data_021040ac + 0xd54);
    int id = *(unsigned short *)(data_02104dac + 0x60);
    int fade;
    int v;
    if (*(int *)(s+0x5c)) return 0;
    if (*(int *)s >= 64 && active() == 0) {
        *(int *)(s+0x48)=0;
        *(int *)(s+0x54)=1;
        return 0;
    }
    if (*(int *)s < 32) {
        fade = *(int *)s - 20;
        if (fade < 0) fade=0;
    } else {
        fade=12;
        func_ov004_021d0168(id);
    }
    if (*(int *)s == 32) {
        func_02001d0c(&data_02102c90,26,7);
        func_0201d530(6);
        if (data_02104f4c.language) {
            OS_SPrintf(text,func_0202c0c0(216),count,func_0202b100(id));
        } else {
            OS_SPrintf(text,func_0202c0c0(216),func_0202b100(id),count);
        }
        func_ov004_021d8798(data_ov004_022915e8,text,2);
        func_0202ba94(id,count);
        *(int *)(data_021040ac+0xd54)=0;
        func_02037208(95,-1,0,1);
    }
    func_ov004_021d02f4();
    func_ov004_021d8d58(data_ov004_022915e8);
    func_ov004_021d9134(data_ov004_022915e8);
    v=*(int *)s-32;
    if (v<0) v=-v;
    if (v>32) v=32;
    func_ov004_021d03ec(data_020bef80[((v<<9)>>4)*2]);
    a=data_ov004_02200e00[2];
    b=data_ov004_02200de8;
    MTX_Identity33_(&m);
    MI_Copy36B(&m,&data_021a1974);
    data_021a18b8.flags&=~0xa4;
    func_020822a0(&a);
    func_020822c8(&b);
    func_020822f0();
    func_02084aec(&data_ov004_02211548);
    ++*(int *)s;
    func_020822f0();
    func_02084fe0();
    *(volatile unsigned int *)0x04000540=0;
    func_0208e318((int *)0x04000050,1,63,16,0);
    *(volatile unsigned int *)0x04001018=((12-fade)<<18)&0x01ff0000;
    func_0208e318((int *)0x04001050,4,63,fade,16-fade);
    return 0;
}




