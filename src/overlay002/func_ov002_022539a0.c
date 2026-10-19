typedef struct {
    unsigned id:13;
    unsigned flag:1;
    unsigned pad:8;
    unsigned value:8;
    unsigned rest:2;
    unsigned unk;
    unsigned short active;
    unsigned short pad2;
    int ptr;
    unsigned flags;
} Entry;
typedef struct { char pad[0x30]; Entry cards[10]; char tail[0x770]; } Side;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a8[];
extern char data_ov002_022d016c[];
extern int func_0202e234(int x);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
int func_ov002_022539a0(int a) {
    int side, j, i, lo, hi;
    if (func_0202e234(a) != 0) { lo=0; hi=4; }
    else { lo=5; hi=9; }
    for(i=0;i<2;i++) {
        side=*(int *)(data_ov002_022d016c+0xcec)^i;
        for(j=lo;j<=hi;j++) {
            if (a==func_ov002_021b9ecc(side,j) && ((Side *)(data_ov002_022cf16c+(side&1)*0x868))->cards[j].active && !(((((Side *)(data_ov002_022cf16c+(side&1)*0x868))->cards[j].flags>>1)|(((Side *)(data_ov002_022cf16c+(side&1)*0x868))->cards[j].flags>>2))&1) && ((Side *)(data_ov002_022cf16c+(side&1)*0x868))->cards[j].ptr) {
                Entry *v=(Entry *)((unsigned)data_ov002_022cf16c+(side&1)*0x868+0x30+j*20);
                func_ov002_021e30b4(((side<<31)&0x80000000)|0x200000|((j<<16)&0x1f0000)|(unsigned short)a,(unsigned short)(v->value*2+v->flag),*(int *)(data_ov002_022cf1a8+(side&1)*0x868+j*20));
                func_ov002_021d90c0(side,j,0);
                return 1;
            }
        }
    }
    return 0;
}






