typedef unsigned short u16;
struct G { int f0, other, flag; int pad[3]; int active, card, slot; };
struct S { char pad[0xd2c]; int reset, state; char p1[0x10]; int result; char p2[8]; int ready; char p3[0x10]; int cmd; char p4[0xc]; int x,y; };
struct B { unsigned unused:13; unsigned bit:1; unsigned rest:8; unsigned index:8; unsigned top:2; };
extern struct G data_ov002_022cd3f4;
extern struct S data_ov002_022d016c;
extern int data_ov002_022cd744[];
struct R { char pad[0x1f8]; int flag; char p[8]; int slot; };
extern struct R data_ov002_022cd524;
extern char data_ov002_022cf16c[], data_ov002_022d0e6c[];
extern int func_ov002_021ae484(int);
/* Original caller tests r0; existing void definition discards this result. */
extern int func_ov002_021b30ac(int,int,int);
extern int func_ov002_021b359c(int,int);
extern int func_ov002_021b3ecc(int,int,int);
extern int func_ov002_021b9ecc(int,int);
extern int func_ov002_021baca8(int,int,int);
extern int func_ov002_021bae7c(int,int,int);
extern int func_ov002_021bb91c(int);
extern int func_ov002_021bf294(int,int,int,int,int);
extern int func_ov002_021bff00(int,int);
extern int func_ov002_021c031c(int,int);
extern int func_ov002_021c034c(int,int,int);
extern int func_ov002_021c1d28(int,int,int);
extern void func_ov002_021d479c(u16,u16,u16,u16);
extern void func_ov002_021d5b80(int,int,int,int);
extern void func_ov002_021df62c(int,int,int);
extern void func_ov002_021df680(int,int);
extern void func_ov002_021e276c(void *,int,int,int);
extern void func_ov002_022592ec(int);
extern void func_ov002_02259324(int);
extern int func_ov002_0225a0e0(int);
extern int func_ov002_0225a354(int,int);
extern void func_ov002_0225a51c(int,int);
extern int func_ov002_0225b2e8(int,int,int);
extern int func_ov002_02266358(int);
extern int func_ov002_02266650(void);
extern void func_ov002_0226b034(int,int,int);
extern void func_ov002_0226b094(int,int);
extern int func_ov002_02285df0(int,int,int,int);
extern void func_ov002_0229ade0(int,int,int,int);
#define G data_ov002_022cd3f4
#define S data_ov002_022d016c
int func_ov002_0225b338(int a) {
    int other = 1-a;
    int st;
    int n;
    int t;
    G.other=other;
    st=S.state;
    switch(st) {
    case 0:
        if(G.active) {
            if(func_ov002_0225a354(a,G.card)==0) S.result=1;
            else if(data_ov002_022cd744[a]==1) S.result=func_ov002_02285df0(a,G.card,0,0);
            else func_ov002_021ae484(0xdf);
            S.state++;
            return 0;
        }
        S.state=st+1;
    case 1:
        if(G.active && S.result==0) { func_ov002_0225a51c(a,G.card); return 0; }
        if(func_ov002_021c031c(a,G.card)!=0) { G.flag=1; S.state=5; return 0; }
        if(func_ov002_02266650()!=0) {
            other=func_ov002_02266358(other);
            func_ov002_021e276c(a,0x151e,4,0);
            if(other>=0) { G.slot=other; S.state=5; return 0; }
            S.reset=1; S.state=0; return 0;
        }
        if(func_ov002_021c1d28(a,G.card,1)==0 && func_ov002_021b359c(other,0x1318)>0) {
            func_ov002_021df680(other,0x1318);
            if(func_ov002_021b359c(other,0x1318)==1) {
                for(n=0;n<5;n++) if(func_ov002_021b30ac(other,n,0x1318)!=0) break;
                G.slot=n; S.state=5; return 0;
            }
            S.state=3; return 0;
        }
        switch(func_ov002_021c034c(a,G.card,1)) {
        case 2: G.flag=1; S.state=5; return 0;
        case 1:
            if(func_ov002_021bff00(a,G.card)!=0) {
                if(func_ov002_021bae7c(other,0x139c,-1)!=0) {
                    func_ov002_021df680(other,0x139c);
                    func_ov002_0226b094(other,0x139c); S.state=10; return 0;
                }
                if(func_ov002_021bb91c(0x1443)!=0) {
                    t=func_ov002_021baca8(1,10,0x1443);
                    {struct B *b=(struct B *)(data_ov002_022cf16c+(t&1)*0x868+0xf8);
                    func_ov002_021df62c(t,10,b->index*2+b->bit);}
                    func_ov002_0226b094(other,0x139c); S.state=10; return 0;
                }
                if(func_ov002_021b3ecc(other,11,0x177a)!=0) {
                    func_ov002_0226b094(other,0x139c); S.state=10; return 0;
                }
            } else { G.flag=1; S.state=5; return 0; }
            if(data_ov002_022cd744[a]==1) S.result=1;
            else func_ov002_021ae484(0xe1);
            S.state=2; return 0;
        default: S.state=3; return 0;
        }
    case 2:
        if(S.result!=0) { G.flag=1; S.state=5; return 0; }
        S.state=st+1;
    case 3:
        if(func_ov002_021bff00(a,G.card)>=2) {
            if(func_ov002_021bae7c(other,0x139c,-1)!=0) {
                func_ov002_021df680(other,0x139c);
                func_ov002_0226b034(other,0x139c,G.card); S.state=11; return 0;
            }
            if(func_ov002_021bb91c(0x1443)!=0) {
                t=func_ov002_021baca8(1,10,0x1443);
                {struct B *b=(struct B *)(data_ov002_022cf16c+(t&1)*0x868+0xf8);
                func_ov002_021df62c(t,10,b->index*2+b->bit);}
                func_ov002_0226b034(other,0x139c,G.card); S.state=11; return 0;
            }
            if(func_ov002_021b3ecc(other,11,0x177a)!=0) {
                func_ov002_0226b034(other,0x139c,G.card); S.state=11; return 0;
            }
        }
        if(data_ov002_022cd744[a]==1) {
            if(G.active) t=func_ov002_0225a354(a,G.card);
            else t=func_ov002_0225a0e0(a);
            if(func_ov002_02285df0(a,G.card,1,t==0)!=0) {
                G.flag=data_ov002_022cd524.flag;
                G.slot=data_ov002_022cd524.slot;
                S.state=5; return 0;
            }
            func_ov002_0225a51c(a,G.card); return 0;
        }
        func_ov002_0229ade0(10,0,0,0);
        for(n=0;n<=4;n++) {
            if(func_ov002_021bf294(a,G.card,other,n,1)!=0) {
                func_ov002_0229ade0(7,other,n,0); break;
            }
        }
        if(G.active && func_ov002_0225a354(a,G.card)==0 && func_ov002_021c034c(a,G.card,1)!=1)
            func_ov002_02259324((int)func_ov002_0225b2e8);
        else func_ov002_022592ec((int)func_ov002_0225b2e8);
        S.state++; return 0;
    case 4:
        if(S.ready) {
            if(S.cmd==11) { G.slot=S.x+S.y; S.state=st+1; return 0; }
            S.state=st-1;
        } else {
            if(G.active) { S.state=0; return 0; }
            func_ov002_0225a51c(a,G.card);
        }
        return 0;
    case 5:
        func_ov002_021d5b80(other,11,0x177a,1);
        if(G.flag) {
            func_ov002_021d479c((u16)((a?0x8000:0)|0x1a),(u16)G.card,1,0);
            G.slot=5;
            t=func_ov002_021b9ecc(a,G.card);
            if((t==0x1a41 || t==0x1aaf) && func_ov002_021c031c(a,G.card)==0 && func_ov002_021c034c(a,G.card,1)!=0 && func_ov002_021c034c(a,G.card,0)==0)
                func_ov002_021e276c(a,(u16)func_ov002_021b9ecc(a,G.card),4,0);
            return 1;
        }
        func_ov002_021d479c((u16)((a?0x8000:0)|0x19),(u16)G.card,(u16)G.slot,(u16)G.other);
        return 1;
    case 10:
        if(*(u16 *)(data_ov002_022d0e6c+0xb0)!=0) { G.flag=1; S.state=5; return 0; }
        func_ov002_0226b034(other,0x139c,G.card); S.state++; return 0;
    case 11:
        G.slot=(*(u16 *)(data_ov002_022d0e6c+0xb0)>>8)&0xff;
        S.state=5; return 0;
    }
    return 1;
}

