extern void func_02045364(void *a0);
extern void func_02054610(void *a0);
extern void func_02058654(void *a0, int a1);

void func_02056680(void **a0) {
    char *p = *(char **)a0;

    func_02058654(a0, 1);
    func_02045364(*(void **)(p + 0x460));
    *(void **)(p + 0x460) = 0;
    func_02054610(*(void **)(p + 0x428));
    func_02045364(p);
    *a0 = 0;
}
