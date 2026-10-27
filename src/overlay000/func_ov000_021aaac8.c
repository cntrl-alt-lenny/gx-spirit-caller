extern char data_ov000_021c73e0[];
extern short data_020bef80[];
extern void func_ov000_021aa840(int x, int y, int z);
struct Obj {
    char pad0[0x24];
    int live[6];
    char pad1[0x3c];
    int base[6];
    char pad2[0x3c];
    int delta[6];
    char pad3[0x3c];
    int val, valbase, valdelta;
    short x, y, z;
    short bx, by, bz;
    short dx, dy, dz;
    unsigned short timer;
    int facing : 4;
    void (*callback)(unsigned short *);
};
#define WAVE(t) (data_020bef80[((((t) + 0x100) << 7) >> 4) * 2 + 1] + 0x1000)
void func_ov000_021aaac8(void) {
    int t;
    struct Obj *obj = *(struct Obj **)data_ov000_021c73e0;
    short x, y, z;
    if (obj->timer == 0) return;
    switch (obj->facing) {
    case 3: case 4:
        if (obj->callback) obj->callback(&obj->timer);
        return;
    }
    t = 0x100 - obj->timer;
    switch (obj->facing) {
    case 1: case 2: case 3:
        x = (unsigned short)-obj->x;
        y = (unsigned short)-obj->y;
        z = obj->z;
        break;
    default:
        x = obj->x;
        y = obj->y;
        z = obj->z;
    }
    if (obj->dx) x = obj->bx + ((obj->dx * WAVE(t)) >> 13);
    if (obj->dy) y = obj->by + ((obj->dy * WAVE(t)) >> 13);
    if (obj->dz) z = obj->bz + ((obj->dz * WAVE(t)) >> 13);
    func_ov000_021aa840((short)x, (short)y, (short)z);
    if (obj->valdelta) obj->val = (short)(obj->valbase + ((obj->valdelta * WAVE(t)) >> 13));
    if (obj->delta[0]) obj->live[0] = obj->base[0] + ((obj->delta[0] * WAVE(t)) >> 13);
    if (obj->delta[1]) obj->live[1] = obj->base[1] + ((obj->delta[1] * WAVE(t)) >> 13);
    if (obj->delta[2]) obj->live[2] = obj->base[2] + ((obj->delta[2] * WAVE(t)) >> 13);
    if (obj->delta[3]) obj->live[3] = obj->base[3] + ((obj->delta[3] * WAVE(t)) >> 13);
    if (obj->delta[4]) obj->live[4] = obj->base[4] + ((obj->delta[4] * WAVE(t)) >> 13);
    if (obj->delta[5]) obj->live[5] = obj->base[5] + ((obj->delta[5] * WAVE(t)) >> 13);
    obj->timer -= 2;
}

