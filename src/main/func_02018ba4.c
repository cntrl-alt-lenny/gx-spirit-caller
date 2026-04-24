/* func_02018ba4: zero-fill a 32-byte region in the state singleton
 * at offset 0x810 (the same region whose contents are read by
 * func_02018b94's pointer-returner).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     add   r1, r0, #0x810         ; dest = &state[0x810]
 *     mov   r0, #0x0               ; value = 0
 *     mov   r2, #0x20              ; byte count = 32
 *     bl    Fill32          ; memfill(value, dest, count_bytes)
 *     ldmia sp!, {r3, pc}
 *
 * 7 ARM instructions, 0x1c bytes.
 *
 * Fill32 is a 4-byte-stride memfill (`stmltia r1!, {r0}` in a
 * `while (r1 < r1 + count) { *r1++ = value; }` loop). Standard mwcc
 * `memset`-family helper; the argument order is (value, dest, count)
 * — note `value` is r0 (first), `dest` is r1 (second). That inverted
 * order vs libc memset is dsd-normalized here as a raw extern.
 */

extern char *GetSystemWork(void);
extern void Fill32(int value, void *dest, int count);

void func_02018ba4(void) {
    Fill32(0, GetSystemWork() + 0x810, 0x20);
}
