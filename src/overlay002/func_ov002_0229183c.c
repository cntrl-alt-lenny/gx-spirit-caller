typedef unsigned short u16;
typedef unsigned int u32;

struct Obj183c {
    u16 f0;
    u16 player : 1;
    u16 _pad : 15;
};

struct Slot183c {
    u32 id : 13;
    u32 _hi : 19;
    char pad[0xc];
    u32 flags;
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021ca2b8();
extern int func_ov002_022575c8(struct Obj183c *obj, int player, int idx);
extern int func_0203058c(int id);

int func_ov002_0229183c(struct Obj183c *obj)
{
    int i;

    if (func_ov002_021ca2b8(obj->player) == 0) {
        return 0;
    }
    for (i = 0; i <= 4; i++) {
        if (func_ov002_022575c8(obj, obj->player, i) != 0) {
            struct Slot183c *s = (struct Slot183c *)(data_ov002_022cf16c + (obj->player & 1) * 0x868 + i * 20 + 0x30);
            if (((s->flags >> 22) & 1) + ((s->flags >> 23) & 1) != 0) {
                if (func_0203058c(s->id) == 0) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
