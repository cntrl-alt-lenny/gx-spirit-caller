typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned char u8;
typedef struct Obj {
    u16 id;
    u16 player : 1;
    u16 index : 5;
    u16 pad : 6;
    u16 zone : 2;
    u16 flip : 1;
    u16 top : 1;
    u16 pad4;
    u16 kind : 8;
    u16 rest : 8;
} Obj;
extern int func_ov002_021b8f10(Obj *o);
extern unsigned int func_0202b878(int id);
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c1ef0(Obj *o, int player, int idx);
extern int func_ov002_022018cc(void *arg0, int player, int idx);
extern char data_ov002_022cf1a4[];
#define SLOT(o) (*(u16 *)(data_ov002_022cf1a4 + ((o)->player & 1) * 0x868 + (o)->index * 20))
int func_ov002_02207b74(Obj *self, Obj *other) {
    int player, idx;
    u16 saved;
    if (!other) return 0;
    if (func_ov002_021b8f10(other) &&
        1 - self->player == (other->player ^ other->flip) &&
        func_0202b878(other->id) == 0x16 && other->zone == 0) {
        saved = SLOT(self);
        SLOT(self) = 1;
        for (player = 0; player < 2; player++) {
            for (idx = 0; idx <= 10; idx++) {
                if (idx < 5 && !func_ov002_021b8fcc(player, idx)) continue;
                if (func_ov002_021c1ef0(self, player, idx) && func_ov002_022018cc(other, player, idx)) {
                    SLOT(self) = saved;
                    return 1;
                }
            }
        }
        SLOT(self) = saved;
    }
    return 0;
}

