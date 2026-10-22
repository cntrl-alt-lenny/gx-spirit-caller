struct Card {
 unsigned short id;
 unsigned short low:6, type:6, kind:2, high:2;
 char pad[16];
 int field14;
};
struct Ov002Self;
struct F021f8760_Self;
typedef struct S021ff3bc S021ff3bc;
extern int func_ov002_021f4a84(struct Card *, void *);
extern int func_ov002_021f4df4(struct Card *, int);
extern int func_ov002_021f634c(struct Ov002Self *, int);
extern int func_ov002_021f781c(struct Card *, int);
extern int func_ov002_021f8760(struct F021f8760_Self *);
extern int func_ov002_021f980c(S021ff3bc *, int);
extern int func_ov002_021facbc(struct Card *, int);
extern int func_ov002_021f9434(struct Card *);
struct Record { char pad[16]; void *handler; };
extern struct Record *func_ov002_02257464(void *self);
int func_ov002_02257db4(struct Card *self) {
 struct Record *p;
 switch (self->kind) { case 0: case 3: return 0; }
 p = func_ov002_02257464(self);
 if (p != 0) {
  if (p->handler == (void *)func_ov002_021f4a84) return 1;
  if (p->handler == (void *)func_ov002_021f4df4) return 1;
  if (p->handler == (void *)func_ov002_021f634c) return 1;
  if (p->handler == (void *)func_ov002_021f781c) return 1;
  if (p->handler == (void *)func_ov002_021f8760) return 1;
  if (p->handler == (void *)func_ov002_021f980c) return 1;
  if (p->handler == (void *)func_ov002_021facbc) return 1;
  if (p->handler == (void *)func_ov002_021f9434) return 1;
  switch (self->id) {
  case 0x1147: case 0x1181: case 0x16c1: case 0x16f8: case 0x16f9:
  case 0x17c5: case 0x18e0: case 0x18ec: case 0x19cb: case 0x1a28: case 0x1a58:
   return 1;
  case 0x10d6: case 0x16cd: case 0x1a61:
   return 1;
  case 0x13c7: case 0x188f:
   if (self->type == 0x16) return 1;
   break;
  case 0x1503:
   if (self->type != 5) return 1;
   break;
  case 0x15d0:
   if (self->type != 0xf) return 1;
   break;
  case 0x17d5: case 0x1817:
   if (self->type == 2) return 1;
   break;
  case 0x11cf: case 0x17d7: case 0x17d8:
   if (self->type == 5) return 1;
   break;
  case 0x19d3:
   if (self->type == 0xf) return 1;
   break;
  case 0x1a6d: case 0x1a6e: case 0x1a6f: case 0x1b4c: case 0x1b4d: case 0x1b4e:
   if (self->field14 == 0) return 1;
   break;
  }
 }
 return 0;
}


