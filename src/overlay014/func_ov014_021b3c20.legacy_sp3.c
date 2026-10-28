typedef struct { int f0,f4,f8,fc; } Req;
typedef struct { int f0,f4; } Out;
typedef unsigned short Pair;
typedef struct { int init; int a,b,c; Out d; int e,f,g; Out h; int i,j,k; Out l; int m,n,o; Out p; Pair q,r; } State;
extern int data_ov014_022350e0[],data_ov014_022350f4[];
extern signed char data_ov014_021b4e34[],data_ov014_021b4e54[],data_ov014_021b4e74[],data_ov014_021b4e94[];
extern signed char data_ov014_021b4eb4[],data_ov014_021b4ed4[],data_ov014_021b4ef4[],data_ov014_021b4f14[];
extern signed char data_ov014_021b4f34[],data_ov014_021b4f54[],data_ov014_021b4f74[],data_ov014_021b4f94[];
extern signed char data_ov014_021b4fb4[],data_ov014_021b4fd4[],data_ov014_021b4ff4[],data_ov014_021b5014[];
extern int OS_SPrintf(signed char *, const signed char *, ...);
extern void func_02094504(int, void *, int);
extern void func_0201e7e0(void);
extern void func_0201ef90(int *, int *, int *, int, int, int, Req *, int, int, Out *);
extern void func_02005800(int);
extern void func_ov014_021b3b9c(void);
int func_ov014_021b3c20(State *s) {
 signed char bufs[4][0x40];
 void *table[4];
 signed char *ptr; int i;
 data_ov014_022350e0[1]=0; data_ov014_022350e0[0]=0;
 if (!s->init) { func_02094504(0,data_ov014_022350f4,0x5c); s->q=(s->q & ~0xff)|1; s->q=(s->q & ~0xff00)|0x100; s->r=(s->r & ~0xff)|1; s->r=(s->r & ~0xff00)|0x100; }
 s->init=1;
 OS_SPrintf(bufs[0],data_ov014_021b4e34,(unsigned int)(s->q << 24) >> 24);
 OS_SPrintf(bufs[1],data_ov014_021b4e54,(unsigned int)(s->q << 24) >> 24);
 OS_SPrintf(bufs[2],data_ov014_021b4e74,(unsigned int)(s->q << 24) >> 24);
 OS_SPrintf(bufs[3],data_ov014_021b4e94,(unsigned int)(s->q << 24) >> 24);
 ptr=bufs[0]; for(i=0;i<4;i++,ptr+=0x40) table[i]=ptr;
 func_0201e7e0();
 func_0201ef90(&s->a,&s->b,&s->c,0,0,1,(Req *)table,1,0x200,&s->d);
 OS_SPrintf(bufs[0],data_ov014_021b4eb4,(unsigned int)(s->q << 16) >> 24);
 OS_SPrintf(bufs[1],data_ov014_021b4ed4,(unsigned int)(s->q << 16) >> 24);
 OS_SPrintf(bufs[2],data_ov014_021b4ef4,(unsigned int)(s->q << 16) >> 24);
 OS_SPrintf(bufs[3],data_ov014_021b4f14,(unsigned int)(s->q << 16) >> 24);
 for(i=0;i<4;i++) table[i]=bufs[i];
 func_0201e7e0();
 func_0201ef90(&s->e,&s->f,&s->g,0x6000,0x200,1,(Req *)table,1,0x200,&s->h);
 OS_SPrintf(bufs[0],data_ov014_021b4f34);
 OS_SPrintf(bufs[1],data_ov014_021b4f54);
 OS_SPrintf(bufs[2],data_ov014_021b4f74);
 OS_SPrintf(bufs[3],data_ov014_021b4f94);
 s->r=(s->r & ~0xff)|1;
 for(i=0;i<4;i++) table[i]=bufs[i];
 func_0201e7e0();
 func_0201ef90(&s->i,&s->j,&s->k,0xa000,0x400,1,(Req *)table,1,0x200,&s->l);
 OS_SPrintf(bufs[0],data_ov014_021b4fb4);
 OS_SPrintf(bufs[1],data_ov014_021b4fd4);
 OS_SPrintf(bufs[2],data_ov014_021b4ff4);
 OS_SPrintf(bufs[3],data_ov014_021b5014);
 s->r=(s->r & ~0xff00)|0x100;
 for(i=0;i<4;i++) table[i]=bufs[i];
 func_0201e7e0();
 func_0201ef90(&s->m,&s->n,&s->o,0x12000,0x600,1,(Req *)table,1,0x200,&s->p);
 func_02005800((int)func_ov014_021b3b9c);
 return 1;
}





