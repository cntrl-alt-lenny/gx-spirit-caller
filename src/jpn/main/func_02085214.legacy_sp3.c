/* func_02085214: reset the geometry-engine control registers, then for
 * each of a0/a1 (if non-null), busy-wait a poll function until it
 * returns 0, then (for a0 only) copy the resulting 4x4 matrix down to
 * 4x3. Finishes by re-arming the geometry FIFO IRQ registers. */

extern void func_02084ef8(void);
extern int func_0208e57c(void *mtxbuf);
extern void MTX_Copy44To43_(void *dst43, void *src44);
extern int func_0208e534(void *a1);

void func_02085214(void *a0, void *a1) {
    unsigned char mtxbuf[0x40];

    func_02084ef8();
    *(volatile unsigned int *)0x04000440 = 0;
    *(volatile unsigned int *)0x04000444 = 0;
    *(volatile unsigned int *)0x04000454 = 0;

    if (a0 != 0) {
        do {
        } while (func_0208e57c(mtxbuf) != 0);
        MTX_Copy44To43_(mtxbuf, a0);
    }

    if (a1 != 0) {
        do {
        } while (func_0208e534(a1) != 0);
    }

    *(volatile unsigned int *)0x04000448 = 1;
    *(volatile unsigned int *)0x04000440 = 2;
}
