typedef struct { int scale; int mode; int unused[2]; void *entries[1]; } Record;
extern void *func_0201eaa0(int, void *, int *, int, int, int, void *, void *, int, int, int, int);
void *func_ov004_021ca128(Record *self, int a, int x, int y, char *p, int index)
{
    int pos[2];
    pos[0] = x << 12;
    pos[1] = y << 12;
    return func_0201eaa0(a, self->entries[index], pos, 0, 0, 0, p + 8, p, self->mode, self->scale << 9, 0, 0);
}
