/* func_0206cf10: resolve p0's root (+0x64) -> obj (+0xc4) / base (+0xf8),
 * compute delta = obj->+0x44 - base. Negative delta reports -1 and bails;
 * otherwise report obj's +0xa/+0x18/+0x1c fields plus delta, and when
 * delta is nonzero OR obj->+0x8==4, return obj->+0x40 + base. */

int func_0206cf10(void *p0, int *out_delta, unsigned short *out_a,
                   unsigned short *out_18, int *out_1c)
{
    void *root = *(void **)((char *)p0 + 0x64);
    void *obj = *(void **)((char *)root + 0xc4);
    int base = *(int *)((char *)root + 0xf8);
    int delta = *(int *)((char *)obj + 0x44) - base;

    if (delta < 0)
        goto negative;

    *out_a = *(unsigned short *)((char *)obj + 0xa);
    *out_18 = *(unsigned short *)((char *)obj + 0x18);
    *out_1c = *(int *)((char *)obj + 0x1c);
    *out_delta = delta;

    if (delta != 0)
        goto shared;
    if (*(unsigned char *)((char *)obj + 0x8) == 4)
        goto shared;

    return 0;

negative:
    *out_delta = -1;
    return 0;

shared:
    return *(int *)((char *)obj + 0x40) + base;
}
