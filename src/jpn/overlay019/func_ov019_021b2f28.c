/* func_ov019_021b2f28: commit the pending edit at a0+0x4bc, if any. Flush the
 * staged glyph (func_0201eee8 with the work handle at +0x440 and the two
 * +0x400 sub-buffers), then clear the pending/dirty pair. Returns 1.
 */

extern void func_0201eee8(int handle, void *dst, void *src);

int func_ov019_021b2f28(char *a0) {
    if (*(int *)(a0 + 0x4bc) != 0) {
        func_0201eee8(*(int *)(a0 + 0x440), a0 + 0x448, a0 + 0x4bc);
        *(int *)(a0 + 0x4c0) = 0;
        *(int *)(a0 + 0x4bc) = 0;
    }
    return 1;
}
