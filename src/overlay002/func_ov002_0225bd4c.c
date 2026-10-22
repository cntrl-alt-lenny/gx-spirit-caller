extern int func_ov002_021be384(int,int,int);
extern void func_ov002_021d479c(unsigned short,unsigned short,unsigned short,unsigned short);
extern void func_ov002_0225a578(void *);
extern int func_ov002_021b9ecc(int,int);
extern void func_ov002_021df780(int,int);
extern void func_ov002_021df7cc(int,int);
extern void func_ov002_021ae400(int,int);
extern int func_ov002_021ae664(int);
extern void func_ov002_021deb28(int,int);
extern void func_ov002_022592ec(int);
extern void func_ov002_02290500(int,int,int (*)(int,int,int));
extern int func_ov002_0225bcf4(int,int,int);
extern int func_ov002_0225a66c(void);
extern void func_ov002_0226b22c(int,int,int,int);
typedef struct { char pad[0xd2c]; int fd2c; unsigned int fd30; char rest[0x48]; } Control; extern Control data_ov002_022d016c; extern unsigned char data_ov002_022cd3f4[], data_ov002_022cd4e0[];
extern unsigned char data_ov002_022cf1ac[],data_ov002_022cf1a4[],data_ov002_022cf16c[],data_ov002_022d0e6c[];
extern int data_ov002_022cd744[];
#define S(o) (*(int *)((unsigned char *)&data_ov002_022d016c+(o)))
#define D(o) (*(int *)(data_ov002_022cd3f4+(o)))
int func_ov002_0225bd4c(int a) {
    switch ((unsigned int)data_ov002_022d016c.fd30) {
    case 0:
        if (D(0xc) != 0) return 1;
        if (func_ov002_021be384(a,D(0x1c),1) == 0) {
            func_ov002_021d479c((unsigned short)((a != 0 ? 0x8000 : 0) | 0x1b),(unsigned short)D(0x1c),1,0);
            S(0xd2c)=1;
            return 0;
        }
        func_ov002_0225a578(data_ov002_022cd4e0);
        D(0xc)=1;
        {
            unsigned int v, flag6, flag12, hp;
            int row,idx;
            row=(a&1)*0x868;
            idx=D(0x1c)*20;
            v=*(unsigned int *)(data_ov002_022cf1ac+row+idx);
            hp=*(unsigned short *)(data_ov002_022cf1a4+row+idx); if ((hp & ~((v>>6)&1) & ~(((v>>1)|(v>>2))&1)) != 0) {
                switch (func_ov002_021b9ecc(a,D(0x1c))) {
                case 0x127d: case 0x127e: case 0x127f: case 0x12a5:
                    func_ov002_021df780(a,500); return 1;
                case 0x11cd: case 0x18a4:
                    func_ov002_021df780(a,1000); return 1;
                case 0x128f: case 0x12a0:
                    data_ov002_022d016c.fd30=100; return 0;
                case 0x1115:
                    if(data_ov002_022cd744[a]==1) S(0xd44)=0;
                    else func_ov002_021ae664(0x38);
                    data_ov002_022d016c.fd30=200; return 0;
                }
            }
        }
        return 1;
    case 100:
        func_ov002_021ae400(a,0xe0);
        if(data_ov002_022cd744[a]==1) func_ov002_02290500(a,1,func_ov002_0225bcf4);
        else func_ov002_022592ec((int)func_ov002_0225bcf4);
        data_ov002_022d016c.fd30++; return 0;
    case 101:
        if(S(0xd50)!=0 && S(0xd64)==11) {
            func_ov002_021deb28(S(0xd70),S(0xd74)+S(0xd78));
            data_ov002_022d016c.fd30++; return 0;
        }
        data_ov002_022d016c.fd30--; return 0;
    case 102:
        return func_ov002_0225a66c()==0;
    case 200:
        func_ov002_0226b22c(a,D(0x1c),1,S(0xd44));
        data_ov002_022d016c.fd30++; return 0;
    case 201:
        if(*(unsigned short *)(data_ov002_022d0e6c+0xb2)==0)
            func_ov002_021df7cc(a,*(int *)(data_ov002_022cf16c+(a&1)*0x868)>>1);
        return 1;
    }
    return 1;
}



