/* func_ov005_021abe04: walk the +0x60 entry list (stride 0x10, terminated by a
 * zero +4 field); for every entry that is not the excluded key and whose +8
 * coordinate lies in the half-open window (x-0x10, x+w), stamp that coordinate
 * with -1. (ov005_core.h) */
void func_ov005_021abe04(void *o, int x, int key, int w) {
    char *e = *(char **)((char *)o + 0x60);
    if (*(int *)(e + 4) == 0)
        return;
    {
        int hi = x + w;
        x -= 0x10;
        do {
            if (*(int *)(e + 4) != key) {
                short s = *(short *)(e + 8);
                if (s >= 0 && s > x && s < hi)
                    *(short *)(e + 8) = -1;
            }
            e += 0x10;
        } while (*(int *)(e + 4) != 0);
    }
}
