/* func_ov003_021ca174: push the four cell streams (o[0..3]) to the GX FIFO with
 * the shared arg, each tagged by its per-stream descriptor. (ov003_core.h) */
extern void OS_SPrintf(int, void *, int);
extern char data_ov003_021cf098[];
extern char data_ov003_021cf0a4[];
extern char data_ov003_021cf0b0[];
extern char data_ov003_021cf0bc[];
void func_ov003_021ca174(void *o, int arg) {
    OS_SPrintf(*(int *)o, data_ov003_021cf098, arg);
    OS_SPrintf(*(int *)((char *)o + 0x4), data_ov003_021cf0a4, arg);
    OS_SPrintf(*(int *)((char *)o + 0x8), data_ov003_021cf0b0, arg);
    OS_SPrintf(*(int *)((char *)o + 0xc), data_ov003_021cf0bc, arg);
}
