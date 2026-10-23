typedef unsigned int u32;
typedef unsigned short u16;
struct G { int player, other, flag, f_c, f10, active, f18, card, slot, saved; };
struct S { char pad[0xd2c]; int reset; u32 state; };
struct Row { u32 id:13; u32 bit:1; u32 pad:8; u32 value:8; u32 top:2; char tail[16]; };
extern struct G data_ov002_022cd3f4;
extern struct S data_ov002_022d016c;
extern char data_ov002_022cd4e0[], data_ov002_022cf16c[], data_ov002_022cf1ac[], data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int,int);
extern int func_ov002_021bad58(int,int);
extern int func_ov002_021b3ecc(int,int,int);
extern int func_ov002_021b4054(int,int,int,int);
extern int func_ov002_021b4120(int,int,int);
extern void func_ov002_021d479c(u16,u16,u16,u16);
extern int func_ov002_021d59cc(int,int,int,int,u16);
extern void func_ov002_021d5b80(int,int,int,int);
extern void func_ov002_021d6434(int,int,int,int,int);
extern void func_ov002_021df62c(int,int,int);
extern void func_ov002_021df6d4(int,int);
extern int func_ov002_021df708(int,int);
extern void func_ov002_021e276c(void *,int,int,int);
extern void func_ov002_021e2cd4(int,int);
extern void func_ov002_021e2d20(int,int,int);
extern int func_ov002_021e30b4(int,int,int);
extern void func_ov002_02244fe4(int,u32);
extern void func_ov002_0225a578(void *);
extern int func_ov002_0225a874(void);
extern int func_ov002_0225a978(int,int);
/* The original passes only r0 to this four-argument forwarding thunk. */
extern int func_ov002_021ab864();
#define G data_ov002_022cd3f4
#define S data_ov002_022d016c
#define ROW(p,i) ((struct Row *)(data_ov002_022cf16c + ((p)&1)*0x868 + 0x30 + (i)*20))
#define FLAGS(p,i) (*(u32 *)(data_ov002_022cf1ac + ((p)&1)*0x868 + (i)*20))
#define HP(p,i) (*(u16 *)(data_ov002_022cf1a4 + ((p)&1)*0x868 + (i)*20))
#define VALUE(p,i) (ROW(p,i)->value*2 + ROW(p,i)->bit)
#define PACK(p,i,c) (((((u32)(p)<<31)&0x80000000)|0x28200000)|(((i)<<16)&0x1f0000)|(u16)(c))
int func_ov002_0225ca60(int a) {
    u32 packed;
    int card, card2, other;
    other = G.other;
    packed = (u16)((G.player&0xff)|((unsigned char)G.card<<8)) | ((u32)(u16)((other&0xff)|((unsigned char)G.slot<<8))<<16);
    card = func_ov002_021b9ecc(G.player,G.card);
    card2 = func_ov002_021b9ecc(G.other,G.slot);
    switch(S.state) {
    case 0:
        func_ov002_021e2cd4(0,1);
        func_ov002_021e2d20(a,0x13,1);
        func_ov002_021d479c((u16)((G.player?0x8000:0)|0x1b),(u16)G.card,1,0);
        G.saved=0;
        S.state++;
        return 0;
    case 1:
        func_ov002_0225a578(data_ov002_022cd4e0);
        if(func_ov002_021b4054(0,11,0x19b8,1) || func_ov002_021b4054(1,11,0x19b8,1))
            func_ov002_021df6d4(a,0x19b8);
        if(func_ov002_021b3ecc(a,11,0x15ff)) {
            int opponent=1-a;
            if(func_ov002_021b4120(opponent,11,0x15ff)==-1)
                func_ov002_021e276c((void *)opponent,0x15ff,1,(u16)(G.flag==0));
            if(G.flag==0) func_ov002_021d59cc(other,G.slot,0x15ff,1,0);
        }
        {
            u32 v=FLAGS(G.player,G.card);
            u32 hp=HP(G.player,G.card);
            if(hp & ~((v>>6)&1) & ~(((v>>1)|(v>>2))&1)) {
                switch(card) {
                case 0x14d6: case 0x1993:
                    func_ov002_021d59cc(G.player,G.card,0x14d6,4,0); break;
                case 0x1419: case 0x1566: case 0x15d2: case 0x1912: case 0x1915: case 0x1a61:
                    func_ov002_021d59cc(G.player,G.card,0x14d6,2,0); break;
                case 0x1505: case 0x1644: case 0x1958: case 0x1a4e: case 0x1a79:
                    if(func_ov002_021b4120(a,G.card,0x1505)==-1)
                        func_ov002_021d59cc(a,G.card,0x1505,1,(u16)(G.flag==0));
                    if(G.flag==0)
                        func_ov002_021d59cc(other,G.slot,(u16)((a&0xff)|((unsigned char)G.card<<8)),8,0);
                    break;
                }
            }
        }
        if(G.active==0 && func_ov002_021bad58(G.player,G.card)) {
            switch(card) {
            case 0x1524: case 0x15e0: case 0x17d7: case 0x17d8: case 0x17df: case 0x1823: case 0x1829: case 0x1963: case 0x19c2:
                if(G.flag==0) func_ov002_021e30b4(PACK(G.player,G.card,card),(u16)VALUE(G.player,G.card),packed);
                break;
            }
        }
        if(G.flag==0 && G.active==0 && func_ov002_021bad58(G.other,G.slot) && card2==0x1829)
            func_ov002_021e30b4((((u32)G.other<<31)&0x80000000)|0x200000|((G.slot<<16)&0x1f0000)|(u16)card2,(u16)VALUE(G.other,G.slot),packed);
        S.state++;
        return 0;
    case 2:
        if(func_ov002_0225a874()) { S.reset=11; S.state=0; return 0; }
        if(G.flag==0) {
            if(HP(G.other,G.slot)==0) {
                func_ov002_021d6434(G.other,G.slot,0,0,0);
                func_ov002_021df708(G.other,ROW(G.other,G.slot)->id);
                G.saved=ROW(G.other,G.slot)->id;
            }
            if(card2==0x129c) func_ov002_021d59cc(G.other,G.slot,(u16)card2,4,0);
        }
        S.state++;
        return 0;
    case 3:
        func_ov002_021ab864(0);
        {
            int offset=(a&1)*0x868;
            int index=G.card*20;
            u32 v=*(u32 *)(data_ov002_022cf1ac+offset+index);
            u32 hp=*(u16 *)(data_ov002_022cf1a4+offset+index);
            if(hp & ~((v>>6)&1) & ~(((v>>1)|(v>>2))&1)) {
                int id=func_ov002_021b9ecc(a,G.card);
                int result=func_ov002_0225a978(id,1);
                if(result!=-1) {
                    if(result) {
                        func_ov002_021df62c(a,G.card,VALUE(a,G.card));
                        func_ov002_021d59cc(a,G.card,(u16)id,4,(u16)(short)result);
                    } else func_ov002_021d5b80(a,G.card,id,1);
                }
            }
        }
        if(G.flag==0) {
            int offset=(other&1)*0x868;
            int index=G.slot*20;
            u32 v=*(u32 *)(data_ov002_022cf1ac+offset+index);
            u32 hp=*(u16 *)(data_ov002_022cf1a4+offset+index);
            if(hp & ~((v>>6)&1) & ~(((v>>1)|(v>>2))&1)) {
                int id=func_ov002_021b9ecc(other,G.slot);
                int result=func_ov002_0225a978(id,0);
                if(result!=-1) {
                    if(result) {
                        if(id==0x1621) {
                            func_ov002_021df62c(other,G.slot,VALUE(other,G.slot));
                            func_ov002_021d59cc(a,G.card,(u16)id,4,0);
                        } else {
                            func_ov002_021df62c(other,G.slot,VALUE(other,G.slot));
                            func_ov002_021d59cc(other,G.slot,(u16)id,4,(u16)(short)result);
                        }
                    } else func_ov002_021d5b80(other,G.slot,id,1);
                }
            }
        }
        if(G.active!=0) return 1;
        if(G.flag==0 && G.other!=G.player) {
            if(G.active==0 && func_ov002_021bad58(G.player,G.card) && (card==0x1752 || card==0x18f3))
                func_ov002_021e30b4(PACK(G.player,G.card,card),(u16)VALUE(G.player,G.card),packed);
            switch(card2) {
            case 0x1286: case 0x1370: case 0x1476: case 0x19bd:
                if(G.saved==0) break;
            case 0x148a:
                func_ov002_021e30b4(PACK(G.other,G.slot,card2),(u16)VALUE(G.other,G.slot),packed);
                break;
            }
        }
        func_ov002_02244fe4(0x14,packed);
        S.state++;
        return 0;
    }
    return 1;
}

