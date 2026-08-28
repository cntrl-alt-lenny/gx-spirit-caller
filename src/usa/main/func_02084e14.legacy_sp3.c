/* func_02084e14: for count<0x100 (or data_021023bc==-1 sentinel), do a
 * plain word-blit via func_02084d24. Otherwise flag data_021a4744=1 and
 * dispatch to func_02094088 or func_02094284 depending on
 * data_021a4748, both fed the same (data_021023bc, ptr, count,
 * &func_02084ed4, &data_021a4744) argument set. */

extern int data_021023bc;
extern int data_021a4744;
extern int data_021a4748;

extern int func_02084d24(int a, void *b, int c);
extern void func_02084ed4(void);
extern void func_02084ef8(void);
extern int func_02094284(int a, void *b, int c, void *fn, int *flag_ptr);
extern int func_02094088(int a, void *b, int c, void *fn, int *flag_ptr);

int func_02084e14(void *ptr, unsigned int count)
{
    if (count < 0x100)
        goto simple;
    if (data_021023bc == -1)
        goto simple;
    goto complex;

simple:
    return func_02084d24(*(int *)ptr, (char *)ptr + 4, count / 4 - 1);

complex:
    func_02084ef8();
    data_021a4744 = 1;

    if (data_021a4748 != 0)
        return func_02094088(data_021023bc, ptr, count, (void *)func_02084ed4, &data_021a4744);

    return func_02094284(data_021023bc, ptr, count, (void *)func_02084ed4, &data_021a4744);
}
