typedef struct { char _pad[0xd0b]; unsigned char b_d0b; } state_d0b_t;
typedef struct { char _pad[0xd0b]; unsigned char field:2; } S_0203d6c4;
typedef unsigned char u8;
typedef unsigned short u16;
typedef struct { u8 pad[0x3c]; u16 field3c; u8 tail[0x82]; } Record;
typedef struct { u8 mode; u8 value; u8 data[0x50]; } Options;
typedef struct { u8 state; u8 pad[3]; } State;
typedef struct {
 char pad[0x444]; State states[11]; Record records[11];
 unsigned long long time; Options options;
 char pad_d0a; u8 flags; char pad_d0c[7]; u8 self; u8 kind; u8 count;
} Game;
extern int func_0203d6a8(state_d0b_t *p);
extern int func_0203d6c4(S_0203d6c4 *p);
extern int func_0207b5f8(void);
extern int func_0207b9c0(Record *record, Options *options, unsigned int flags);
extern unsigned long long func_020930b0(void);
int func_0203d888(Game *g) {
 int state = func_0207b5f8();
 Record *r = &g->records[g->self];
 int flags;
 if (state == 3) {
  flags = func_0203d6c4((S_0203d6c4 *)g);
  g->count++;
  if (g->count > 3) {
   g->count = 0; g->states[g->self].state = 1; return 9;
  }
  if (g->count != 1) {
   if (g->kind == 1) g->flags &= ~0xc;
   else if (g->kind == 2) {
    g->count = 0; g->states[g->self].state = 3; return 9;
   } else if (g->kind == 3) {
    g->count = 0; g->states[g->self].state = 4; return 9;
   } else if (g->count == 3) g->flags &= ~0xc;
  }
  func_0207b9c0(r, &g->options, flags | func_0203d6a8((state_d0b_t *)g));
 } else if (state == 9) {
  g->count = 0; g->time = func_020930b0(); return 10;
 }
 return 8;
}
