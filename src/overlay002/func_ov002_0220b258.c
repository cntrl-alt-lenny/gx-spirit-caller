struct Obj { unsigned short _0; unsigned short side:1; unsigned short _p:5; unsigned short type:6; unsigned short _q:4; char _4[16]; int f14; };
struct G { int f0; int f4; int f8; char _c[20]; int f20; };
extern struct G data_ov002_022cd3f4;
extern unsigned short data_ov002_022cf1a2[];
extern unsigned short data_ov002_022cf1a4[];

int func_ov002_0220b258(struct Obj *obj) {
    unsigned int side;
    unsigned int idx;
    if (obj->type != 0x12) {
        return 0;
    }
    if (obj->f14 == 0) {
        return 0;
    }
    side = obj->side;
    if (data_ov002_022cd3f4.f0 != 1 - side) {
        return 0;
    }
    if (data_ov002_022cd3f4.f4 != side) {
        return 0;
    }
    if (data_ov002_022cd3f4.f8 != 0) {
        return 0;
    }
    idx = (data_ov002_022cd3f4.f4 & 1) * 0x868;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + idx + data_ov002_022cd3f4.f20 * 20) == 0) {
        return 0;
    }
    return *(unsigned short *)((char *)data_ov002_022cf1a2 + idx + data_ov002_022cd3f4.f20 * 20) != 0;
}
