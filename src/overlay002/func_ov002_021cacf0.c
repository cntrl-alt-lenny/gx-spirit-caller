extern char data_ov002_022ce950[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf282[];
extern char data_ov002_022d016c[];
extern char data_ov002_022cd3f4[];
extern int func_ov002_021b9ecc(int, int);
extern void func_ov002_021b212c(int, int, int);
extern int func_ov002_021bbf50(int);
extern void func_ov002_021c9b80(int, int, int, int);
extern void func_ov002_021b1f20(int, int, int, int, int);
extern int func_ov002_021baca8(int, int, int);
extern int func_ov002_021be2d8(int, int, int);
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
void func_ov002_021cacf0(void) {
    int player;
    int i;
    struct Slot *s;
    int other;
    int j;
    char *base;
    char *p;
    int mask;
    int saved;
    player = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    p = base;
    for (i=0; i<=4; i++, p+=20) {
        *(unsigned int *)(p+0x40) &= ~0x400000;
        *(unsigned int *)(p+0x40) &= ~0x800000;
        switch (func_ov002_021b9ecc(player,i)) {
        case 0x186c: case 0x18a6: case 0x19c1: case 0x1a4e:
            func_ov002_021b212c(*(unsigned short *)(p+0x3a), (unsigned short)func_ov002_021b9ecc(player,i),1);
            break;
        }
    }
    other=1-player;
    func_ov002_021b212c(*(unsigned short *)(data_ov002_022cf282+(other&1)*0x868),0x1571,1);
    if (func_ov002_021bbf50(other)>=2) {
        s=(struct Slot *)(data_ov002_022cf16c+(other&1)*0x868+0x30);
        for (j=0;j<=4;j++,s++) {
            if(s->id) {
                func_ov002_021c9b80(other,j,0x19,1);
                func_ov002_021b1f20(other,0xb,1,0x197d,0);
            }
        }
    }
    if (func_ov002_021bbf50(other)!=0) {
        saved=*(int *)(data_ov002_022d016c+0xcf8);
        *(int *)(data_ov002_022d016c+0xcf8)=3;
        mask=0;
        for(j=0,p=base;j<=4;j++,p+=20) {
            if(func_ov002_021baca8(player,j,0x1a79)!=0 && *(unsigned short *)(p+0x36)==0) {
                if(func_ov002_021be2d8(player,j,1)!=0) mask |= 1<<j;
            }
        }
        for(j=0,p=base;j<=4;j++,p+=20) {
            if(mask & (1<<j)) *(int *)(p+0x3c)=1;
        }
        *(int *)(data_ov002_022d016c+0xcf8)=saved;
    }
    *(int *)(data_ov002_022cd3f4+0x28)=0;
    *(int *)(data_ov002_022ce950+0x80c)=0;
}






