struct S0207d1e8_Obj;
extern void func_0207d1e8(struct S0207d1e8_Obj *a0, int a1, int a2, int a3, unsigned short a4);
void *func_0207dc5c(void *heap, int size, unsigned short flags)
{
    int *fields = (int *)((char *)heap+0x24);
    func_0207d1e8(heap, 0x46524d48, (int)(fields+3), size, flags);
    *(int *)((char *)heap+0x24) = *(int *)((char *)heap+0x18);
    fields[1] = *(int *)((char *)heap+0x1c);
    fields[2] = 0;
    return heap;
}
