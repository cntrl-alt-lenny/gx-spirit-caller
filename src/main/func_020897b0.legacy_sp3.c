struct Pool { void *heap; char list[0x10]; };

extern void func_0207d1b8(void *list, int size);
extern int func_02089768(struct Pool *p);

int func_020897b0(struct Pool *p, void *heap)
{
    func_0207d1b8(p->list, 0xc);
    p->heap = heap;
    if (func_02089768(p) != 0) {
        return 1;
    }
    return 0;
}
