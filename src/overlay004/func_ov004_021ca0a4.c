typedef struct { int scale; int mode; int unused[2]; void *entry; } Record;
extern void func_0201e800(void *v, int x);
extern void *func_0201e964(int, void *, int *, int, int, int, int, void *, int, int, int, int);
void func_ov004_021ca0a4(Record *self, int a, int x, int y, void *p, int index)
{
    int pos[2];
    pos[0] = x << 12;
    pos[1] = y << 12;
    func_0201e800(self->entry, (unsigned short)index);
    func_0201e964(a, *(void **)((char *)self->entry + 0x2c), pos, 0, 0, 0, 0, p, self->mode, self->scale << 9, 0, 0);
}
