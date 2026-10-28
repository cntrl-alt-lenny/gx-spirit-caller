typedef unsigned short u16;
struct Obj {
 u16 id;
 u16 side:1; u16 index:5; u16 rest:10;
 u16 flags:6; u16 value:9; u16 pad:1;
 u16 pad6[3];
 u16 fieldc;
 u16 pade[3];
 unsigned low:9; unsigned side9:1; unsigned middle:1; unsigned side11:1; unsigned high:20;
};
struct Slot { unsigned id:13; unsigned bit:1; unsigned pad:8; unsigned val:8; unsigned tail:2; };
extern char data_ov002_022cf16c[];
extern int data_ov002_022cf178[];
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021bbeac(int player);
extern int func_ov002_021c2f24(int player, int id);
int func_ov002_02210264(struct Obj *self) {
 int result=0;
 switch(self->id) {
 case 0x1082: case 0x11c2: case 0x139f: case 0x1403: case 0x145a:
 case 0x1533: case 0x1563: case 0x15dc: case 0x161a: case 0x16bb:
 case 0x16c1: case 0x16cd: case 0x16f7: case 0x16fb: case 0x1740:
 case 0x17d5: case 0x1911: case 0x191a: case 0x1a07: case 0x1a0b:
 case 0x1a1f: case 0x1a22: case 0x1a90: case 0x1ae9: case 0x1b1a:
 result=1; break;
 case 0x1175: case 0x12ec: case 0x1353: case 0x1662: case 0x16d2:
 case 0x1a5b: case 0x1b04: case 0x1b26:
 result=2; break;
 case 0x1748: case 0x1790: result=3; break;
 case 0x1567: result=2-*(int *)((char *)data_ov002_022cf178+(self->side & 1)*0x868); break;
 case 0x1501: result=5-*(int *)((char *)data_ov002_022cf178+(self->side & 1)*0x868); break;
 case 0x1776: result=self->fieldc==1?1:2; break;
 case 0x17d6: result=func_ov002_021b3ecc(self->side,11,self->id)+1; break;
 case 0x1888: result=func_ov002_021c2f24(self->side,self->id)+1; break;
 case 0x18f9:
 if (*(int *)((char *)data_ov002_022cf178+(self->side & 1)*0x868)==0) {
 struct Slot *slot=(struct Slot *)(data_ov002_022cf16c+(self->side & 1)*0x868+0x30+self->index*20);
 int count=func_ov002_021bbeac(self->side);
 if(count==(self->value==slot->val*2+slot->bit)) result=2;
 }
 break;
 case 0x1966:
 if(self->side!=self->side11) {
 if(self->side==self->side9) result=1;
 }
 result++; break;
 case 0x19c7: case 0x1a63: result=1; break;
 }
 return result;
}

