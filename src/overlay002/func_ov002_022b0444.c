/* func_ov002_022b0444 - bit-table SET (OR in bit n). Only the low guard
 * (cmp#7 -> early return), then tbl[word] |= 1 << (n%32). orr-shift store:
 * (1u << bit) | tbl. Holds the base (lr) and word index (ip) across the
 * load+store -> single local for each. data_021064a8 is a u32 bit-array. */

extern unsigned int data_021064a8[];

void func_ov002_022b0444(int n)
{
    unsigned int *base;
    int word;
    if (n <= 7) return;
    base = data_021064a8;
    word = n / 0x20;
    base[word] = base[word] | (1u << (n % 0x20));
}
