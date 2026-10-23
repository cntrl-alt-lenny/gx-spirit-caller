extern char data_ov004_0220e500[], data_ov004_0220b500[], data_ov004_022915e8[], data_021040ac[];
extern unsigned char data_02105a4c[];
extern int func_020347b8(void);
extern void *func_0202046c(void);
/* Original call supplies no argument despite the pointer-taking definition. */
extern void func_0201d364();
extern void func_0201d050(void *p);
extern void func_0201d384(void);
extern void *func_0201d040(void);
extern int func_0201d34c(void);
extern int func_0201cfe0(void);
extern int func_02034844(void);
extern int func_02034888(int p0, void *p1, int p2);
extern void func_02012454(int index, unsigned char *src);
extern void func_020124a4(int index, unsigned char *dst);
extern int func_02008f24(int mode, int a1, char *a2);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern char *func_0202c0c0(int);
extern int func_ov004_021cf070(void), func_ov004_021ced78(void);
extern void func_ov004_021c9ef0(int);
extern void func_ov004_021cedf8(void), func_ov004_021cf600(void), func_ov004_021cf3a8(void), func_ov004_021ca198(void), func_ov004_021ce1ec(void);
extern void func_ov004_021d8798(void *, char *, int);
extern void func_ov004_021d8cd0(void *), func_ov004_021d8d58(void *), func_ov004_021d9134(void *);
static inline int active(void *p) { int result; if (*(int *)p != 0) result=1; else result=0; return result; }
static inline int mode(void) { return *(int *)(data_ov004_0220b500+0x44); }
#define F(o) (*(int *)(b+(o)))
int func_ov004_021cf638(void) {
    char *b;
    unsigned short msg;
    unsigned short choice[2];
    struct { unsigned short type; unsigned char data[0x124]; } p2;
    struct { unsigned short type; unsigned char data[0x124]; } p1;
    *(int *)(data_ov004_0220e500+0xbd8)=-1;
    b=data_ov004_0220b500;
    if (func_020347b8()==0) {
        F(0x48)=0; F(0x54)=0; F(0x58)=0; F(0x8c)=0;
        if (func_0202046c()!=0) { func_0201d364(); func_0201d050(0); }
        else func_0201d384();
        switch(active(data_ov004_022915e8)) { case 0: break; default: func_ov004_021d8cd0(data_ov004_022915e8); break; }
    } else if (func_ov004_021cf070()==0 && func_0201d34c()==0 && F(0x5c)==0) {
        if(mode()) {
            switch(F(0x54)) {
            case 4:
                func_0201d050(0);
                if(F(0x220)!=0) {
                    func_ov004_021c9ef0(0x100); F(0x54)++;
                    func_ov004_021d8798(data_ov004_022915e8,func_0202c0c0(0x101),1);
                    F(0x22c)=2;
                }
                break;
            case 5:
                if(F(0x224)==0) {
                    F(0x224)=1; choice[0]=4; choice[1]=F(0x22c);
                    func_02034888(3,choice,4);
                }
                if(F(0x224)!=0) F(0x224)++;
                if(F(0x228)!=0) F(0x228)++;
                if(F(0x224)>30 && F(0x228)>30) {
                    if(func_ov004_021ced78()!=0) {
                        F(0x234)=1;
                        if(F(0x22c)==2) {
                            func_0201d050((void *)3);
                            F(0x48)=3; F(0x54)=14; F(0x3c10)=0; F(0x3c0c)=0;
                        }
                    } else { F(0x228)=0; F(0x224)=0; }
                }
                break;
            }
        } else {
            switch(F(0x54)) {
            case 4:
                func_0201d050(0);
                if(F(0x220)!=0) { func_ov004_021c9ef0(0xe1); F(0x54)++; }
                break;
            case 5:
                func_ov004_021cedf8();
                if(F(0x224)!=0) F(0x224)++;
                if(F(0x228)!=0) F(0x228)++;
                if(F(0x224)>30 && F(0x228)>30) {
                    if(func_ov004_021ced78()!=0) {
                        F(0x234)=1;
                        switch(F(0x22c)) {
                        case 0:
                            func_0201d050((void *)1); F(0x54)=7; func_ov004_021c9ef0(0xd4);
                            func_02012454(func_02034844()==0,data_02105a4c); break;
                        case 1:
                            func_0201d050((void *)2); F(0x54)=7; func_ov004_021c9ef0(0xd4);
                            func_02012454(func_02034844()==0,data_02105a4c); break;
                        case 2:
                            func_0201d050((void *)3); F(0x48)=3; F(0x54)=14; F(0x3c10)=0; F(0x3c0c)=0; break;
                        case 3:
                            func_0201d050((void *)4); F(0x48)=8; F(0x54)=18; break;
                        case 4:
                            func_0201d050((void *)5); func_ov004_021c9ef0(0xdf);
                            F(0x54)=20; F(0x80)=0;
                            func_ov004_021d8798(data_ov004_022915e8,func_0202c0c0(0xdf),0); break;
                        }
                    } else {
                        F(0x228)=0; F(0x224)=0; func_ov004_021c9ef0(0xea); func_02037208(0x42,-1,0,1);
                    }
                }
                break;
            case 7: case 9:
                { int selected=(func_0201d040()==(void *)2); F(0x230)=selected; F(0x22c)=selected; } F(0x234)=1;
                if(F(0x220)!=0) {
                    if(func_0201cfe0()!=0) { p2.type=6; func_020124a4(0,p2.data); func_02034888(3,&p2,0x126); }
                    func_ov004_021c9ef0(0xd4); F(0x54)++;
                }
                break;
            case 19:
                if(*(int *)(data_021040ac+0x3c)>=0) {
                    p1.type=17; func_02008f24(0,*(int *)(data_021040ac+0x3c),(char *)p1.data); func_02034888(3,&p1,0x126);
                } else { msg=18; func_02034888(3,&msg,2); }
                F(0x54)=4; F(0x230)=0; F(0x22c)=0; F(0x220)=0; F(0x228)=0; F(0x224)=0;
                func_ov004_021d8798(data_ov004_022915e8,func_0202c0c0(0xdf),0);
                break;
            case 22:
                F(0x54)=4; F(0x220)=1; func_ov004_021d8cd0(data_ov004_022915e8); break;
            }
        }
    }
    func_ov004_021d8d58(data_ov004_022915e8);
    if(*(int *)(data_ov004_0220b500+0x44)!=0) func_ov004_021cf600(); else func_ov004_021cf3a8();
    func_ov004_021ca198(); func_ov004_021d9134(data_ov004_022915e8); func_ov004_021ce1ec();
    return 0;
}







