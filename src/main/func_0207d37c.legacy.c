/* func_0207d37c: 1-bit field read-modify-write returning the old value.
 *
 *     add ip, r0, #0x24
 *     ldrh r3, [ip, #0x12]
 *     and r1, r1, #0x1
 *     bic r0, r3, #0x1
 *     strh r0, [ip, #0x12]
 *     ldrh r2, [ip, #0x12]
 *     and r0, r3, #0x1
 *     mov r0, r0, lsl #0x10
 *     orr r1, r2, r1
 *     strh r1, [ip, #0x12]
 *     mov r0, r0, lsr #0x10
 *     bx lr
 *
 * Leaf, no stack frame at all (C-71: needed .legacy.c tier anyway --
 * plain-tier compile folded the self+0x24/+0x12 split into one add
 * and word count came out short). NOT a C bitfield -- manual
 * mask/or on a plain unsigned short at self+0x36. The 2nd write
 * (`ip->raw = ip->raw | ...`) rereads ip->raw fresh (a real 2nd
 * `ldrh`) rather than reusing the cached `cur`, matching orig's
 * double-load/double-store; a real bitfield member here produced a
 * bit-31 shift dance instead of orig's bit-16 one and never got
 * the store count right no matter how the statements were split.
 */

struct s_0207d37c_sub {
    char _pad_00[0x12];
    unsigned short raw;
};

int func_0207d37c(char *self, int newval) {
    struct s_0207d37c_sub *ip = (struct s_0207d37c_sub *)(self + 0x24);
    unsigned short cur = ip->raw;
    unsigned short old = cur & 1;
    ip->raw = cur & ~1;
    ip->raw = ip->raw | (newval & 1);
    return old;
}
