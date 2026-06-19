/* func_ov007_021b2998: sibling of func_ov007_021b2468 — same shape,
 * different data target + offsets.
 */

extern void Fill32(unsigned int value, void *dest, int size_bytes);
extern char data_ov007_0223342c[];

int func_ov007_021b2998(void *obj) {
    Fill32(0, data_ov007_0223342c, 0x44);
    *(int *)((char *)obj + 0x8) = 0;
    *(int *)((char *)obj + 0xc) = 0;
    return 1;
}
