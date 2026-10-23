typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u32 id:13; u32 player:1; u32 pad14:1; u32 mode:2; u32 pad17:4; u32 flag:1; u32 hi:8; u32 pad30:2; } Entry;
struct node { char pad[6]; u16 count:8; u16 countpad:8; u16 arr8[5]; u16 f18; char tail[4]; };
struct Node0223def4 { char pad[8]; u16 arr8[5]; u16 f18; };
extern u16 data_ov002_022ce088[];
extern Entry data_ov002_022cdc88[];
extern int data_ov002_022cd73c[];
extern int data_ov002_022cdc78[];
extern char data_ov002_022ce288[];
extern struct node data_ov002_022ce588[];
extern char data_ov002_022cf8f4[];
extern int func_0202e234(int x);
extern u32 func_ov002_021b947c(int id);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021b9a30(u32 a, u32 b);
extern int func_ov002_021c33e4(int a,int b,int c);
extern int func_ov002_021c3608(int a,int b,int c);
extern u16 func_ov002_0223de94(struct node *arg0,int arg1);
extern int func_ov002_0223def4(struct Node0223def4 *self,int idx);
int func_ov002_021afc6c(int i) {
    Entry *p = data_ov002_022cdc88;
    int a,b;
    int flags;
    int type = (u8)data_ov002_022ce088[i];
    struct node *n;
    switch (type) {
    default: flags=1; break;
    case 11: flags=2; break;
    case 13: flags=4; break;
    case 14: flags=8; break;
    case 12: flags=16; break;
    case 15: flags=32; break;
    case 16: flags=0; break;
    }
    if (func_0202e234(p[i].id) && (unsigned)(type-14)<=1) {
        if (type==14) {
            int idx = func_ov002_021b99b4(p[i].player,p[i].hi*2+p[i].player);
            if (func_ov002_021c33e4(data_ov002_022cd73c[1],p[i].player,idx)==0) flags |= 0x80;
        }
        if (type==15) {
            int idx = func_ov002_021b9a30(p[i].player,p[i].hi*2+p[i].player);
            if (func_ov002_021c3608(data_ov002_022cd73c[1],p[i].player,idx)==0) flags |= 0x80;
        }
        switch (p[i].mode) {
        case 1: flags |= 0x200; break;
        case 2: flags |= 0x100; break;
        }
    }
    if (p[i].flag) flags |= 0x40;
    if (type==15) {
        u32 v=func_ov002_021b947c(p[i].hi*2+p[i].player);
        if ((u8)((u16)v >> 8)==15) {
            int value=(u8)*(u16 *)(data_ov002_022cf8f4 + ((u8)v & 1)*0x868 + (u16)(v>>16)*2);
            switch(value) {
            case 0x40: flags |= 0x400; break;
            case 0x80: flags = (flags & 0x3f)|0x800; break;
            }
        }
    }
    for (a=*(int *)(data_ov002_022ce288+0x484)-1; a>=0; a--) {
        n=&data_ov002_022ce588[a];
        for (b=0;b<n->count;b++) {
            int id = func_ov002_0223def4((struct Node0223def4 *)n,b);
            int key = p[i].hi*2+p[i].player;
            if (id == key) {
                u32 v = func_ov002_0223de94(n,b);
                if (type==(u8)((u16)v>>8)) flags |= 0x1000;
            }
        }
    }
    {
        int player = p[i].player;
        if (data_ov002_022cdc78[1]==0x4a) flags &= 0x3f;
        if ((data_ov002_022cd73c[1]^1)==player) flags |= 0x8000;
        else flags &= ~0x8000;
    }
    return flags;
}



