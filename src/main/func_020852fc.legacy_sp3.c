/* func_020852fc: reset the geometry-engine control registers, then for
 * each of a0/a1 (if non-null), busy-wait a poll function until it
 * returns 0, then (for a0 only) copy the resulting 4x4 matrix down to
 * 4x3. Finishes by re-arming the geometry FIFO IRQ registers. */

extern void func_02084fe0(void);
extern int func_0208e664(void *mtxbuf);
extern void MTX_Copy44To43_(void *dst43, void *src44);
extern int func_0208e61c(void *a1);

void func_020852fc(void *a0, void *a1) {
    unsigned char mtxbuf[0x40];

    func_02084fe0();
    *(volatile unsigned int *)0x04000440 = 0;
    *(volatile unsigned int *)0x04000444 = 0;
    *(volatile unsigned int *)0x04000454 = 0;

    if (a0 != 0) {
        do {
        } while (func_0208e664(mtxbuf) != 0);
        MTX_Copy44To43_(mtxbuf, a0);
    }

    if (a1 != 0) {
        do {
        } while (func_0208e61c(a1) != 0);
    }

    *(volatile unsigned int *)0x04000448 = 1;
    *(volatile unsigned int *)0x04000440 = 2;
}
