typedef enum { FALSE = 0, TRUE = 1 } BOOL;
extern BOOL func_ov010_021b28a8(void *p);
extern int func_0207f934(void *, unsigned short, void *, void *, int *, unsigned short, int);
struct Obj {
    void *data[2];
    char pad[0x14];
    short x, y;
};
int func_ov010_021b27d8(struct Obj *p, char **dst, int *remaining) {
    int pos[2];
    int index;
    int count;
    pos[0] = p->x << 12;
    pos[1] = p->y << 12;
    index = func_ov010_021b28a8(p) == TRUE ? 1 : 0;
    count = func_0207f934(*dst, (unsigned short)*remaining, p->data[index], 0, pos, 0, 0);
    *dst += count * 8;
    *remaining -= count;
    return count;
}

