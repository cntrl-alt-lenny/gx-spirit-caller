typedef unsigned int u32;
struct State { char pad[0x2a0]; u32 f2a0; };
struct ModeState {
 char pad0[0x218];
 int scale, x, y;
 char pad1[0xc];
 int x2, y2;
 char pad2[0x30];
 u32 low:5;
 u32 mode:4;
 u32 next:4;
 u32 high:19;
 u32 f26c, flags;
};
struct Point { short x, y; };
extern struct State data_ov011_021d4000;
extern struct ModeState data_ov011_021d403c;
extern struct Point data_ov011_021d300c[];
extern struct Point data_ov011_021d3034[];
void func_ov011_021ceebc(void) {
 struct ModeState *s = &data_ov011_021d403c;
 struct Point *p;
 int x,y;
 if (data_ov011_021d4000.f2a0 == 1)
  p = &data_ov011_021d300c[s->mode - 1];
 else
  p = &data_ov011_021d3034[s->next - 1];
 x = p->x << 12;
 s->x = x;
 y = p->y << 12;
 s->y = y;
 s->scale = 0x1000;
 s->flags &= ~0x20000;
 s->x2 = x;
 s->y2 = y;
}

