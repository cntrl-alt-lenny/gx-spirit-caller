/* func_02061530: returns `p->f_4 - p->f_8`. */
int func_02061530(void *p) {
    return *(int *)((char *)p + 0x4) - *(int *)((char *)p + 0x8);
}
