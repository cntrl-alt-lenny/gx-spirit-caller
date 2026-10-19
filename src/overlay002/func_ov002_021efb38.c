typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
struct Slot { u32 id:13; u32 rest:19; };
struct Obj { u16 a, b; u16 pad:6; u16 kind:9; u16 rest:1; u16 c; u16 flag; };
struct Entry { u32 pad:9; u32 owner:1; u32 state:4; u32 rest:18; };
struct State { u8 pad[0x5d4]; u32 count; u8 gap[4]; u8 tags[1]; };
extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern struct State data_ov002_022ce288;
extern struct Entry data_ov002_022ce884[];
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
int func_ov002_021efb38(struct Obj *obj, int side, int state) {
    int off = (side & 1) * 0x868;
    u32 i;
    if (((struct Slot *)(data_ov002_022cf16c + off + 0x30 + state * 0x14))->id == 0) return 0;
    if (state >= 5) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + state * 0x14) == 0) return 0;
    if (func_ov002_021c8470(side, state) > 1000) return 0;
    if (obj->flag == 0) {
        for (i = 0; i < data_ov002_022ce288.count; i++) {
            switch (data_ov002_022ce288.tags[i]) { case 6: case 7: case 8:
                if (side == data_ov002_022ce884[i].owner && state == data_ov002_022ce884[i].state) return 1;
            }
        }
    } else {
        return func_ov002_021b3fd8(side, state, 0x1518, obj->kind);
    }
    return 0;
}

