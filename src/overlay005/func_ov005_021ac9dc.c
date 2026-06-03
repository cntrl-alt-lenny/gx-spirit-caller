/* func_ov005_021ac9dc: linear-search the +0x60 entry array (stride 0x10) for the
 * entry whose +4 field equals the key, re-reading the live count each step.
 * Returns the matching index, or -1 if none. (ov005_core.h) */
extern int func_ov005_021ab0fc(void *);
int func_ov005_021ac9dc(void *o, int key) {
    int *e = *(int **)((char *)o + 0x60);
    int i = 0;
    while (i < func_ov005_021ab0fc(*(void **)o)) {
        if (e[1] == key)
            return i;
        i++;
        e = (int *)((char *)e + 0x10);
    }
    return -1;
}
