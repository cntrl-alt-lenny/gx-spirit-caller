extern int func_ov002_021fe3d4(void);
extern int func_ov002_022537f8(void);
extern int func_ov002_02254154(void);
extern int func_ov002_022547c4(void);
extern int func_ov002_0225490c(void);
extern int func_ov002_02254a84(void);
extern int func_ov002_02254d94(void);
extern int func_ov002_02255148(void);
extern int func_ov002_022551d4(void);
extern int func_ov002_02255344(void);
extern int func_ov002_02255454(void);
extern int func_ov002_022555a4(void);
extern int func_ov002_0225585c(void);
extern int func_ov002_022558ec(void);
extern int func_ov002_02255c04(void);
extern int func_ov002_02255d70(void);
extern int func_ov002_02255e54(void);
extern int func_ov002_02255f6c(void);
extern int func_ov002_02256084(void);
extern int func_ov002_02256108(void);
extern int func_ov002_022561e0(void);
extern int func_ov002_022563f0(void);
extern int func_ov002_022564dc(void);
extern int func_ov002_022565c4(void);
extern int func_ov002_02256720(void);
extern int func_ov002_0225680c(void);
extern int func_ov002_022568a8(void);
extern int func_ov002_02256a50(void);
extern int func_ov002_02256ac8(void);
extern int func_ov002_02256bd8(void);
extern int func_ov002_02256cf0(void);
extern int func_ov002_02256e1c(void);
extern void func_ov002_021b0df8(void);
extern int func_ov002_021c3cf0(int);
extern int func_ov002_021d50fc(int,int);
extern int func_ov002_021d5228(int,int);
extern void func_ov002_021d600c(int,int);
extern int func_ov002_021e27c0(int,int);
extern void func_ov002_021e28b4(int);
extern void func_ov002_021e2bd4(void);
/* The original passes no argument; the defined parameter is unused. */
extern void func_ov002_021e2c5c();
extern int func_ov002_022539a0(int);
extern int func_ov002_02253bec(int);
extern void func_ov002_02253ea4(int,int);
extern int func_ov002_02255998(int);
struct State { char pad0[0xd0]; unsigned flags; char pad1[0xc18]; int player; char pad2[0x1c]; int mode; char pad3[0x2c]; int active; int next; };
extern struct State data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
typedef struct { unsigned id:13; unsigned rest:19; } Card;
int func_ov002_0225702c(void) {
    int p, i, j;
    char *q, *base;
    if (data_ov002_022d016c.active == 0) return 0;
    func_ov002_021b0df8();
    if (data_ov002_022d016c.mode != 0 && data_ov002_022cd744[data_ov002_022d016c.player] == 2) return 0;
    func_ov002_021e2bd4();
    if (func_ov002_021fe3d4() || func_ov002_022537f8() || func_ov002_02254154()) goto cleanup;
    func_ov002_02253ea4(-1,0);
    if (func_ov002_02255e54() || func_ov002_02255f6c() || func_ov002_02256ac8() || func_ov002_02256e1c() || func_ov002_02256108() || func_ov002_02255344() || func_ov002_0225490c() || func_ov002_02254d94() || func_ov002_02255c04() || func_ov002_02255454() || func_ov002_022551d4() || func_ov002_022547c4() || func_ov002_022555a4() || func_ov002_02255d70() || func_ov002_022563f0() || func_ov002_022564dc() || func_ov002_022565c4() || func_ov002_02256720() || func_ov002_022539a0(0x16da) || func_ov002_02253bec(0x142c) || func_ov002_02253bec(0x17a4) || func_ov002_02253bec(0x151a) || func_ov002_02253bec(0x1574) || func_ov002_02253bec(0x1a51) || func_ov002_022539a0(0x18b2) || func_ov002_02256a50() || func_ov002_02256084() || func_ov002_02256bd8() || func_ov002_022568a8() || func_ov002_022561e0() || func_ov002_02254a84() || func_ov002_02256cf0()) goto cleanup;
    if (!(data_ov002_022d016c.flags & 1)) {
        if (func_ov002_0225680c() || func_ov002_02255148() || func_ov002_0225585c() || func_ov002_02255998(0x158b) || func_ov002_02255998(0x160f) || func_ov002_022558ec()) goto cleanup;
    }
    for (i=0;i<2;i++) {
        p=data_ov002_022d016c.player ^ i;
        if (func_ov002_021c3cf0(p)) func_ov002_021e27c0(p,1);
        else {
            func_ov002_021e27c0(p,0);
            if ((*(unsigned *)(data_ov002_022cf16c + (p&1)*0x868 + 0x11c) >> 2)&1) func_ov002_021e28b4(p);
        }
    }
    for (i=0;i<2;i++) {
        p=data_ov002_022d016c.player ^ i;
        base=data_ov002_022cf16c+(p&1)*0x868;
        q=base+0x30;
        for(j=0;j<5;j++,q+=0x14,base+=0x14) {
            if (((Card *)q)->id) {
                if (*(unsigned short *)(base+0x38)==0) func_ov002_021d600c(p,j);
                if (func_ov002_021d5228(p,j) || func_ov002_021d50fc(p,j)) goto cleanup;
            }
        }
    }
    if (func_ov002_02253bec(0x1762) || func_ov002_02253bec(0x186b) || func_ov002_02253bec(0x1862) || func_ov002_02253bec(0x1875)) goto cleanup;
    func_ov002_021e2c5c();
    data_ov002_022d016c.active=0;
    data_ov002_022d016c.next=0;
    return 0;
cleanup:
    func_ov002_021e2c5c();
    return 1;
}




