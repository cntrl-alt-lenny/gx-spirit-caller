typedef unsigned int u32;
typedef struct Node { int key; struct Node *next; } Node;
typedef struct { char pad[0x24]; int lo,hi,cur; char tail[0x18]; } obj_t;
typedef struct { volatile int field_0; int field_4,field_8,field_c,field_10; char pad[4]; int field_18; volatile int field_1c; } Obj_t;
extern Node *func_020977c0(int unused0,int unused1);
extern int func_02097ea4(obj_t *p,int val,int mode);
/* The fourth parameter is unused; this caller supplies only three registers. */
extern int func_02097f10();
extern int func_02097ff0(int *self);
extern int func_02098104(int *self,int a1,int a2,int a3,int a4);
extern void func_02098388(Obj_t *obj);
/* The trailing parameters are unused; this caller supplies only the destination. */
extern int func_020a5654();
extern void func_02094688(const void *,void *,u32);
extern void func_02092904(void *,u32);
extern void func_020a55e0(void *,u32,u32,void *,int);
extern void func_020a26f0(u32 *,u32,u32,int);
typedef struct { u32 addr; volatile u32 size; } Entry;
extern Entry *data_021026e4;
typedef struct { char pad[0x80]; int base; } Boot;
extern char data_021026e8[];
extern void AutoloadCallback(void);
int func_020a2784(obj_t *file,u32 *header,u32 size) {
 int result=0;
 if(size>=0x164) {
  u32 remain=size;
  unsigned char *p=(unsigned char *)header;
  int close=0;
  u32 *module=0;
  u32 *info=0;
  int offset;
  int base;
  obj_t local;
  u32 params[4];
  p+=0x160; remain-=0x160;
  if(file) {
   offset=file->cur-file->lo;
   if(func_02097f10(file,header,0x160)<0x160) remain=0;
   base=header[0x20];
   if(base==0) base=0x1000000;
  } else {
   Boot *boot=(Boot *)0x027ffe00;
   base=boot->base;
   if(base==0) base=0x1000000;
   close=1;
   func_02098388((Obj_t *)&local);
   func_02098104((int *)&local,(int)func_020977c0((int)data_021026e8,3),0,base+0x88,-1);
   file=&local;
   offset=local.cur-local.lo;
   func_02094688(boot,header,0x160);
   header[0x18]|=0x00406000;
  }
  if(remain>=0x88) {
   func_02097ea4(file,offset+base,0);
   func_02097f10(file,p,0x88);
   p+=0x88; remain-=0x88;
  } else remain=0;
  if(remain>=0x70) {
   int n;
   signed char *name;
   func_020a5654((int)(module=(u32 *)p));
   p+=0x70; remain-=0x70;
   func_020a55e0(module,0,0x160,header,3);
   name=*(signed char **)((char *)file+8);
   for(n=0;n<3 && name[n]!=0;n++) {}
   func_02094688(name,module+4,n);
   module[5]=n;
  } else remain=0;
  if(remain>=0x10) {
   *(u32 *)p=0;
   ((u32 *)p)[1]=header[8]+(offset+file->lo);
   ((u32 *)p)[2]=header[12]+(offset+file->lo);
   info=(u32 *)p;
   p+=0x10; remain-=0x10;
  } else remain=0;
  if(remain>=header[11]+header[15]) {
   u32 start=file->lo;
   func_02097ea4(file,info[1]-start,0);
   func_02097f10(file,p,header[11]);
   func_020a55e0(module,info[1],header[11],p,3);
   p+=header[11];
   func_02097ea4(file,info[2]-start,0);
   func_02097f10(file,p,header[15]);
   func_020a55e0(module,info[2],header[15],p,3);
   result=1;
  } else if(remain>=0xcc00) {
   u32 start=file->lo;
   u32 addr=info[1];
   func_02097ea4(file,addr-start,0);
   func_02097f10(file,p,0x4400);
   func_020a55e0(module,addr,0x4400,p,3);
   func_02097ea4(file,addr+0x4400-start,0);
   func_02097f10(file,p+0x4400,0x4400);
   func_020a55e0(module,addr+0x4400,0x4400,p+0x4400,2);
   func_02097ea4(file,addr+0x8800-start,0);
   func_02097f10(file,p+0x8800,0x4400);
   func_020a55e0(module,addr+0x8800,0x4400,p+0x8800,2);
   result=1;
  }
  func_02097ea4(file,offset,0);
  if(close) {
   func_02097ff0((int *)&local);
   if(result) {
    Entry *entry=data_021026e4;
    params[0]=header[8];
    params[1]=header[10]-header[8];
    params[2]=module[18]-header[8];
    params[3]=size;
    func_020a26f0(params,0x4000,0x8000,1);
    while(entry->size) {
     func_020a26f0(params,entry->addr,entry->addr+entry->size,0);
     entry++;
    }
    { u32 delta=(u32)AutoloadCallback-header[10];
    char *image=(char *)module[18];
    image+=delta;
    *(u32 *)image=0xe12fff1e; }
   }
  }
  if(result) func_02092904(header,size);
 }
 return result;
}

