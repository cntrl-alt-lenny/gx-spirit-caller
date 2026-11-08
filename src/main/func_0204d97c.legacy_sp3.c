typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;
typedef struct Mgr Mgr;
extern void *func_020498f0(void);
extern int func_020469b4(void);
extern void func_0204b0a8(void);
extern void func_020498dc(int);
extern int func_02049120(int);
extern int func_02046b3c(int);
extern int func_0204b134(int,int);
extern int func_0204b280(int);
extern int func_0204b62c(int,int,int);
extern void func_0204bd8c(void);
extern int func_0204be40(void);
extern void func_0204bf00(void);
extern void func_0204bf44(int);
extern int func_0204c04c(void);
extern int func_0204c384(int *,u32);
extern void func_0204c40c(unsigned int);
extern int func_0204ca70(void);
extern int func_0204cb54(int);
extern int func_0204cc20(int);
extern void *func_0204ce3c(int);
extern int func_0204ce90(void *);
extern int func_0204cf7c(int,int,int);
/* The original consumes the dispatch targets' return in r0. */
extern int func_0204d438(int);
extern void func_0204d468(u32,u32 *);
extern int func_0204d4b4(int,int,int);
extern int func_0204d674(int,int,int,int,int);
/* This caller passes the full result of func_0204d674 in r0, without
 * the narrowing implied by the callee's current unsigned-char definition. */
extern int func_0204ead0(int,void *,int,int,const int *,int);
extern int func_0204ed50(int,u32,void *);
extern int func_0204f0a8(int);
extern int func_0204a9b0(int);
extern int func_0204aaf4(int);
extern void func_02050054(int,int);
extern int func_02062510(void *);
extern int func_02062530(int *);
extern void func_02065788(int);
extern void func_020673dc(Mgr *);
/* Thunk's preserved r0 is consumed by this caller. */
extern void *func_02068cc8(void *,int);
extern long long func_020930b0(void);
extern u64 func_020b3808(u64,u64);
typedef struct { u8 kind, count; u16 port; u32 addr; int active; } Info;
extern void func_02049990(int,int,Info *,Info *);
extern void *data_0219dc84;
typedef struct { char pad[0x24]; int arr24[32]; u16 arra4[40]; int entries[48]; } Entries;
#define W(p,o) (*(int *)((char *)(p)+(o)))
#define U(p,o) (*(u32 *)((char *)(p)+(o)))
#define P(p,o) (*(void **)((char *)(p)+(o)))
#define B(p,o) (*(u8 *)((char *)(p)+(o)))
#define H(p,o) (*(u16 *)((char *)(p)+(o)))
#define Q(p,o) (*(long long *)((char *)(p)+(o)))
#define DISPATCH(x) func_0204d438(x)
int func_0204d97c(int a, void *b, int c, int d, int *e, int f) {
    int values[64];
    int id;
    struct { u8 kind, count; u16 port; u32 addr; } packet;

    int n = 0;
    int i, v, index;
    u16 half;
    u8 byte;
    void *p;
    void *q;
    if (func_020498f0() == 0 || W(func_020498f0(),0x1a0) == 0) return 1;
    if (func_020469b4() == 5 && W(func_020498f0(),0x1a0) == 1 && (int)b == W(func_020498f0(),0xf4)) func_0204b0a8();
    switch (a) {
    case 1: case 11:
        if (B(func_020498f0(),0x15) != 0) { c=e[1]; d=(u16)e[2]; }
        f=func_0204d674((int)b,c,d,e[0],a==11);
        if (f==2) {
            W(func_020498f0(),0x1dc)=0;
            if (DISPATCH(func_0204d4b4((int)b,c,d))) return 0;
            if (B(func_020498f0(),0x15)==2 && P(func_020498f0(),0x46c)!=0) {
                p=func_020498f0(); v=func_02049120((int)b);
                ((void (*)(int,int))P(p,0x46c))(v,W(func_020498f0(),0x470));
            }
            values[0]=B(func_020498f0(),0x14);
            for(n=1;n<=B(func_020498f0(),0x14);n++) values[n]=((Entries *)func_020498f0())->entries[n];
            values[n++]=W(func_020498f0(),0x1c);
            values[n++]=H(func_020498f0(),0x1a);

            func_020498dc(11);
        } else if(f==3) {
            if(B(func_020498f0(),0x16)!=0) {
                p=func_020498f0();
                if(B(p,0x14)==B(func_020498f0(),0x16) && B(func_020498f0(),0x15)==2) { values[0]=16; n=1; }
            }
        }
        if(f!=255 && DISPATCH(func_0204ead0(f,b,c,d,values,n))) return 0;
        break;
    case 2:
        if(W(func_020498f0(),0x1a0)!=4 || (int)b!=W(func_020498f0(),0x204)) break;
        W(func_020498f0(),0x208)=0;
        B(func_020498f0(),0x1a7)=0;
        W(func_020498f0(),0x1c8)=0;
        W(func_020498f0(),0x1bc)=0;
        W(func_020498f0(),0x24)=*(e+e[0]+1);
        H(func_020498f0(),0xa4)=*(e+e[0]+2);
        W(func_020498f0(),0x1b8)=*(e+e[0]+1);
        H(func_020498f0(),0x1b4)=*(e+e[0]+2);
        if(B(func_020498f0(),0x15)==1) {
            if(func_0204c384(e+1,e[0])) {
                if(B(func_020498f0(),0xd)!=0) func_0204d468((u32)b,(u32 *)e);
            } else {
                if(DISPATCH((int)func_0204ce3c((int)b))) return 0;
                if(DISPATCH(func_0204cf7c(0,0,(int)b))) return 0;
                break;
            }
        }
        if(B(func_020498f0(),0x15)==0) {
            if(B(func_020498f0(),0xd)!=0) {
                func_0204d468((u32)b,(u32 *)e);
                if(DISPATCH(func_0204ca70())) return 0;
            }
            func_020498dc(6);
            if(func_0204a9b0(func_0204ed50(0,0,func_02068cc8(P(func_020498f0(),0xe4),0)))) return 0;
        } else {
            func_020498dc(5);
            if(func_0204aaf4(func_0204f0a8((int)b))) return 0;
        }
        break;
    case 3:
        if(W(func_020498f0(),0x1a0)!=4 || (int)b!=W(func_020498f0(),0x204)) break;
        if(f>0 && e[0]==16) { func_02050054(13,0); return 0; }
        return func_0204ce90(P(func_020498f0(),0x204));
    case 4:
        if(W(func_020498f0(),0x1a0)!=4 || (int)b!=W(func_020498f0(),0x204)) break;
        p=func_020498f0(); Q(p,0x1cc)=func_020930b0();
        if((W(func_020498f0(),0x208)!=0 && B(func_020498f0(),0x1a7)<16) || B(func_020498f0(),0x15)==3) {
            W(func_020498f0(),0x1bc)=1;
            p=func_020498f0(); Q(p,0x1c0)=func_020930b0();
            if(B(func_020498f0(),0x15)!=3) B(func_020498f0(),0x1a7)++;
        } else {
            W(func_020498f0(),0x208)=0; B(func_020498f0(),0x1a7)=0;
            if(B(func_020498f0(),0x15)==0) {
                func_020498dc(3); W(func_020498f0(),0xe8)=1;
                p=func_020498f0(); Q(p,0xec)=func_020930b0();
            } else if(B(func_020498f0(),0x15)==1) func_0204cf7c(1,0,0);
        }
        break;
    case 5:
        if(B(func_020498f0(),0x17)==0 || (int)b!=W(func_020498f0(),0x20)) break;
        if(B(func_020498f0(),0x15)==2 && B(func_020498f0(),0xd)==1 && (int)b==W(func_020498f0(),0xf8)) func_02062530(P(P(func_020498f0(),4),0));
        if(func_0204cc20((int)b)==0) return 0;
        break;
    case 6:
        f=e[0]; n=(u16)e[1];
        if(W(func_020498f0(),0x1a0)==1) func_020498dc(6);
        else {
            if(W(func_020498f0(),0x1a0)!=6 && W(func_020498f0(),0x1a0)!=11) break;
            if((int)b!=W(func_020498f0(),0x20)) break;
        }
        B(func_020498f0(),0x3cc)=255;
        p=func_020498f0();
        if((int)b!=((Entries *)p)->entries[B(func_020498f0(),0xd)+1]) {
            p=func_020498f0(); ((Entries *)p)->entries[B(func_020498f0(),0xd)+1]=(int)b;
        }
        packet.addr=f; packet.port=((n>>8)&255)|((n<<8)&0xff00);
        B(func_020498f0(),0x194)=1;
        v=func_02062510(P(P(func_020498f0(),4),0));
        func_02049990(0,v,(Info *)&packet,(Info *)((char *)func_020498f0()+0x194));
        p=func_020498f0(); W(p,0x18c)=0; W(p,0x190)=0;
        break;
    case 7:
        if(W(func_020498f0(),0x1a0)!=1 || (int)b!=W(func_020498f0(),0xf4)) break;
        id=e[0]; byte=e[1]&255;
        if(B(func_020498f0(),0x15)==1 && B(func_020498f0(),0x1a6)==0) {
            values[0]=func_0204b280(id);
            if(DISPATCH(func_0204ead0(32,b,c,d,values,1))) return 0;
        }
        p=func_020498f0(); ((Entries *)p)->entries[B(func_020498f0(),0x14)+1]=id;
        p=func_020498f0(); B((char *)p+(B(func_020498f0(),0x14)+1),0x2d0)=byte;
        func_020673dc(P(func_020498f0(),0x10));
        if(P(func_020498f0(),0x46c)) {
            p=func_020498f0(); v=func_02049120(id);
            ((void (*)(int,int))P(p,0x46c))(v,W(func_020498f0(),0x470));
        }
        break;
    case 8: {
        int flags;
        int slot;
        if(W(func_020498f0(),0x1a0)!=1 || (int)b!=W(func_020498f0(),0xf4)) break;
        id=e[0];
        if(id==0) {
            index=e[1]; v=e[2]; B(index+(u32)func_020498f0(),0x2d0)=v;
            p=func_020498f0(); ((Entries *)p)->entries[index]=W(func_020498f0(),0x200);
            func_0204c40c(3); break;
        }
        flags=e[2]&255; slot=e[1];
        if(id==((Entries *)func_020498f0())->entries[slot] && slot==B(func_020498f0(),0xd)-1) {
            p=func_020498f0(); q=func_020498f0();
            if(DISPATCH(func_0204ead0(9,b,W(p,0x24),H(q,0xa4),&id,1))) return 0;
            break;
        }
        ((Entries *)func_020498f0())->entries[slot]=id;
        B(slot+(u32)func_020498f0(),0x2d0)=flags;
        ((Entries *)func_020498f0())->arr24[slot]=e[3];
        ((Entries *)func_020498f0())->arra4[slot]=e[4];
        W(func_020498f0(),0x1b8)=e[3]; H(func_020498f0(),0x1b4)=e[4];
        func_020498dc(5);
        if(func_0204aaf4(func_0204f0a8(id))) return 0;
        W(func_020498f0(),0x1c8)=0; W(func_020498f0(),0x1bc)=0;
        break;
    }
    case 9:
        if(W(func_020498f0(),0x1a0)!=13) break;
        p=func_020498f0();
        if(e[0]!=((Entries *)p)->entries[B(func_020498f0(),0x1a4)+1]) break;
        B(func_020498f0(),0x1a4)++;
        func_0204c40c(0); break;
    case 10:
        if(W(func_020498f0(),0x1a0)!=1 && W(func_020498f0(),0x1a0)!=18) break;
        if(B(func_020498f0(),0x15)==0 || func_0204c384(e+1,e[0])) {
            W(func_020498f0(),0x208)=e[1]; B(func_020498f0(),0x1a7)=0;
        } else W(func_020498f0(),0x208)=0;
        if(B(func_020498f0(),0xd)!=0) func_02062530(P(P(func_020498f0(),4),0));
        else if(func_0204be40()) return 0;
        break;
    case 12:
        if((int)b!=W(func_020498f0(),0xf4)) break;
        if(B(func_020498f0(),0x15)==0 || B(func_020498f0(),0x15)==1) {
            if(func_0204cb54((int)b)==0) return 0;
        } else if(B(func_020498f0(),0x15)==3) {
            P(func_020498f0(),0x20c)=b; func_0204bd8c(); func_0204bf44(0);
        }
        break;
    case 13: case 14: case 15:
        if(func_0204b62c((int)b,a,e[0])==0) return 0;
        break;
    case 16:
        if((int)b!=W(func_020498f0(),0xf4)) return 1;
        for(i=0;i<f;i++) { v=func_0204b134(e[i],0); if(v!=255) func_02046b3c(v); }
        break;
    case 17:
        p=data_0219dc84;
        if(p!=0 && B(p,0)!=0 && func_020b3808((u64)(func_020930b0()-Q(p,0x10))<<6,0x82ea)>=U(p,4)) values[0]=1;
        else values[0]=0;
        if(DISPATCH(func_0204ead0(18,b,c,d,values,1))) return 0;
        break;
    case 18:
        if(W(func_020498f0(),0x1a0)!=19) break;
        v=func_0204b134((int)b,0);
        if(v==255) break;
        p=data_0219dc84; n=1<<v; W(p,8)|=1<<v;
        if(e[0]!=0) W(data_0219dc84,12)|=n;
        break;
    case 19:
        func_02050054(12,0); return 0;
    case 32:
        if(B(func_020498f0(),0x15)!=1 || B(func_020498f0(),0x1a6)!=0) break;
        for(i=1;i<=B(func_020498f0(),0xd);i++) {
            if((int)b!=((Entries *)func_020498f0())->entries[i]) continue;
            if(e[0]==0) {
                if(W(func_020498f0(),0x1a0)==11 || W(func_020498f0(),0x1a0)==12) { if(DISPATCH(func_0204c04c())) return 0; }
                if(W(func_020498f0(),0x19c)!=0) { func_02065788(W(func_020498f0(),0x19c)); W(func_020498f0(),0x19c)=0; }
                func_0204bf00();
            } else {
                p=func_020498f0(); v=func_0204b134((int)b,0); W(p,0x1dc)|=1<<v;
            }
            break;
        }
        break;
    case 65: break;
    case 64:
        for(i=1;i<=B(func_020498f0(),0xd);i++) {
            if((int)b==((Entries *)func_020498f0())->entries[i]) {
                if(DISPATCH(func_0204ead0(65,b,c,d,0,0))) return 0;
                break;
            }
        }
        break;
    }
    return 1;
}
