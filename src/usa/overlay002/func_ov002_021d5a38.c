/* func_ov002_021d5a38: pack (lo,hi) bytes into a u16 and replay it across a
 * 2 x 11 grid via func_021d5ab4(i, j, packed, 1). */

extern void func_ov002_021d59c4(int a, int b, unsigned short packed, int flag);

void func_ov002_021d5a38(int lo, int hi)
{
    int i, j;
    unsigned short packed = (unsigned short)(((unsigned char)lo) |
                                              (((unsigned char)hi) << 8));
    for (i = 0; i < 2; i++)
        for (j = 0; j <= 10; j++)
            func_ov002_021d59c4(i, j, packed, 1);
}
