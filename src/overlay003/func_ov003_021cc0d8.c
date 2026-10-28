typedef struct { void *task; int pad4[2]; int mode; unsigned short size; short pad12; unsigned short flags; char pad16[6]; unsigned int a:8,b:8; char tail[8]; } Obj;
typedef struct { char pad[8]; int f_8; } Sprite;
typedef struct { int pad[17]; int player, opponent, side, result, ready, pad58, done; } Global;
typedef struct { int pad0, state, phase, count, f10, pad14, f18; char pad1c[12]; Sprite *a,*b; char pad30[0x90]; Sprite *sprite; char padc4[0x9c]; Sprite *items[16]; } State;
extern Global data_ov003_021cf6c0;
typedef struct { char pad[0xc3c]; int index; char pad2[8]; int status; } Context;
extern Context data_021040ac;
extern char data_ov003_021cf370[];
extern int data_02104c40[];
extern int func_0201d47c(Obj *);
extern void *func_02006c0c(void *, int, int);
extern int func_0201e5b8(Obj *);
extern void Task_Invoke(void *);
extern int func_02034784(void);
extern int func_02034888(int,void *,int);
extern int func_02037208(int,int,int,int);
extern int func_0207fce8(Sprite *);
extern int func_020a991c(void);
extern void func_0208c884(unsigned short *,int);
extern int func_ov003_021cc8b8(int);
extern int func_ov003_021cca88(int);
extern int func_ov003_021cef78(int,int,int);
int func_ov003_021cc0d8(State *s) {
    Global *g = &data_ov003_021cf6c0;
    Obj obj;
    short packet[2]; short packet2;
    int i;
    switch (s->state) {
    case 0:
        s->count++;
        *(volatile int *)0x04000014 = ((s->count-16)<<4)&0x1ff;
        *(volatile int *)0x04000018 = ((s->count-16)<<4)&0x1ff;
        *(volatile int *)0x04001014 = ((s->count-16)<<4)&0x1ff;
        *(volatile int *)0x04001018 = ((s->count-16)<<4)&0x1ff;
        s->f18 += 16;
        *(volatile unsigned short *)0x04000040 = ((s->count<<3)+128)&255;
        *(volatile unsigned short *)0x04000044 = 192;
        *(volatile unsigned short *)0x04001040 = ((s->count<<3)+128)&255;
        *(volatile unsigned short *)0x04001044 = 192;
        if (s->count >= 16) {
            s->count=0; s->state=1;
            *(volatile int *)0x04000000 &= ~0xe000;
            *(volatile int *)0x04001000 &= ~0xe000;
            *(volatile unsigned short *)0x04000040=0; *(volatile unsigned short *)0x04000044=0;
            *(volatile unsigned short *)0x04001040=0; *(volatile unsigned short *)0x04001044=0;
        } break;
    case 1:
        switch (data_021040ac.status) { case 3: g->result=1; s->state=10; break; case 4: g->result=-1; s->state=10; break; default: s->state=2; break; }
        func_0201d47c(&obj);
        obj.task=func_02006c0c(data_ov003_021cf370,4,0);
        obj.mode=0x3400; obj.size=128;
        if (data_02104c40[data_021040ac.index]) { obj.flags=(obj.flags&~15)|6; func_0201e5b8(&obj); }
        if (data_02104c40[1-data_021040ac.index]) { obj.flags=(obj.flags&~15)|1; func_0201e5b8(&obj); Task_Invoke(obj.task); } break;
    case 2: if (++s->count>=16) { s->state=3; s->count=0; } break;
    case 3: if (func_ov003_021cc8b8((int)s)) { func_02037208(58,-1,0,1); s->state=4; s->count=0; } break;
    case 4:
        s->count += (s->count<256)*8;
        if(s->count>=256) { if(func_02034784()) { packet[0]=0; packet[1]=g->player; func_02034888(4,packet,4); } s->state=5; s->count=0; } break;
    case 5:
        if (func_02034784() && !g->ready) break; { s->count++; if(s->count==16 || s->count==32) s->phase++; if(s->phase>=2) {s->state=6;s->count=0;s->phase=0;} } break;
    case 6:
        if(s->count==0) { if(func_02034784()) { if(g->ready) { } else break; } else { g->opponent=func_020a991c()%3; if(g->player==g->opponent) g->opponent=func_020a991c()%3; } g->result=(g->opponent-g->player+7)%3-1; g->side=g->result<0; func_0207fce8(s->items[g->opponent+4]); }
        s->count += (s->count<256)*8;
        if(s->count>=256) { g->ready=0; s->state=7;s->count=0; for(i=0;i<2;i++,s=(State *)((char *)s+0x6c)) func_0207fce8(s->sprite); } break;
    case 7:
        if(s->count==0 && g->result!=0) func_02037208(55,-1,0,1);
        s->count += (s->count<256)*8;
        if(s->count>=256) { switch(g->result) {case 0:s->state=8;func_0207fce8(s->items[g->opponent+7]);break;case -1:case 1:s->state=9;s->f10=0;break;} s->count=0;} break;
    case 8:
        s->count++; if(s->count==16 || s->count==32 || s->count==48) s->phase++;
        if(s->phase>=3) {func_0207fce8(s->a);func_0207fce8(s->b);s->state=3;s->count=0;s->phase=0;} break;
    case 9: s->count += s->count<16; if(s->count>=16) {s->state=10;s->count=0;} break;
    case 10: s->count += s->count<16; if(s->count>=16) {func_0207fce8(s->a);func_0207fce8(s->b);s->state=11;s->count=0;} break;
    case 11: if(func_ov003_021cca88((int)s)) {func_ov003_021cef78((int)s,g->side,1);s->state=12;s->count=0;} break;
    case 12: s->count++; if(s->count==16 || s->count==32) s->phase++; if(s->phase>=2){s->state=13;s->count=0;s->phase=0;} break;
    case 13: if(s->count==0) {if(!func_02034784()) g->done=1; else {packet2=3;func_02034888(4,&packet2,2);}} s->count += (s->count<256)*4; if(s->count>=256 && g->done){s->state=14;s->count=0;} break;
    case 14: if(s->count==0) func_02037208(144,-1,0,1); s->count += s->count<32; func_0208c884((unsigned short *)0x0400006c,(32-s->count)>>1);func_0208c884((unsigned short *)0x0400106c,(32-s->count)>>1); if(s->count>=32){func_0208c884((unsigned short *)0x0400006c,0);func_0208c884((unsigned short *)0x0400106c,0);s->state=15;s->count=0;} break;
    case 15: s->count += s->count<64; if(s->count>=64){s->count=0;return 1;} break;
    }
    return 0;
}










