typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { unsigned short a:1,b:5,c:10; } Flags;
typedef struct { char active; char pad[31]; int id; int value; } Entry;
typedef struct {
 int *a,*b; int c,d,e;
 Entry entries[46]; Entry more[10]; Entry pair[2]; Entry six[6]; Entry three[3]; Entry two[2];
 char slots[10][32]; int ids[3], ids2[3]; int c34,c38,c3c,c40,c44,c48,c4c,c50,c54,c58,c5c,c60,c64,c68,c6c;
 Flags f70; short pad72; Flags f74[2],f78[2]; char pad7c[40]; int ca4,ca8,cac,cb0[5],cc4; char padcc8[72]; int d10;
} Object;
extern void Fill32(int value, void *dest, int size);
extern void *func_020211c8(unsigned int *a0);
extern int func_0202147c(int *p);
extern unsigned int func_0201ab44(void);
extern int func_0201ab80(void);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_0202227c(int idx, int b);
/* Original caller passes the object although the C callee ignores it. */
extern int func_ov002_022b9350(Object *p);
extern char data_ov002_022d1b7c[];
extern u32 data_020e0e70[],data_020e5c60[];
extern char data_021040ac[];
typedef struct { short key, value; } Pair;
extern char data_ov002_022cccc0[]; extern Pair data_ov002_022ccd24[];
extern int data_02104f4c[];
void func_ov002_022b5590(Object *p) {
 int i,kind,mode,key; u32 display; Entry *q; Entry *q2; int j; Entry *q3; int k; Entry *q4; int m; Entry *q5; int n; Flags *f,*g;
 Fill32(0,data_ov002_022d1b7c,0xd74);
 p->a=0;p->b=0;p->c=0;p->d=0;p->e=0;
 display=(*(volatile u32 *)0x04000000 & 0x1f00)>>8;
 *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0x1f00) | ((display|1)<<8);
 p->a=func_020211c8(data_020e0e70);func_0202147c(p->a);
 p->b=func_020211c8(data_020e5c60);func_0202147c(p->b);
 key=*(int *)(data_021040ac+0xb84);mode=0;kind=12;
 for(i=0;i<65;i++) {if(key==((Pair *)(data_ov002_022cccc0+0x62))[i].key){kind=data_ov002_022ccd24[i].key;break;}}
 switch(kind) {case 18:case 19:case 20:mode=func_0201ab80();break;case 12:case 13:case 14:mode=func_0201ab44();break;}
 func_02022234(6,kind);func_02022234(7,mode);func_02022234(4,(u32)(data_02104f4c[1]<<29)>>29);
 for(i=0,q=p->entries;i<46;i++,q++){q->active=0;q->id=-1;q->value=0;func_0202227c(i,(int)q);}
 for(j=0,q2=p->more;j<10;j++,q2++){q2->active=0;q2->id=-1;q2->value=0;func_0202227c(j+46,(int)q2);p->slots[j][0]=0;}
 for(i=0,q=p->pair;i<2;i++,q++){q->active=0;q->id=-1;q->value=0;func_0202227c(i+56,(int)q);}
 for(k=0,q3=p->six;k<6;k++,q3++){q3->active=0;q3->id=-1;q3->value=0;func_0202227c(k+58,(int)q3);}
 for(m=0,q4=p->three;m<3;m++,q4++){q4->active=0;q4->id=-1;q4->value=0;func_0202227c(m+64,(int)q4);}
 for(n=0,q5=p->two;n<2;n++,q5++){q5->active=0;q5->id=-1;q5->value=0;func_0202227c(n+67,(int)q5);}
 for(i=0;i<3;i++){p->ids[i]=-1;p->ids2[i]=-1;}
 p->c34=-1;p->c38=-1;p->c3c=0;p->c44=0;p->c48=1;p->c4c=0;p->c54=0;p->c58=0;p->c5c=-1;p->c60=0;p->c64=0;
 p->f70.a=0;p->f70.b=31;
 for(i=0,f=p->f74,g=p->f78;i<2;i++,f++,g++){f->a=(u16)i;f->b=31;g->a=(u16)i;g->b=31;}
 p->ca4=0;p->ca8=0;p->cac=0;
 for(i=0;i<5;i++)p->cb0[i]=0;
 p->cc4=0;p->d10=0;func_ov002_022b9350(p);
}






