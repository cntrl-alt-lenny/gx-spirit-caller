struct Ent { char pad0[0xc]; char list[0x18]; };
struct Blk { char pad0[8]; void *f8; int fc; int f10; };

extern struct Ent data_021a4cb4[];
extern void func_02087640(void);
extern struct Blk *func_020897fc(void *pool, int size, int p3, int p4, int p5);
extern void *func_02089938(void *ptr, int size);
extern void func_0207d12c(char *list, struct Blk *b);

int func_02087f34(int idx, void *pool, int size)
{
    struct Blk *b;
    void *r;
    b = func_020897fc(pool, size + 0x14, (int)func_02087640, 0, 0);
    if (b == 0) {
        return 0;
    }
    b->fc = 0;
    b->f10 = idx;
    b->f8 = 0;
    r = func_02089938((char *)b + 0x14, size);
    if (r == 0) {
        return 0;
    }
    b->f8 = r;
    func_0207d12c(data_021a4cb4[idx].list, b);
    return 1;
}
