extern void *func_020498f0(void);
extern void func_020498dc(int);
extern int func_02049038(int, char *, char *);
extern int func_02049120(int);
extern int func_0204ab88(int);
extern void func_0204b0a8(void);
extern int func_0204b0d0(int);
extern void func_0204bb5c(int, int);
extern void func_0204bf00(void);
extern int func_0204cf7c(int, int, int);
/* The original caller tests r0; the existing void definition omits the forwarded result. */
extern int func_0204d438(int);
extern int func_0204ead0(unsigned char, void *, int, int, const int *, int);
extern void func_0204f280(void);
extern int func_0204f820(void);
extern void func_02065e40(void);
typedef struct Mgr Mgr;
extern void func_020673dc(Mgr *);
extern int func_02068cd8(char *);
typedef struct F02068f54 F02068f54;
extern void func_02068f54(F02068f54 *);
extern long long func_020930b0(void);
extern char data_020ff9c4[];
extern unsigned char data_0219dc8c[];
#define B(o) (*(unsigned char *)((char *)func_020498f0()+(o)))
#define W(o) (*(int *)((char *)func_020498f0()+(o)))
#define P(o) (*(void **)((char *)func_020498f0()+(o)))
#define A(o) ((int *)((char *)func_020498f0()+(o)))
#define H(o) ((unsigned short *)((char *)func_020498f0()+(o)))
#define C(o) ((unsigned char *)func_020498f0()+(o))

void func_0204c40c(unsigned int action) {
    int values[5];
    int count = 3;
    int cleanup = 0;
    int i;
    switch (action) {
    case 0:
        if (B(0x1a4) < B(0xd)-1) {
            func_020498dc(13);
            values[0] = A(0xf4)[B(0x1a4)+1];
            values[1] = B(0x1a4)+1;
            values[2] = C(0x2d0)[B(0x1a4)+1];
            values[3] = A(0x24)[B(0x1a4)+1];
            values[4] = H(0xa4)[B(0x1a4)+1];
            count = 5;
        } else {
            B(0x17)=0;
            W(0x20)=0;
            func_020673dc(P(0x10));
            if (B(0x15)==0) func_020498dc(3);
            else if (B(0x15)==1) func_020498dc(4);
            else func_020498dc(10);
            B(0x1a4)=0;
            if (B(0x15)==2 || B(0xd)==B(0x16)) {
                if (B(0x15)==2) W(0x20c)=A(0xf4)[B(0xd)];
                else {W(0x20c)=0; W(0xf4)=W(0x200);}
                func_020498dc(16);
                W(0x1d4)=0;
                for(i=1;i<=B(0xd);i++) func_0204bb5c(C(0x2d0)[i],2);
            } else {
                values[0]=0;
                values[1]=B(0xd);
                values[2]=C(0x2d0)[B(0xd)];
                if(B(0x15)==0) {
                    char *p;
                    long long t;
                    W(0xe8)=2;
                    p=func_020498f0();
                    t=func_020930b0();
                    *(int *)(p+0xec)=(int)t;
                    *(int *)(p+0xf0)=(int)(t>>32);
                } else if(B(0x15)==1) {
                    func_0204cf7c(1,0,0);
                    if(B(0x1a6)==0 && B(0xd)>=2) {
                        if(W(0x1dc)!=(func_0204b0d0(0)&~(1<<C(0x2d0)[B(0xd)]))) {
                            func_0204bf00();
                            break;
                        }
                    }
                }
            }
            if(B(0x15)!=2) cleanup=1;
        }
        if(W(0x1a0)!=16) {
            if (func_0204d438(func_0204ead0(8,((void **)((char *)func_020498f0()+0xf4))[B(0xd)],A(0x24)[B(0xd)],H(0xa4)[B(0xd)],values,count))!=0) return;
            B(0x3cd)=0;
        }
        break;
    case 1:
        func_020498dc(1);
        if(B(0x15)==3) W(0x20c)=A(0xf4)[B(0xd)];
        cleanup=1;
        break;
    case 2:
        func_020498dc(1);
        if(B(0x15)==0 || B(0x15)==1) {B(0x17)=1;W(0x20)=W(0x200);}
        func_0204b0a8();
        if(B(0xd)>1) {
            if(func_0204d438(func_0204ead0(9,P(0xf4),A(0x24)[0],H(0xa4)[0],&A(0xf4)[B(0xd)-1],1))!=0) return;
        }
        break;
    case 3:
        func_020498dc(1);
        func_0204b0a8();
        W(0x20c)=0;
        cleanup=1;
        break;
    case 4:
        if(B(0x15)!=2) func_02049038(2,data_020ff9c4,0);
        {
            int zero = W(0x20c)==0;

            int key;
            char *p=func_020498f0();
            key=func_02049120(W(0x20c));
            (*(void (**)(int,int,int,int,int,int))(p+0x464))(0,0,zero,0,key,W(0x468));
        }
        if(B(0x15)==0 || B(0x15)==1) func_0204f280();
        else {
            if(W(0xe4)!=0) {func_02068f54(P(0xe4));W(0xe4)=0;}
            func_02065e40();
            if(B(0x15)==2) {
                if(func_0204ab88(func_0204f820())!=0) return;
                if(data_0219dc8c[0]==1) data_0219dc8c[1]=1;
                func_020498dc(10);
            } else func_020498dc(1);
            W(0x20c)=0;
        }
        B(0x1a9)=0;
        break;
    }
    if(cleanup && B(0x15)!=3) func_02068cd8(P(0xe4));
}



