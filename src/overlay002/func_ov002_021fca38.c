typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 side:1, zone:5, tag:6, mode:2, flip:1, rest:1; u16 unused:6, key:9, spare:1; } Card;
typedef struct { int pad; int side; } Context;
typedef struct { char pad[0xcec]; int side; char pad2[8]; int state; char pad3[0x84]; int message; } State;
typedef struct { char pad[0x5d4]; u32 count; char pad2[4]; unsigned char tags[32]; } List;
typedef struct { u32 index:9, rest:23; } Value;
typedef struct { u16 id:13, rest:3; u16 pad; } Entry;
typedef struct { int value; char pad[0x864]; } Player;
extern Context data_ov002_022cd73c;
extern State data_ov002_022d016c;
extern List data_ov002_022ce288;
extern Value data_ov002_022ce884[];
extern Entry data_ov002_022d0250[];
extern Player data_ov002_022cf178[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202e234(int x);
extern int func_0202f9e8(int x);
extern int IsValue12D3Or147E(int a0);
/* The original caller consumes r0, although the existing C callee says void. */
extern int func_ov002_021b30ac(int arg0,int arg1,int arg2);
extern int func_ov002_021b3ecc(int arg0,int arg1,int arg2);
extern int func_ov002_021b3f0c(int arg0,int arg1,int arg2);
extern int func_ov002_021b3fd8(int arg0,int arg1,int arg2,int arg3);
extern int func_ov002_021b40dc(int arg0,int arg1,int arg2,int arg3);
extern int func_ov002_021b4120(int arg0,int arg1,int arg2);
extern int func_ov002_021b78b8(int id);
extern u32 func_ov002_021b947c(int key);
extern int func_ov002_021baca8(int a0,int a1,int a2);
extern int func_ov002_021bae7c(int player,int id,int except);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021bb418(int arg0);
extern int func_ov002_021bd710(int side,int zone);
extern int func_ov002_021bd85c(int a,int b);
extern int func_ov002_021f3ba0(u16 *p);
#define FAIL goto reject;
int func_ov002_021fca38(Card *self) {
    int side = self->side ^ self->flip;
    int flags;
    int player;
    int zone;
    unsigned int i;
    if(self->zone <= 4) { if(func_ov002_021bd710(self->side,self->zone) == 0) { } else FAIL }
    else { if(func_ov002_021bd85c(self->id,self->key)) FAIL }
    if(!func_0202e234(self->id) || (self->zone >= 5 && self->zone <= 10)) {
        if(func_ov002_021b3ecc(0,11,0x1407)) FAIL
        if(self->zone <= 10) { if(func_ov002_021b3ecc(self->side,self->zone,0x19ae)) FAIL }
    }
    if(IsValue12D3Or147E(self->id)) return 0;
    if(self->zone <= 4) {
        u32 pair=func_ov002_021b947c(self->key);

        if((u16)(pair>>16)) { if(func_ov002_021b3f0c((unsigned char)pair,(unsigned char)((u16)pair>>8),0x1944) == 0) { } else FAIL }
        else { if(func_ov002_021b3ecc((unsigned char)pair,(unsigned char)((u16)pair>>8),0x1944)) FAIL }
    }
    if(func_ov002_021b3fd8(data_ov002_022d016c.side,11,0x15ff,self->key)) FAIL
    if(func_0202f9e8(self->id)==1) { if(func_ov002_021bb068(0x148e)) FAIL }
    if(func_ov002_021bb418(0x168a)) { if(func_ov002_021f3ba0((u16 *)self)) FAIL }
    if(!func_0202e234(self->id) || (self->zone >= 5 && self->zone <= 10)) {
        if(func_ov002_021b3ecc(0,11,0x1684)) FAIL
        if(func_ov002_021b3fd8(side,11,0x1679,2) == 0) { } else FAIL
    } else { if(func_ov002_021b3fd8(side,11,0x1679,1)) FAIL }
    if(self->mode==0 || self->mode==3) {
        flags=func_ov002_021b78b8(self->id);
        if(data_ov002_022d016c.state) {
            if(flags&1) { if(func_ov002_021bae7c(1-side,0x178b,-1)) FAIL }
            if(flags&2) { if(func_ov002_021bae7c(side,0x178b,-1) == 0) { } else FAIL }
        } else {
            if(func_ov002_021b40dc(data_ov002_022d016c.side,11,0x1885,0)) {
                if(flags&1) { if(side==data_ov002_022d016c.side) FAIL }
                if(flags&2) { if(side!=data_ov002_022d016c.side) FAIL }
            }
        }
    }
    if(self->zone<=10 || self->mode==0) {
        if(func_0202b878(self->id)==23) {
            for(player=0;player<2;player++) {
                for(zone=0;zone<=4;zone++) {
                    if(func_ov002_021baca8(player,zone,0x1296)) {
                        if(player!=self->side) FAIL
                        if(!func_ov002_021b30ac(player,zone,0x12d3)) FAIL
                    }
                }
            }
            if(func_ov002_021bb068(0x1760)) FAIL
            if(func_ov002_021b3ecc(1-self->side,11,0x1840) == 0) { } else FAIL
        } else {
            if(!func_0202e234(self->id)) {
                if(self->zone>=5 || self->mode==0) {
                    if(func_ov002_021bb068(0x15da)) FAIL
                    if(func_ov002_021bb068(0x1765)) FAIL
                }
            }
        }
    }
    if(self->mode==0 && !func_0202e234(self->id)) {
        if(func_ov002_021b3ecc(self->side,11,0x18ab)) {
            u16 pair=func_ov002_021b947c(func_ov002_021b4120(self->side,11,0x18ab));
            if((unsigned char)(pair>>8)<=10) FAIL
        }
        if(func_ov002_021b3fd8(self->side,11,0x1885,1)) FAIL
        if(func_ov002_021b3ecc(self->side,11,0x1a2a)) FAIL
    }
    if(self->mode==0 && func_0202b878(self->id)==22) {
        if(func_ov002_021b30ac(self->side,self->zone,0x1390)) FAIL
        if(func_ov002_021b3ecc(self->side,11,0x13bd)) FAIL
        if(data_ov002_022cf178[(1-self->side)&1].value==0) {
            if(func_ov002_021bae7c(1-self->side,0x1910,-1)) FAIL
        }
        if(func_0202b8c0(self->id)==5) { if(func_ov002_021bae7c(1-self->side,0x1722,-1)) FAIL }
        if(func_ov002_021b3ecc(self->side,11,0x1af7)) FAIL
    }
    if(self->mode==0 && func_0202b878(self->id)==23) {
        for(i=0;i<data_ov002_022ce288.count;i++) {
            if(data_ov002_022ce288.tags[i]==6) {
                switch(data_ov002_022d0250[data_ov002_022ce884[i].index].id) {
                case 0x182f: case 0x1830: case 0x1831: case 0x1832: FAIL
                }
            }
        }
        if(func_ov002_021b3ecc(0,11,0x188e)) FAIL
        if(data_ov002_022d016c.state==3) {
            if(func_ov002_021bae7c(1-self->side,0x1833,-1)) FAIL
            if(func_ov002_021bae7c(1-self->side,0x1834,-1)) FAIL
            if(func_ov002_021b3ecc(0,11,0x19bb)) FAIL
        }
    }
    if(self->mode==0 && self->zone<=10) { if(func_ov002_021b30ac(self->side,self->zone,0x184a)) FAIL }
    if((self->mode==0 || self->mode==2) && !func_0202e234(self->id)) {
        if(func_ov002_021b3fd8(side,11,0x1664,self->key)) FAIL
        if(func_ov002_021b3fd8(side,11,0x16dd,self->id)) FAIL
    }
    return 0;
reject:
    if(side == data_ov002_022cd73c.side) data_ov002_022d016c.message = 20;
    return 1;
}







