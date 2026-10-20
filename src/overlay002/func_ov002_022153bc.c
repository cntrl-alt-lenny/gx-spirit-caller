typedef unsigned short u16;
typedef unsigned int u32;
struct Obj { u16 id; u16 side:1, rest:15; u16 pad4; u16 pad6; u16 flags; };
struct State { char pad[0x5a8]; int state; int saved; };
struct Node { u32 id:13, flag:1, pad:8, sub:8, rest:2; };
struct Player { char pad[12]; u32 count; char gap[0x110]; struct Node nodes[0x1d2]; };
struct Count { u32 count; char pad[0x864]; };
extern struct State data_ov002_022ce288;
extern struct Count data_ov002_022cf178[];
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021e104c(int a, int b, int unused, int d);
extern void func_ov002_0226ad5c(int arg0, int arg1, int arg2, int arg3);
int func_ov002_022153bc(struct Obj *p) {
    int side;
    int mode=0;
    switch(p->id) {
    case 0x12cc: mode=3; side=p->flags & 1; break;
    case 0x187d: mode=2; side=p->side; break;
    case 0x19b7: mode=2; side=p->side; break;
    }
    switch(data_ov002_022ce288.state) {
    case 0x80:
        data_ov002_022ce288.saved=data_ov002_022cf178[side & 1].count;
        func_ov002_021e104c(side,mode,(int)&data_ov002_022ce288,data_ov002_022ce288.saved);
        return 0x7f;
    case 0x7f: {
        u32 count=data_ov002_022cf178[side & 1].count;
        u32 i;
        int hits=0;
        i=0;
        int delta=count-data_ov002_022ce288.saved;
        if(i<count) {
            struct Node *node;
            struct Player *player=&data_ov002_022cf16c[side & 1];
            node=player->nodes;
            do {
                if(func_ov002_021b3fd8(side,11,0x12a1,node->sub*2+node->flag)!=0) hits++;
                i++; node++;
            } while(i<player->count);
        }
        int amount=delta-1;
        if(hits>1) amount-=hits-1;
        if(amount>0) func_ov002_0226ad5c(side,amount,0,0);
        return 0x7e;
    }
    }
    return 0;
}



