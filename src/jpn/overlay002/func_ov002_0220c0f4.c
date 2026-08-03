/* func_ov002_0220c0f4 (ov002): guard chain (02206a98; 021ca2b8(b0);
 * 021ca3f0(b0,0x19ba); 021bc618(b0)>=3) then a type6==0x23 fast accept,
 * else two 021bb90c OR-checks. */
typedef unsigned short u16;

typedef struct {
    u16 id;
    u16 b0 : 1;
    u16 sub5 : 5;
    u16 type6 : 6;
    u16 pad : 4;
} Card0220c1e4;

extern int func_ov002_022069a8(Card0220c1e4 *s);
extern int func_ov002_021ca1d8(int a);
extern int func_ov002_021ca310(int a, int id);
extern int func_ov002_021bc538(int a);
extern int func_ov002_021bb82c(int a, int id);

int func_ov002_0220c0f4(Card0220c1e4 *s)
{
    if (!func_ov002_022069a8(s))
        return 0;
    if (!func_ov002_021ca1d8(s->b0))
        return 0;
    if (!func_ov002_021ca310(s->b0, 0x19ba))
        return 0;
    if (func_ov002_021bc538(s->b0) < 3)
        return 0;
    if (s->type6 == 0x23)
        goto ret_one_b;
    if (func_ov002_021bb82c(s->b0, 0x19a3))
        goto ret_one_a;
    if (func_ov002_021bb82c(s->b0, 0x19a4) == 0)
        goto ret_zero;

ret_one_a:
    return 1;
ret_zero:
    return 0;
ret_one_b:
    return 1;
}
