typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { int x,y; } Vec;
typedef struct { u16 side:1, index:5, offset:8, pad:2; } Bits;
typedef struct { u32 id:13, side:1, hidden:1, rest:7, offset:8, top:2; } Card;
typedef struct { u32 attr; u16 tile; u16 pad; } Sprite;
typedef struct { char pad[0xcc]; } Big;
typedef struct { char pad[0x580]; int angle; char pad2[0x1c]; u16 ids[10]; int selected, count, source, fade; } Obj;
extern short data_020bef80[];
extern char data_ov002_022d0f98[];
extern void *func_ov002_021afb90(int i);
extern int func_ov002_021b947c(int id);
extern int func_ov002_0229da1c(void *self,int index);
extern int func_ov002_0229d9f8(void *self,int index);
extern void func_ov002_022a6e04(Vec *out,void *self,int side,int index,int offset);
extern void func_0208b0fc(int unused0,int unused1,int unused2);
extern void func_0208b108(int *in,int *out,int m01,int m23);
extern int func_0207ef90(void *ctx,int *matrix);
extern int func_0207f05c(void *ctx,Sprite *sprite,int count);
extern void func_0208e318(int *out,int a,int b,int c,int d);
void func_ov002_022a96a8(Obj *self) {
    int seen, i;
    int temp[4], scaled[4], matrix[4];
    Sprite sprite;
    Vec hpos, pos, hp, p;
    Bits high, b;
    int id, packed, n, angle, scale;
    if (self->selected == 0 && self->fade == 0) return;
    sprite.attr = 0x80002100;
    sprite.tile = 0x155d;
    if (self->fade != 0) {
        n = self->source;
        if (n >= 0) {
            Card *c = func_ov002_021afb90(n-1);
            id = ((Card *)func_ov002_021afb90(n-1))->offset * 2 + c->side;
        } else id = self->ids[self->selected];
        packed = func_ov002_021b947c(id);
        high.side = (u8)packed;
        high.index = (u8)((u16)packed >> 8);
        high.offset = (u16)((u32)packed >> 16);
        if (high.index == 11) func_ov002_0229da1c((Big *)((char *)self+0x3e0)+high.side,high.offset);
        func_ov002_022a6e04(&hp,self,high.side,high.index,high.offset);
        hpos = hp;
        n = self->fade;
        scale = n < 16 ? n : 16;
        angle = (u16)(-(self->angle+(32-n)) << 8) >> 4;
        func_0208b0fc((int)temp,data_020bef80[angle*2],data_020bef80[angle*2+1]);
        n = (self->fade << 10) / 32 + 0xc00;
        func_0208b108(temp,scaled,n,n);
        sprite.attr = (sprite.attr & 0xfe00ff00) | ((hpos.y-32)&255) | (((hpos.x-32)&511)<<16);
        sprite.tile = (sprite.tile & ~0xf000) | 0x1000;
        sprite.attr = (sprite.attr & ~0xc00) | 0x400;
        n = func_0207ef90(data_ov002_022d0f98,scaled);
        sprite.attr = (sprite.attr & 0xc1fffcff) | 0x300 | (n<<25);
        func_0208e318((int *)0x04001050,0,63,scale,16-scale);
        func_0207f05c(data_ov002_022d0f98,&sprite,1);
    }
    angle = (u16)(-self->angle << 8) >> 4;
    func_0208b0fc((int)matrix,data_020bef80[angle*2],data_020bef80[angle*2+1]);
    n = func_0207ef90(data_ov002_022d0f98,matrix);
    sprite.attr = (sprite.attr & 0xc1fffcff) | 0x100 | (n<<25);
    sprite.attr &= ~0xc00;
    sprite.tile = (sprite.tile & ~0xf000) | 0x1000;
    seen = 0;
    for (i=0;i<self->count;i++) {
        if (self->source >= 0) {
            if (((Card *)func_ov002_021afb90(i))->hidden) continue;
            {
                Card *c = func_ov002_021afb90(i);
                id = ((Card *)func_ov002_021afb90(i))->offset*2 + c->side;
            }
        } else id = self->ids[i];
        packed = func_ov002_021b947c(id);
        b.side = (u8)packed;
        b.index = (u8)((u16)packed >> 8);
        b.offset = (u16)((u32)packed >> 16);
        if (b.index == 14) {
            if (seen != 0) continue;
            seen = 1;
        }
        if (b.index == 11 && func_ov002_0229d9f8((Big *)((char *)self+0x3e0)+b.side,b.offset)==0) continue;
        func_ov002_022a6e04(&p,self,b.side,b.index,b.offset);
        pos = p;
        sprite.attr = (sprite.attr & 0xfe00ff00) | ((pos.y-16)&255) | (((pos.x-16)&511)<<16);
        func_0207f05c(data_ov002_022d0f98,&sprite,1);
    }
}

