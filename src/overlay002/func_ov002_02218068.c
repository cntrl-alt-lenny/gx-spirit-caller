typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Card {
 u16 id;
 u16 side:1; u16 pad2:13; u16 flipped:1; u16 pad3:1;
 u16 pad4:2; u16 blocked:1; u16 pad5:13;
} Card;
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern int data_ov002_022cdc78[];
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_021af9d0(int player,int phase,int card,int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021c9df0(int arg);
/* The original supplies only r0 to this four-argument forwarding thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0223f6c4(Card *card);
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
extern void func_ov002_0226b054(int arg0);
struct Record;
extern void func_ov002_0227ac64(int a,struct Record *b,int c,int d,u32 e);
extern int func_ov002_0227adb8(int a,int b,int c,int d);
int func_ov002_02218068(Card *card) {
 int side = card->side ^ card->flipped;
 if (card->blocked) return 0;
 switch(data_ov002_022ce288.state) {
 case 0x80:
  if (func_ov002_021bc618(side)==0) return 0;
  if (func_ov002_021ca2b8(side)==0) return 0;
  if (card->id==0x1612) {
   if (func_ov002_021c9df0(side)==0) return 0;
  }
  if (func_ov002_0225368c(side,card->id,func_ov002_0223f6c4(card))!=0) return 0x7f;
  func_ov002_021ae400(side,0xd);
  return 0x7b;
 case 0x7f:
  switch(card->id) {
  case 0x1232: case 0x14ba: case 0x14dd: case 0x15b6: case 0x194f: case 0x1b25:
   data_ov002_022cdc78[2]=0; return 0x7c;
  }
  func_ov002_021ae400(side,0x30); return 0x7e;
 case 0x7e:
  func_ov002_021af9d0(side,6,card->id,func_ov002_0223f6c4(card));
  return 0x7c;
 case 0x7c:
  { int id=card->id;
   switch(id) {
   case 0x1232:
    func_ov002_0227adb8(side,(int)func_ov002_021afb74(),1,(id<<16)|1); break;
   case 0x14ba: case 0x14dd: case 0x152f: case 0x1585: case 0x15b6:
   case 0x17e5: case 0x17e6: case 0x1900: case 0x194f: case 0x1a13: case 0x1a8f: case 0x1b25:
    func_ov002_0227adb8(side,(int)func_ov002_021afb74(),1,id<<16); break;
   case 0x1612:
    func_ov002_0227ac64(side,(struct Record *)func_ov002_021afb74(),0,1,0); break;
   default:
    func_ov002_0227ac64(side,(struct Record *)func_ov002_021afb74(),1,0,0); break;
   }
  }
  return 0x78;
 case 0x7b:
  func_ov002_0226b054(1-side); return 0x78;
 case 0x78:
  func_ov002_021e286c(side); return 0x64;
 default: return 0;
 }
}

