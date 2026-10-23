typedef struct { int a,b,c; } Header;
typedef struct { Header header; unsigned rank; char pad[0x38]; int active; int value; unsigned char x,y,z,pad2; } Record;
typedef struct {
 char pad0[0x48]; int state, mode; char pad1[0x14]; int flag64;
 char pad2[0xc]; int flag74, flag78; char pad3[0x1a4]; int flag220;
 int gap224, flag228, gap22c, value230; char pad4[0x3a9c]; int changed; Record rec;
} Data;
extern Data data_ov004_0220b500;
typedef struct { char pad[0x38]; int current; char pad2[0xbfc]; int saved; } State;
extern State data_021040ac;
extern int func_020349ec(int a, int b);
extern int func_02034888(int p0, void *p1, int p2);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern void func_02012454(int index, unsigned char *src);
extern int func_02046ac4(void);
extern void func_ov004_021c9d8c(int x);
extern int func_ov004_021c9d9c(void);
extern void func_ov004_021c9ef0(int selfv);
extern void func_ov004_021cded0(int index);
extern int func_ov004_021d62b8(int type);
extern void func_ov004_021d6384(int index, char *src);
/* Original caller supplies a record pointer although the C callee uses no arguments. */
extern int func_ov004_021d641c();
extern void func_ov004_021d6468(Record *out);
extern int func_ov004_021d66f4(short arg0);
int func_ov004_021d6734(void) {
 struct { unsigned short type; unsigned char payload[510]; } msg;
 Data *base = &data_ov004_0220b500;
 if (!func_020349ec(3, (int)&msg)) return 0;
 switch (msg.type) {
 case 2: base->flag220 = 1; break;
 case 3:
  base->value230 = *(unsigned short *)(msg.payload);
  base->flag228 = 0;
  func_ov004_021c9ef0(0xea);
  func_02037208(0x48,-1,0,1);
  break;
 case 4:
  if (*(unsigned short *)(msg.payload) == 0xffff) {
   base->flag64 = 1;
   func_ov004_021c9d8c(1);
   func_02037208(0x42,-1,0,1);
  } else {
   base->value230 = *(unsigned short *)(msg.payload);
   base->flag228 = 1;
   func_ov004_021c9ef0(0xeb);
   func_02037208(0x3a,-1,0,1);
  }
  break;
 case 0:
  func_ov004_021d6384(1,(char *)&msg);
  data_ov004_0220b500.flag74 = 1;
  if(base->mode) { func_ov004_021cded0(0); func_ov004_021cded0(1); }
  func_02037208(0x54,-1,0,1);
  func_ov004_021d62b8(1);
  if(func_ov004_021d641c(&base->rec)>=0) { base->changed=1; func_ov004_021d6468(&base->rec); }
  break;
 case 1:
  func_ov004_021d6384(0,(char *)&msg);
  data_ov004_0220b500.flag74 = 1;
  if(base->mode) { func_ov004_021cded0(0); func_ov004_021cded0(1); }
  func_02037208(0x54,-1,0,1);
  func_ov004_021d66f4(6);
  if(func_ov004_021d641c(&base->rec)>=0) { base->changed=1; func_ov004_021d6468(&base->rec); }
  break;
 case 6:
  func_02012454(!func_02046ac4(),msg.payload);
  func_ov004_021d66f4(7);
  break;
 case 7:
  func_02012454(!func_02046ac4(),msg.payload);
  msg.type=8;
  *(unsigned short *)(msg.payload)=data_021040ac.saved=(unsigned short)data_021040ac.current;
  func_02034888(3,&msg,4);
  break;
 case 8:
  data_021040ac.saved=*(unsigned short *)(msg.payload);
  msg.type=9;
  func_02034888(3,&msg,2);
 case 9:
  if(base->mode==1 || func_ov004_021c9d9c()) base->flag78=1;
  else { base->state=2; base->flag220=1; }
  break;
 }
 return 1;
}




