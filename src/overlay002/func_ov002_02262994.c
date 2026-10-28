typedef unsigned int u32;
typedef unsigned short u16;
struct State { char pad[0xcec]; int player; char gap[0x30]; int step; char gap2[0x2c]; int f50; int f54; char gap3[0xc]; int f64; };
struct Event { char pad[0x488]; int flag; };
struct Card { u32 id:13; u32 bit:1; u32 pad:8; u32 value:8; u32 top:2; };
extern struct State data_ov002_022d016c;
extern struct Event data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[], data_ov002_022cf178[], data_ov002_022cf17c[], data_ov002_022cf180[], data_ov002_022cf288[];
extern void func_ov002_021ae400(int,int);
extern int func_ov002_021b3ecc(int,int,int);
extern int func_ov002_021b40dc(int,int,int,int);
extern int func_ov002_021b41a4(int,int,int);
extern int func_ov002_021baca8(int,int,int);
extern int func_ov002_021bae7c(int,int,int);
extern void func_ov002_021d479c(u16,u16,u16,u16);
extern int func_ov002_021d5c50(int,int,int,int);
extern void func_ov002_021d7970(void *,int,int);
extern void func_ov002_021df6d4(int,int);
extern int func_ov002_021e06e4(int,int,int);
extern void func_ov002_021e276c(void *,int,int,int);
/* Original calls omit the unused parameter in these definitions. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern void func_ov002_021e2d20(int,int,int);
extern int func_ov002_021e30b4(int,int,int);
extern void func_ov002_02244fe4(int,u32);
extern void func_ov002_022592b8(int);
extern int func_ov002_022628e4(int);
int func_ov002_02262994(void) {
    int player = data_ov002_022d016c.player;
    int off = (player & 1) * 0x868;
    u32 flags = *(u32 *)(data_ov002_022cf288 + off);
    int special = (flags >> 24) & 1;
    int blocked;
    int i, j, other;
    char *base;
    struct Card *card;
    u32 sign;
    if ((flags & 1) || special) blocked=1; else blocked=0;
    switch (data_ov002_022d016c.step) {
    case 0:
        j = blocked | func_ov002_021b3ecc(player,11,0x14ff);
        if (j | func_ov002_021b3ecc(player,11,0x1548)) {
            if (data_ov002_022cd744[player] == 1 && func_ov002_022628e4(player))
                func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0x23),5,0,0);
            else if (special)
                func_ov002_021ae400(player,0x132);
            else
                func_ov002_021ae400(player,0x133);
            func_ov002_021e2d20(player,0,0);
            return 1;
        }
        func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0xc),0,0,0);
        func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0x28),13,0,0);
        data_ov002_022d016c.step++;
        return 0;
    case 1: {
        int other, j, i;
        if (*(int *)(data_ov002_022cf178 + off) == 0 && func_ov002_021bae7c(player,0x1911,-1))
            func_ov002_021e276c(player,0x1911,1,0);
        for (i=0;i<2;i++) {
            other = player ^ (i == 0 ? 1 : 0);
            if (func_ov002_021b3ecc(other,11,0x1504)) {
                func_ov002_021df6d4(1-other,0x1504);
                func_ov002_021e2b3c();
                for (j=*(int *)(data_ov002_022cf16c + (other & 1)*0x868 + 0xc)-1;j>=0;j--)
                    func_ov002_021d7970(other,j,1);
                func_ov002_021e2c5c();
            }
        }
        data_ov002_022d016c.step++;
        return 0;
    }
    case 2:
        j=func_ov002_021b41a4(player,11,0x14fd);
        if (j>=0) {
            func_ov002_021e30b4((((u32)player << 31) & 0x80000000) | 0x025014fd,(u16)j,0);
            func_ov002_021d5c50(player,11,0x14fd,j);
            return 0;
        }
        if (func_ov002_021b40dc(player,11,0x1885,0)) {
            func_ov002_021df6d4(1-player,0x1885);
            data_ov002_022d016c.step=7;
            return 0;
        }
        data_ov002_022d016c.step++;
    case 3: {
        int j;
        struct Card *card, *card2, *card3;
        u32 packed;
        int i;
        if (*(int *)(data_ov002_022cf17c+off)) {
            base=data_ov002_022cf16c+off;
            sign=((u32)player << 31) & 0x80000000;
            for(j=0,card=(struct Card *)(base+0x30);j<=4;j++,card=(struct Card *)((char *)card+20)) {
                if(func_ov002_021baca8(player,j,0x14c4))
                    func_ov002_021e30b4(sign | 0x200000 | (((u32)j<<16)&0x1f0000) | 0x14c4,(u16)(card->value*2+card->bit),0);
            }
            for(i=0,card2=(struct Card *)(base+0x30);i<=4;i++,card2=(struct Card *)((char *)card2+20)) {
                if(func_ov002_021baca8(player,i,0x1a97))
                    func_ov002_021e30b4(sign | 0x200000 | (((u32)i<<16)&0x1f0000) | 0x1a97,(u16)(card2->value*2+card2->bit),0);
            }
            blocked=*(int *)(data_ov002_022cf180+off)-1;
            if (blocked>=0) {
            card3=(struct Card *)(base+0x418)+blocked;
            sign |= 0x004e1984;
            do {
                if(card3->id==0x1984)
                    func_ov002_021e30b4(sign,(u16)(card3->value*2+card3->bit),0);
            card3--;
            } while (--blocked>=0);
            }
        }
        data_ov002_022d016c.step++;
        return 0;
    }
    case 4:
        if(func_ov002_021b3ecc(player,11,0x14c4)) data_ov002_022d016c.step+=3;
        else if(data_ov002_022cd744[player]==1) data_ov002_022d016c.step+=2;
        else { func_ov002_022592b8(1); data_ov002_022d016c.step++; }
        return 0;
    case 5:
        if(data_ov002_022d016c.f50) {
            if(data_ov002_022d016c.f64==12) { data_ov002_022d016c.step++; return 0; }
            data_ov002_022d016c.f54=1;
            data_ov002_022d016c.step--;
            return 0;
        }
        data_ov002_022d016c.step--;
        return 0;
    case 6:
        func_ov002_021e06e4(player,1,0);
        data_ov002_022d016c.step++;
        return 0;
    case 7:
        func_ov002_02244fe4(1,0);
        data_ov002_022ce288.flag=0;
        data_ov002_022d016c.step++;
        return 0;
    case 8:
        if(data_ov002_022ce288.flag) { data_ov002_022d016c.step--; return 0; }
        data_ov002_022d016c.step++;
        return 0;
    }
    return 1;
}










