typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
struct Matrix { u32 flags; u8 pad[0x24]; int m[9]; int v[3]; };
struct Config { u8 pad[0x10]; void *data; int (*load)(struct Matrix *, void *, int); u8 pad18[0x1c]; struct Matrix *matrices; };
struct Obj { u8 *pc; struct Config *config; u32 flags; u8 padc[0x18]; void (*cb)(struct Obj *); u8 pad28[0x6a]; u8 stage; u8 pad93[0x1b]; u8 index; u8 padaf[5]; struct Matrix *active; u8 padb8[0x1c]; u8 *resource; u8 padd8[0x10]; void (*decode)(struct Matrix *, short *, u8 *, int); void (*emit)(struct Matrix *); u8 padf0[0x3c]; struct Matrix local; };
extern void func_02084e0c(int cmd, void *src, int n);
extern void func_020947b8(int *dst);
extern u8 data_020bef5c[][4];
void func_02083dd8(struct Obj *o, int mode)
{
    int index = o->pc[1];
    int n = 4;
    int stage, busy;
    struct Matrix *mat;
    short *p;
    u16 *header;
    int axis;
    int x, y;
    int arg0, arg1, arg2;
    o->index = index;
    o->flags |= 0x10;
    if (o->flags & 0x400) {
        if (mode == 0x40 || mode == 0x60) n++;
        if (mode == 0x20 || mode == 0x60) {
            n++;
            if (!(o->flags & 0x100)) {
                arg0 = o->pc[4];
                func_02084e0c(0x14, &arg0, 1);
            }
        }
        o->pc += n;
        return;
    }
    if (mode == 0x40 || mode == 0x60) {
        n++;
        if (mode == 0x40) arg1 = o->pc[4];
        else arg1 = o->pc[5];
        if (!(o->flags & 0x100)) func_02084e0c(0x14, &arg1, 1);
    }
    o->active = &o->local;
    stage = o->cb ? o->stage : 0;
    if (stage == 1) {
        o->flags &= ~0x40;
        o->cb(o);
        stage = o->cb ? o->stage : 0;
        busy = o->flags & 0x40;
    } else busy = 0;
    if (!busy) {
        if (o->config->matrices) {
            mat = &o->config->matrices[index];
            busy = !(o->flags & 0x80);
        } else {
            mat = &o->local;
            busy = 0;
        }
        if (!busy) {
            mat->flags = 0;
            if (!o->config->data || !o->config->load(mat, o->config->data, index)) {
                u8 *base = o->resource;
                u16 offset = *(u16 *)(base + 6);
                u16 *table = (u16 *)(base + offset);
                u8 *entry = (u8 *)table + *table * index;
                header = (u16 *)(base + *(u32 *)(entry + 4));
                p = (short *)(header + 2);
                if (*header & 1) mat->flags |= 4;
                else {
                    mat->v[0] = *(int *)p;
                    mat->v[1] = *(int *)(p + 2);
                    mat->v[2] = *(int *)(p + 4);
                    p += 6;
                }
                if (*header & 2) mat->flags |= 2;
                else if (*header & 8) {
                    axis = (*header & 0xf0) >> 4;
                    x = p[0];
                    y = p[1];
                    func_020947b8(mat->m);
                    mat->m[axis] = (*header & 0x100) ? -0x1000 : 0x1000;
                    p += 2;
                    mat->m[data_020bef5c[axis][0]] = x;
                    mat->m[data_020bef5c[axis][1]] = y;
                    if (*header & 0x200) y = -y;
                    mat->m[data_020bef5c[axis][2]] = y;
                    if (*header & 0x400) x = -x;
                    mat->m[data_020bef5c[axis][3]] = x;
                } else {
                    mat->m[0] = (short)header[1];
                    mat->m[1] = p[0];
                    mat->m[2] = p[1];
                    mat->m[3] = p[2];
                    mat->m[4] = p[3];
                    mat->m[5] = p[4];
                    mat->m[6] = p[5];
                    mat->m[7] = p[6];
                    mat->m[8] = p[7];
                    p += 8;
                }
                o->decode(mat, p, o->pc, *header);
            }
        }
        o->active = mat;
    }
    if (stage == 2) {
        o->flags &= ~0x40;
        o->cb(o);
        stage = o->cb ? o->stage : 0;
        busy = o->flags & 0x40;
    } else busy = 0;
    if (!busy && !(o->flags & 0x100)) o->emit(o->active);
    o->active = 0;
    if (stage == 3) {
        o->flags &= ~0x40;
        o->cb(o);
        busy = o->flags & 0x40;
    } else busy = 0;
    if (mode == 0x20 || mode == 0x60) {
        n++;
        if (!busy && !(o->flags & 0x100)) {
            arg2 = o->pc[4];
            func_02084e0c(0x13, &arg2, 1);
        }
    }
    o->pc += n;
}


