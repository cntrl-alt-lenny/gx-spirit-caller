typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u16 player:1; u16 kind:5; u16 index:8; u16 b14:1; u16 b15:1; } Loc;
typedef struct { u16 player:1; u16 kind:5; u16 index:10; } Input;
typedef struct Rec { u32 id:13; u32 flag13:1; u32 b14:1; u32 mode:2; u32 b17:1; u32 b18:1; u32 b19:1; u32 b20:1; u32 b21:1; u32 hi:8; u32 top:2; } Card;
typedef struct { u16 a; Input src,dst; u16 flags; char pad[0x804]; int active,state; int unused; Card card; } State;
extern State data_ov002_022ce950;
extern char data_ov002_022cf180[],data_ov002_022cf188[],data_ov002_022cf178[];
extern Card data_ov002_022cf168;
extern int data_ov002_022cd73c[];
extern int func_0202e234(int x);
/* Existing definition types self as void *, but this caller passes integer IDs. */
extern int func_ov002_021b0c04(void *self,int arg1);
extern void func_ov002_021b91c4(int *dst,const int *src);
extern u32 func_ov002_021b947c(int id);
extern int func_ov002_021b99b4(int player,int id);
extern int func_ov002_021b9a30(u32 a,u32 b);
extern void func_ov002_021baa04(int player,int kind,int extra);
extern void func_ov002_021bab38(int arg0,int kind,int v,struct Rec *p);
extern void func_ov002_021c2934(int player,int arg1,int arg2);
extern void func_ov002_021c29bc(int player,int arg);
extern void func_ov002_021c2c54(int player,u16 id);
extern void func_ov002_021c2d34(int player,u16 id);
extern void *func_ov002_021c93f0(int player,int kind,int extra);
extern int func_ov002_021c97f8(int player,int kind,int extra);
extern int func_ov002_021c988c(int player,int kind,int extra);
extern int func_ov002_0229ade0(int a,int b,int c,int d);
extern int func_ov002_0229c7f8(int arg);
void func_ov002_021cb584(void) {
    Input src = data_ov002_022ce950.src;
    int player = src.player;
    int kind = src.kind;
    int id = src.index;
    u32 found = func_ov002_021b947c(id);
    Input dst = data_ov002_022ce950.dst;
    int index = (u16)(found >> 16);
    int dp = dst.player;
    int dk = dst.kind;
    int di = dst.index;
    u16 flags = data_ov002_022ce950.flags;
    Loc from, to;
    Card *card;
    switch(data_ov002_022ce950.state) {
    case 0:
        if(kind == 14) {
            if(*(u32 *)(data_ov002_022cf180 + (player & 1)*0x868)-1 != func_ov002_021b99b4(player,id)) {
                func_ov002_021c2c54(player,(u16)id);
                func_ov002_0229ade0(0x16,player,kind,id);
            }
        }
        if(kind == 15) {
            if(*(u32 *)(data_ov002_022cf188 + (player & 1)*0x868)-1 != func_ov002_021b9a30(player,id)) {
                func_ov002_021c2d34(player,(u16)id);
                func_ov002_0229ade0(0x16,player,kind,id);
            }
        }
        data_ov002_022ce950.state++;
        break;
    case 1:
        if(func_ov002_0229c7f8(0x16)) return;
        if((found & 0xff) != player || (((u16)found >> 8)&0xff) != kind) {
            data_ov002_022ce950.active = 0;
            return;
        }
        card = func_ov002_021c93f0(player,kind,index);
        card->b18 = (flags & 1) ? 1:0;
        card->b19 = 0;
        card->b17 = 0;
        card->b20 = 0;
        if(kind == 11) card->mode = (((flags & 0x20)?1:0)<<1) | ((flags & 0x10)?1:0);
        switch(dk) { case 11: case 12: case 13:
            card->b14 = 0;
            card->mode = 0;
            card->b21 = 0; break;
        }
        if(dk == 14 && kind != 15) {
            func_ov002_021c2934(0,0x1361,1 << (card->flag13 << 3));
            func_ov002_021c2934(1,0x1361,1 << (card->flag13 << 3));
            if(func_0202e234(card->id)) func_ov002_021c29bc(1-card->flag13,0x1574);
        }
        func_ov002_021b91c4((int *)&data_ov002_022cf168,(const int *)card);
        if(dk == 11) di = *(int *)(data_ov002_022cf178 + (dp & 1)*0x868);
        if(player == (data_ov002_022cd73c[1]^1) && (flags & 1)) {
            if(dk == 15) {
                func_ov002_021b0c04(0x26,1);
                if(func_0202e234(data_ov002_022ce950.card.id) && !(flags & 0x80)) func_ov002_021b0c04(0x27,1);
            }
            if(kind == 11) func_ov002_021b0c04(0x28,1);
        }
        from.player = (u16)player;
        from.kind = (u16)kind;
        from.index = (u16)index;
        from.b15 = (u16)func_ov002_021c97f8(from.player,from.kind,from.index);
        from.b14 = (u16)func_ov002_021c988c(from.player,from.kind,from.index);
        to.player = (u16)dp;
        to.kind = (u16)dk;
        to.index = (u16)di;
        func_ov002_021baa04(from.player,from.kind,index);
        {
            int v = dk == 15 ? 0 : to.index;
            if(flags & 0x80) v = 0x80;
            func_ov002_021bab38(to.player,to.kind,v,&data_ov002_022cf168);
        }
        to.b15 = (u16)func_ov002_021c97f8(to.player,to.kind,to.index);
        to.b14 = (u16)func_ov002_021c988c(to.player,to.kind,to.index);
        func_ov002_0229ade0(0x18,(u16)(data_ov002_022ce950.card.hi*2+data_ov002_022ce950.card.flag13),*(u16 *)&from,*(u16 *)&to);
        data_ov002_022ce950.state++;
        break;
    case 2:
        if(func_ov002_0229c7f8(-1)) return;
        data_ov002_022ce950.active = 0;
        return;
    }
}




