typedef unsigned int u32;
struct Node {
 unsigned short id;
 unsigned short side:1; unsigned short index:5; unsigned short :10;
 unsigned short :2; unsigned short blocked:1; unsigned short :3; unsigned short key:9; unsigned short :1;
 unsigned short pad[3]; unsigned short enabled;
};
struct Key { u32 id:13; u32 flag:1; u32 :8; u32 kind:8; u32 :2; };
struct Slot { char pad0[12]; u32 count; char pad[32]; struct { struct Key key; char pad[16]; } entries[12]; struct Key keys[466]; };
struct Count { u32 count; char pad[0x864]; };
struct State { char pad[0x5a8]; int state; };
struct Choice { char pad[0xd0]; u32 flags; char pad2[0xc7c]; int active; char pad3[16]; int mode; };
struct Flags { char pad[0x16]; unsigned short :3; unsigned short locked:1; unsigned short mode:2; unsigned short :10; };
extern struct Slot data_ov002_022cf16c[];
extern struct Count data_ov002_022cf178[];
extern struct Choice data_ov002_022d016c;
extern struct State data_ov002_022ce288;
extern struct Flags data_ov002_022cd300;
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern void func_ov002_022592b8(int arg);
extern void func_ov002_0226b094(int arg0, int arg1);
extern int func_ov002_0226eb48(int a, int b);
extern int func_ov002_02271a78(int arg0, int arg1, int arg2);
extern void func_ov002_02290c9c(int side);
int func_ov002_0221671c(struct Node *self) {
 unsigned side;
 unsigned key;
 if (self->blocked) return 0;
 side = self->side;
 key = self->key;
 if (key != data_ov002_022cf16c[side & 1].entries[self->index].key.kind * 2 + data_ov002_022cf16c[side & 1].entries[self->index].key.flag) return 0;
 if (data_ov002_022d016c.flags & 1) return 0;
 if (self->enabled == 0) return 0;
 switch(data_ov002_022ce288.state) {
 case 0x80: {
 unsigned i, count=0;
 unsigned limit = data_ov002_022cf178[side & 1].count;
 for (i=0; i < limit; i++) {
 if (func_ov002_0226eb48(self->side, data_ov002_022cf16c[self->side & 1].keys[i].kind * 2 + data_ov002_022cf16c[self->side & 1].keys[i].flag)) count++;
 limit = data_ov002_022cf16c[self->side & 1].count;
 }
 if(count == 0) return 0x78;
 func_ov002_021ae400(self->side,0x27);
 return 0x7f;
 }
 case 0x7f:
 data_ov002_022cd300.mode=0;
 side=self->side;
 if(data_ov002_022cd744[side] == 1) func_ov002_02290c9c(side);
 else func_ov002_022592b8(6);
 return 0x7e;
 case 0x7e:
 if(data_ov002_022d016c.active == 0) return 0x80;
 if(data_ov002_022d016c.mode != 4 && data_ov002_022d016c.mode != 6) return 0x7f;
 func_ov002_02271a78(data_ov002_022d016c.mode == 4 ? 1 : 0,0,0);
 return 0x7d;
 case 0x7d:
 if(data_ov002_022cd300.locked) return 0x7f;
 func_ov002_021e276c(side,self->id,1,0);
 return 0;
 case 0x78:
 func_ov002_021e27c0(side,1);
 func_ov002_0226b094(1-self->side,self->id);
 return 0x77;
 case 0x77:
 func_ov002_021e27c0(side,0);
 return 0;
 }
 return 0;
}







