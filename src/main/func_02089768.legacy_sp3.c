struct Pool { void *heap; char list[0x10]; };

extern void *func_0207dab4(void *heap, int size, int align);
extern int func_020897ec(void *blk);
extern void func_0207d12c(char *list, void *blk);

int func_02089768(struct Pool *p)
{
    void *blk = func_0207dab4(p->heap, 0x14, 4);
    if (blk == 0) {
        return 0;
    }
    func_020897ec(blk);
    func_0207d12c(p->list, blk);
    return 1;
}
