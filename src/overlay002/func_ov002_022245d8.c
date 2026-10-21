typedef unsigned int u32;
typedef unsigned short u16;
struct Obj { u16 id; u16 side:1; u16 rest:15; };
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021ca0d4(int arg0, int arg1);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_022245d8(struct Obj *p) {

 if (func_ov002_021bc618(p->side) == 0) return 0;
 if (func_ov002_021ca0d4(p->side,p->id) == 0) return 0;
 struct Record record = {0};
 int mode = 2;
 switch (p->id) {
 case 0x12a0: record.card = 0x13fb; mode = 0; break;
 case 0x13ff: record.card = 0x14fa; mode = 0; break;
 case 0x1543: record.card = 0x154e; break;
 case 0x1595: record.card = 0x15bd; break;
 case 0x15bc: record.card = 0x15be; mode = 0; break;
 case 0x15d5: record.card = 0x1603; break;
 case 0x1600: record.card = 0x1639; break;
 case 0x19a5: record.card = 0x195a; break;
 case 0x1a37: record.card = 0x189b; break;
 }
 record.bit = p->side;
 if (func_ov002_021ca3f0(p->side,record.card) == 0) return 0;
 func_ov002_0227ac64(p->side,&record,1,mode,(p->id << 16) | 1);
 return 0;
}

