typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 id;
    u16 flag : 1;
    u16 slot : 5;
    u16 rest2 : 10;
    u16 rest4 : 6;
    u16 value : 9;
    u16 top4 : 1;
} Obj;
struct Key { u32 id:13; u32 b:1; u32 pad:8; u32 a:8; u32 top:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
/* This caller forwards r1, although the matched callee ignores it. */
extern int func_ov002_02212c64(Obj *self, int arg);
int func_ov002_02235d78(Obj *self, int unused) {
    int player=self->flag;
    int slot=self->slot;
    struct Key *key=(struct Key *)(data_ov002_022cf16c+(player&1)*0x868+0x30+slot*0x14);
    if (self->value != key->a*2+key->b) return 0;
    if (*(u16 *)(data_ov002_022cf1a4+(player&1)*0x868+slot*0x14)==0) return 0;
    return func_ov002_02212c64(self, unused);
}


