extern int func_ov002_021ae484(int);
extern int func_ov002_021ae5d4(int);
extern int func_ov002_021b3ecc(int,int,int);
extern int func_ov002_021b9ecc(int,int);
extern int func_ov002_021bae7c(int,int,int);
extern int func_ov002_021be2d8(int,int,int);
extern int func_ov002_021be384(int,int,int);
extern int func_ov002_021bf294(int,int,int,int,int);
extern void func_ov002_021d479c(unsigned short,unsigned short,unsigned short,unsigned short);
extern void func_ov002_021d5b80(int,int,int,int);
extern int func_ov002_021d90c0(int,int,int);
extern void func_ov002_022592b8(int);
extern int func_ov002_0225a0e0(int);
extern int func_ov002_02266220(int);
extern int func_ov002_022662e4(int);
extern int func_ov002_02266358(int);
extern int func_ov002_02266650(void);
extern int func_ov002_02285dd0(void *,void *);
extern int func_ov002_02297c80(void *,int);
extern int func_ov002_0229ade0(int,int,int,int);
extern char data_ov002_022cd3f4[];
typedef struct { char pad[0xd2c]; int f_d2c,f_d30,f_d34,f_d38,f_d3c,f_d40,f_d44,f_d48,f_d4c,f_d50,f_d54,f_d58,f_d5c,f_d60,f_d64,f_d68,f_d6c,f_d70,f_d74,f_d78; } Control;
extern Control data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern char data_ov002_022cd524[];
#define D(o) (*(int *)(data_ov002_022cd3f4+(o)))
#define S(o) (*(int *)(data_ov002_022d016c+(o)))
int func_ov002_0225ada4(int player) {
    int i,j,ok,a,b,other,flags;
    char *p;
    D(0)=player;
    switch(data_ov002_022d016c.f_d30) {
    case 0:
        D(8)=0; D(0x14)=0;
        func_ov002_021d479c((unsigned short)((player ? 0x8000:0)|0x15),0,0,0);
        data_ov002_022d016c.f_d30++; return 0;
    case 1:
        if(func_ov002_02266650()) {
            a=func_ov002_022662e4(player);
            other=1-player;
            b=func_ov002_02266358(other);
            if(a>=0 && b>=0 && func_ov002_021be384(player,a,1) && func_ov002_021bf294(player,a,other,b,1)) {
                D(0x1c)=func_ov002_022662e4(player); D(0x10)=0; D(0xc)=0; return 1;
            }
            data_ov002_022d016c.f_d2c=12; data_ov002_022d016c.f_d30=0; data_ov002_022d016c.f_d34=0; return 0;
        }
        if(func_ov002_021bae7c(player,0x1a79,-1)) {
            p=data_ov002_022cf16c+(player&1)*0x868;
            for(i=0;i<=4;i++,p+=0x14) {
                if(func_ov002_021b9ecc(player,i)==0x1a79 && *(int *)(p+0x3c)!=0) {
                    ok=0;
                    if(func_ov002_021be384(player,i,1)) {
                        for(j=0;j<=4;j++) {
                            if(func_ov002_021bf294(player,i,1-player,j,1)) {ok=1;break;}
                        }
                    }
                    if(ok==0) {func_ov002_021d90c0(player,i,0);return 0;}
                }
            }
        }
        if(data_ov002_022cd744[player]==1) {
            a=func_ov002_02285dd0(player,func_ov002_0225a0e0(player)==0);
            if(func_ov002_02297c80(player,a)) {data_ov002_022d016c.f_d54=1;return 0;}
            if(a) {D(0x1c)=*(int *)(data_ov002_022cd524+0x200); D(0x10)=0;D(0xc)=0;D(0x18)=0;return 1;}
            data_ov002_022d016c.f_d2c=12;data_ov002_022d016c.f_d30=0;data_ov002_022d016c.f_d34=0;return 0;
        }
        for(i=0;i<=4;i++) {
            if(func_ov002_021be2d8(player,i,1)) {func_ov002_0229ade0(7,player,i,0);break;}
        }
        func_ov002_022592b8(3);data_ov002_022d016c.f_d30++;return 0;
    case 2:
        if(data_ov002_022d016c.f_d50) {
            if(data_ov002_022d016c.f_d64==0) {
                D(0x1c)=data_ov002_022d016c.f_d74+data_ov002_022d016c.f_d78;D(0x10)=0;D(0xc)=0;D(0x18)=0;
                func_ov002_0229ade0(11,D(0x1c),1-player,-1);return 1;
            }
            data_ov002_022d016c.f_d54=1;data_ov002_022d016c.f_d30--;
        } else {
            if(func_ov002_0225a0e0(player)) {
                if(func_ov002_021b3ecc(player,11,0x11ed)) {func_ov002_021ae484(0xdd);data_ov002_022d016c.f_d30++;return 0;}
                switch(data_ov002_022d016c.f_d64-13) {
                case 4:data_ov002_022d016c.f_d2c=12;data_ov002_022d016c.f_d30=0;data_ov002_022d016c.f_d34=0;return 0;
                case 5:
                    if(func_ov002_02266220(player)) {data_ov002_022d016c.f_d2c=12;data_ov002_022d016c.f_d30=0;data_ov002_022d016c.f_d34=1;return 0;}
                    break;
                }
            }
            data_ov002_022d016c.f_d30++;data_ov002_022d016c.f_d44=0;return 0;
        }
        return 0;
    case 3:
        if(data_ov002_022d016c.f_d44) {data_ov002_022d016c.f_d2c=12;data_ov002_022d016c.f_d30=0;data_ov002_022d016c.f_d34=0;return 0;}
        flags=8;
        if(func_ov002_0225a0e0(player)) {flags|=16;if(func_ov002_02266220(player)) flags|=32;}
        func_ov002_021ae5d4(flags);data_ov002_022d016c.f_d30++;return 0;
    case 4:
        switch(data_ov002_022d016c.f_d44) {
        case 4:data_ov002_022d016c.f_d2c=12;data_ov002_022d016c.f_d30=0;data_ov002_022d016c.f_d34=0;func_ov002_021d5b80(player,11,0x11ed,1);return 0;
        case 5:data_ov002_022d016c.f_d2c=12;data_ov002_022d016c.f_d30=0;data_ov002_022d016c.f_d34=1;return 0;
        default:data_ov002_022d016c.f_d30=1;return 0;
        }
    }
    return 0;
}

