/* func_02084efc: for count<0x100 (or data_0210249c==-1 sentinel), do a
 * plain word-blit via func_02084e0c. Otherwise flag data_021a4824=1 and
 * dispatch to func_0209417c or func_02094378 depending on
 * data_021a4828, both fed the same (data_0210249c, ptr, count,
 * &func_02084fbc, &data_021a4824) argument set. */

extern int data_0210249c;
extern int data_021a4824;
extern int data_021a4828;

extern int func_02084e0c(int a, void *b, int c);
extern void func_02084fbc(void);
extern void func_02084fe0(void);
extern int func_02094378(int a, void *b, int c, void *fn, int *flag_ptr);
extern int func_0209417c(int a, void *b, int c, void *fn, int *flag_ptr);

int func_02084efc(void *ptr, unsigned int count)
{
    if (count < 0x100)
        goto simple;
    if (data_0210249c == -1)
        goto simple;
    goto complex;

simple:
    return func_02084e0c(*(int *)ptr, (char *)ptr + 4, count / 4 - 1);

complex:
    func_02084fe0();
    data_021a4824 = 1;

    if (data_021a4828 != 0)
        return func_0209417c(data_0210249c, ptr, count, (void *)func_02084fbc, &data_021a4824);

    return func_02094378(data_0210249c, ptr, count, (void *)func_02084fbc, &data_021a4824);
}
