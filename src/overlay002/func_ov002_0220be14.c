typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 w0;
    u16 bit0:1;
    u16 pad1:13;
    u16 bit14:1;
    u16 pad15:1;
} S021ff3bc;
typedef struct {
    u16 id;
    u16 player:1;
    u16 pad:5;
    u16 kind:6;
    u16 pad2:4;
    u16 unused[3];
    u16 card;
    u32 unused2[2];
    u32 value:9;
    u32 side:1;
    u32 slot:4;
    u32 pad3:1;
    u32 active:1;
    u32 pad4:16;
} Self;
typedef struct {
    u32 pad:13;
    u32 low:1;
    u32 pad2:8;
    u32 high:8;
    u32 pad3:2;
} Card;
extern char data_ov002_022ce288[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int func_ov002_021bc0d4(int, int, int);
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_021b9ecc(int, int);
extern int func_0202e2f8(int unused0);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_0223f6c4(Self *);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
int func_ov002_0220be14(Self *self, int arg) {
    unsigned int i, count;
    int n;
    char *p;
    int side, slot, card;
    if (func_ov002_021bc0d4(1-self->player,1,0)==0) return 0;
    if (func_ov002_021ff3bc((S021ff3bc *)self,arg)==0) return 0;
    n=*(int *)(data_ov002_022ce288+0x5d4);
    p=data_ov002_022ce288;
    count=0;
    for(i=0;i<n;i++,p++) {
        if ((unsigned char)p[0x5dc]==8) count++;
    }
    if(count!=1) return 0;
    if(self->kind==8) {
        side=self->side;
        slot=self->slot;
        card=func_ov002_021b9ecc(side,slot);
        if(side!=self->player) return 0;
        if(!self->active) return 0;
        if(*(u16 *)(data_ov002_022cf1a4+(side&1)*0x868+slot*0x14)==0) return 0;
        if(self->value != ((Card *)(data_ov002_022cf16c+(side&1)*0x868+0x30+slot*0x14))->high*2 + ((Card *)(data_ov002_022cf16c+(side&1)*0x868+0x30+slot*0x14))->low) return 0;
        if(func_0202e2f8(card)!=0) return 0;
        if(func_ov002_021c8470(side,slot)>0x5dc) return 0;
        self->card=card;
        if(*(int *)(data_ov002_022cf17c+(self->player&1)*0x868)==0) {
            int v=func_ov002_0223f6c4(self);
            if(func_ov002_022536e8(self->player,self->id,v)==0) return 0;
        }
        return 1;
    }
    return 0;
}




