typedef enum { FALSE = 0, TRUE = 1 } BOOL;
BOOL func_ov010_021b28a8(void *p) {
    switch (*(int *)((char *)p + 8)) {
    case 0:
        return *(int *)((char *)p + 0xc) == 1 ? TRUE : FALSE;
    case 1:
        return *(int *)((char *)p + 0xc) == 0 ? FALSE : TRUE;
    default:
        return FALSE;
    }
}
