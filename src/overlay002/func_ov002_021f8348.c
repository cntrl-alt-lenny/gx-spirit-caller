typedef unsigned short u16;
struct Hdr { u16 pad0; u16 side:1; u16 rest:15; };
struct Node { u16 id; u16 side:1; u16 slot:5; u16 category:6; u16 rest:4; u16 pad[4]; u16 count; };
struct State { char pad[0x5b4]; int step; };
struct Scratch { char pad[0xd70]; int a,b,c; };
extern struct State data_ov002_022ce288;
extern struct Scratch data_ov002_022d016c;
extern int func_ov002_021f4194(u16 *p);
extern void func_ov002_0229cf10(char *dst, const char *fmt, int val);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_022593a8(int a, int b, int c);
extern int func_ov002_021f82b8(struct Hdr *p, int side, int idx);
extern int func_ov002_022593f4(void);
extern void func_ov002_021d91e0(int a, int b, int c);
int func_ov002_021f8348(struct Node *self) {
 char buf[256];
 if (self->category == 0x23) return 1;
 switch (data_ov002_022ce288.step) {
 case 0:
 func_ov002_0229cf10(buf, (const char *)0x11c, func_ov002_021f4194(&self->id));
 func_ov002_021ae400(self->side, (int)buf);
 self->count = func_ov002_021f4194(&self->id);
 data_ov002_022ce288.step++;
 return 0;
 case 1:
 func_ov002_022593a8(self->side, self->id, (int)func_ov002_021f82b8);
 data_ov002_022ce288.step++;
 return 0;
 case 2:
 if (func_ov002_022593f4()) {
 func_ov002_021d91e0(data_ov002_022d016c.a, data_ov002_022d016c.b + data_ov002_022d016c.c, -1);
 self->count--;
 if (self->count == 0) return 1;
 }
 data_ov002_022ce288.step--;
 return 0;
 }
 return 0;
}
