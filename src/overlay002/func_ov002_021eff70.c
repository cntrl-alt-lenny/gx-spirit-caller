typedef unsigned short u16;
struct Obj {
    u16 f0;
    u16 owner:1;
    u16 pad2:15;
    u16 f4;
    u16 pad6:8;
    u16 flag:8;
    u16 id;
};
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
struct Table { char pad[0x30]; struct Slot slots[5]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c84a8(int a, int b);
int func_ov002_021eff70(struct Obj *obj, int side, int index)
{
    int off;
    int slot;
    if (index >= 5) return 0;
    if (side == obj->owner) return 0;
    off = (side & 1) * 0x868;
    slot = index * 0x14;
    if (((struct Table *)(data_ov002_022cf16c + off))->slots[index].id == 0) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + slot) == 0) return 0;
    if (obj->flag != 0) {
        return obj->id == func_ov002_021c84a8(side, index);
    }
    return 1;
}





