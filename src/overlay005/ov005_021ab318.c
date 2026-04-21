/* func_ov005_021ab318: array-of-struct field getter at +0x4.
 * Sibling of ov005_021ab260.c; see that file's header for the shape.
 */

int func_ov005_021ab318(void *obj, int idx) {
    char *base = *(char **)((char *)obj + 0x8);
    return *(int *)(base + idx * 0x1c + 0x4);
}
