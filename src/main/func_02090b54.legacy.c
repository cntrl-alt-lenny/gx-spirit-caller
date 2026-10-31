extern int data_021a63b4;
typedef struct { unsigned int word; unsigned short owner; unsigned short status; } Shared;
/* Thunks ignore r3; this caller supplies only r0-r2. */
extern int func_02090af0();
extern int func_02090a50();
/* Assembly helpers use r0 for delay and r0-r2 for fill. */
extern void WaitByLoop(int count);
extern void Fill32(unsigned int value, void *dest, unsigned int size);
void func_02090b54(void) {

    if (data_021a63b4 != 0) return;
    data_021a63b4 = 1;
    *(unsigned int *)0x027ffff0 = 0;
    func_02090af0(0x7e, 0x027ffff0, 0);
    Shared *shared = (Shared *)0x027ffff0;
    while (shared->status != 0) {
        WaitByLoop(0x400);
    }
    *(unsigned int *)0x027fffb0 = 0xffffffff;
    *(unsigned int *)0x027fffb4 = 0xffff0000;
    Fill32(0, (void *)0x027fffc0, 0x28);
    *(volatile unsigned short *)0x04000204 |= 0x800;
    *(volatile unsigned short *)0x04000204 |= 0x80;
    func_02090a50(0x7e, 0x027ffff0, 0);
    func_02090af0(0x7f, 0x027ffff0, 0);
}




