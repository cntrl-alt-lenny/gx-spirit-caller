/* func_ov005_021aaecc: bind a command buffer to the object — record the buffer
 * base and its two derived cursors (+0xc header, +payload), then allocate the
 * task slot sized to (count+1)*2 and register the double-buffered command list.
 * (ov005_core.h) */
extern int  func_ov005_021ab01c(void *);
extern int  Task_PostLocked(int, int, int);
extern void func_02094398(int, int, int);
void func_ov005_021aaecc(void *o, char *buf) {
    *(char **)((char *)o + 0x4) = buf;
    *(char **)((char *)o + 0x8) = buf + 0xc;
    *(char **)((char *)o + 0xc) = buf + *(int *)(*(char **)((char *)o + 4) + 8);
    *(int *)((char *)o + 0x10) =
        Task_PostLocked((func_ov005_021ab01c(o) + 1) * 2, 4, 0);
    {
        int n = func_ov005_021ab01c(o) + 1;
        int slot = *(int *)((char *)o + 0x10);
        func_02094398(0, slot, n * 2);
    }
}
