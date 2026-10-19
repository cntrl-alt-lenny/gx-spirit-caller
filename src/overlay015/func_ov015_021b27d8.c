typedef struct {
    void *data[2];
    int mode;
    int state;
    char pad[0xc];
    short x, y;
} Widget;

extern int func_ov015_021b28a8(Widget *self);
extern int func_0207f934(void *, unsigned short, void *, void *, int *, unsigned short, int);

int func_ov015_021b27d8(Widget *p, char **dst, int *remaining)
{
    int pos[2];
    int index;
    int count;
    pos[0] = p->x << 12;
    pos[1] = p->y << 12;
    index = func_ov015_021b28a8(p) == 1 ? 1 : 0;
    count = func_0207f934(*dst, (unsigned short)*remaining, p->data[index], 0, pos, 0, 0);
    *dst += count * 8;
    *remaining -= count;
    return count;
}
