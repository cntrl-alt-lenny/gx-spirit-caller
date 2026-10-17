typedef short s16;
typedef unsigned int u32;
extern void func_02094550(void);

void func_0208aa50(s16 *a, s16 *b, u32 n)
{
    u32 half = n >> 1;
    u32 i = 0;
    if (half != 0) {
        do {
            int off = i * 2;
            int x = *(s16 *)((char *)a + off);
            int y = *(s16 *)((char *)b + off);
            i++;
            *(s16 *)((char *)a + off) = (x + y + 1) >> 1;
        } while (i < half);
    }
    func_02094550();
}

