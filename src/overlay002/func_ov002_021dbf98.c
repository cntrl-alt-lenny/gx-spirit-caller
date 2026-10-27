typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u32 id:13; u32 bit13:1; u32 pad:8; u32 kind:8; u32 rest:2; u32 unused[4]; } Entry;
struct Input { u16 index:16; u16 kind:4; u16 rest:12; };
typedef struct { struct Input input; u16 unused; u16 next; } Link;
extern char data_ov002_022cf16c[], data_ov002_022cf1a4[], data_ov002_022cf1a6[], data_ov002_022cf1ac[];
extern Link data_ov002_022d0650[];
extern struct { char pad[0xd4]; u32 visited; } data_ov002_022d016c;
extern unsigned int func_0202b878(int id);
extern int func_0202e310(int unused0);
extern int func_0202e328(int unused0);
extern int func_ov002_021b9ecc(int player, int idx);
/* The original consumes r0 from these calls despite their current void C definitions. */
extern int func_ov002_021b30ac(int arg0,int arg1,int arg2);
extern int func_ov002_021c229c(int a,int b,int c,int d,int e);
extern int func_ov002_021b39c4(int a,int b,int c);
extern int func_ov002_021b3ecc(int arg0,int arg1,int arg2);
extern int func_ov002_021b34f4(int row_sel,int col_idx,int lo_want,int hi_want);
extern int func_ov002_021b3618(int player,int idx);
extern int func_ov002_021b3fd8(int arg0,int arg1,int arg2,int arg3);
extern int func_ov002_021b43a4(struct Input *p,int arg1,int arg2);
extern int func_ov002_021c1d28(int a,int b,int c);
extern int func_ov002_021c1e20(int a,int b,int c);
extern void func_ov002_021d94ac(int a,int b,int c,int d);
extern int func_ov002_021d96ec(int player,int val);
#define MASK(a,b) (*(u16 *)(data_ov002_022cf1a4+(a&1)*0x868+b*20))
#define FLAGS(a,b) (*(u32 *)(data_ov002_022cf1ac+(a&1)*0x868+b*20))
#define CARD(a,b) ((Entry *)(data_ov002_022cf16c+(a&1)*0x868+0x30+b*20))
#define ACTIVE(a,b) (MASK(a,b)&~((FLAGS(a,b)>>6)&1)&~(((FLAGS(a,b)>>1)|(FLAGS(a,b)>>2))&1))
void func_ov002_021dbf98(int a,int b,int mode,int source,int arg)
{
 int enabled=(mode&2)>0;
 int id=func_ov002_021b9ecc(a,b);
 int i,j;
 Link *p;
 int next;
 if(func_0202b878(source)==0x16) {
  if(func_ov002_021c1d28(a,b,arg)!=0) return;
 } else if(func_0202b878(source)==0x17) {
  if(func_ov002_021c1e20(a,b,arg)!=0) return;
 }
 if(b<=4 && enabled && func_ov002_021b30ac(a,b,0x1825)!=0) {
  int pair=func_ov002_021b39c4(a,b,1);
  func_ov002_021dbf98((u8)pair,(u8)((u16)pair>>8),2,0,0); return;
 }
 if(b>=5 && enabled && source!=0 && func_ov002_021b3ecc(a,b,0x1513)!=0) {
  func_ov002_021d94ac(a,b,-1,0x1513); return;
 }
 if(id==0) return;
 if(data_ov002_022d016c.visited&(1<<(b+(a<<4)))) return;
 data_ov002_022d016c.visited|=1<<(b+(a<<4));
 switch(id) {
 case 0x12be:
  if(!(mode&8) && enabled) {
   for(i=0;i<2;i++) {
    char *p=data_ov002_022cf16c+(i&1)*0x868;
    for(j=0;j<5;j++,p+=20) {
     u32 f=*(u32 *)(p+0x40); u16 h=*(u16 *)(p+0x38);
     if(h&~((f>>6)&1)&~(((f>>1)|(f>>2))&1)) {
      if(func_0202e310(func_ov002_021b9ecc(i,j))!=0)
       func_ov002_021dbf98(i,j,2,0,i!=a?1:0);
     }
    }
   }
  }
  break;
 case 0x137d: case 0x16a2: case 0x1768: case 0x17b7: case 0x1a36: case 0x1a42: case 0x1a7e: case 0x1a9b: case 0x1b65:
  if(ACTIVE(a,b)) {
   for(i=0;i<2;i++) {
    Entry *p=CARD(i,0);
    for(j=0;j<=10;p=(Entry *)((char *)p+20),j++) {
     if(func_ov002_021b34f4(i,j,a,b)!=0 && p->id!=0 && func_ov002_021c229c(i,j,id,b,1)!=0)
      func_ov002_021dbf98(i,j,2,id,i!=a?1:0);
    }
   }
  }
  break;
 case 0x1366: case 0x1880: case 0x1881: case 0x19d7:
  if(!enabled) break;
 case 0x12d3: case 0x15e6: case 0x1625:
  if(ACTIVE(a,b)) {
   int pair=func_ov002_021b3618(a,b);
   if(pair!=0xffff) {
    int x=(u8)pair, y=(u8)(pair>>8);
    if(CARD(x,y)->id!=0 && MASK(x,y)!=0) {
     if(id==0x1625 || id==0x1880 || (u32)id==0x1881)
      func_ov002_021dbf98(x,y,0,id,x!=a?1:0);
     else if(func_ov002_021c229c(x,y,id,b,1)!=0)
      func_ov002_021dbf98(x,y,2,id,x!=a?1:0);
    }
   }
  }
  break;
 case 0x1468: case 0x1497: case 0x1498: case 0x1499: case 0x149a:
  if(b>=5 && MASK(a,b)!=0 && func_ov002_021d96ec(a,0x1468)!=0) {
   char *base=data_ov002_022cf16c+(a&1)*0x868;
   Entry *p=(Entry *)(base+0x94); char *q=base+0x64;
   for(i=5;i<10;i++,p=(Entry *)((char *)p+20),q+=20) {
    if(i!=b && p->id!=0 && *(u16 *)(q+0x38)!=0) {
     switch(p->id) {
      case 0x1468: case 0x1497: case 0x1498: case 0x1499: case 0x149a:
       func_ov002_021dbf98(a,i,0,0x1468,0); break;
     }
    }
   }
  }
  break;
 case 0x17ad: case 0x17ae: case 0x17af:
  if(b>=5 && MASK(a,b)!=0 && func_ov002_021d96ec(a,0x17af)!=0) {
   char *base=data_ov002_022cf16c+(a&1)*0x868;
   Entry *p=(Entry *)(base+0x94); char *q=base+0x64;
   for(i=5;i<10;i++,p=(Entry *)((char *)p+20),q+=20) {
    if(i!=b && p->id!=0 && *(u16 *)(q+0x38)!=0) {
     if(p->id==0x17ad || (int)p->id==0x17ae || p->id==0x17af)
      func_ov002_021dbf98(a,i,0,0x17af,0);
    }
   }
  }
  break;
 case 0x150e:
  if(b>=5 && ACTIVE(a,b)) {
   for(i=0;i<2;i++) {
    char *p=data_ov002_022cf16c+(i&1)*0x868; Entry *q=(Entry *)(p+0x30);
    for(j=0;j<5;p+=20,q=(Entry *)((char *)q+20),j++) {
     if(*(u16 *)(p+0x38)!=0 && func_0202e328(q->id)!=0)
      func_ov002_021dbf98(i,j,0,0x150e,i!=a?1:0);
    }
   }
  }
  break;
 case 0x1a2b: case 0x1a2c: case 0x1a2d: case 0x1a2e:
  if(MASK(a,b)!=0) {
   for(i=0;i<2;i++) {
    Entry *p=CARD(i,0);
    for(j=0;j<5;p=(Entry *)((char *)p+20),j++) {
     if(p->id!=0 && func_ov002_021b3ecc(i,j,id)!=0 && func_ov002_021c229c(i,j,id,b,0)!=0)
      func_ov002_021dbf98(i,j,2,id,i!=a?1:0);
    }
   }
  }
  break;
 case 0x1a7c:
  if(b>=5 && ACTIVE(a,b)) {
   Entry *p=CARD(a,0);
   for(i=0;i<2;i++) {
    for(j=0;j<5;j++) {
     if(func_ov002_021b3fd8(i,j,id,p[b].kind*2+p[b].bit13)!=0)
      func_ov002_021dbf98(i,j,0,id,i!=a?1:0);
    }
   }
  }
  break;
 case 0x1a95:
  for(i=0;i<2;i++) {
   Entry *p=CARD(i,0);
   for(j=0;j<=10;p=(Entry *)((char *)p+20),j++) {
    if(func_ov002_021b34f4(i,j,a,b)!=0 && p->id!=0 && func_ov002_021c229c(i,j,id,b,0)!=0)
     func_ov002_021dbf98(i,j,2,id,i!=a?1:0);
   }
  }
  break;
 }
 next=*(u16 *)(data_ov002_022cf1a6+(a&1)*0x868+b*20);
 if(next==0) return;
 do {
  p=&data_ov002_022d0650[next];
  int result=func_ov002_021b43a4(&p->input,enabled,0);
  next=p->next;
  if(result!=0) {
   int pair=p->input.index;
   int x=(u8)pair, y=(u8)(pair>>8);
   int recurseMode=result==1?2:0;
   func_ov002_021dbf98(x,y,recurseMode,0,x!=a?1:0);
  }
 } while(next!=0);
}








