/* data_021024c8 (192 bytes, 4-aligned): MD5 round-2/3/4 message-schedule
 * index table (48 x u32; round 1 is the identity permutation and needs
 * no table). Verified against the textbook MD5 index formulas (i =
 * 0..15 within each round): round 2 g(i)=(5i+1)%16, round 3
 * h(i)=(3i+5)%16, round 4 k(i)=(7i)%16 -- every one of the 48 extracted
 * words matches its formula exactly (checked AFTER extraction; this
 * initializer is the literal extracted content, not re-derived).
 * func_02098cf8's four 4-iteration rotate-left loops additionally use
 * {7,12,17,22}/{5,9,14,20}/{4,11,16,23}/{6,10,15,21} -- the exact
 * RFC 1321 MD5 per-round shift schedule, confirming func_02098cf8 is
 * MD5_Transform (not just a candidate).
 * Consumer: func_02098cf8, src/main/func_02098cf8.s:77 (_LIT1, round
 * 2-4 loop base pointer for indexed reads `buf[g/h/k(i)]`; sibling
 * literal _LIT0 = data_02102588, the already-carved 256-byte table
 * immediately following this symbol -- out of this task's scope, not
 * independently byte-verified here) (relocs.txt:17153 from:0x020990dc
 * kind:load to:0x021024c8 module:main).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned int data_021024c8[48] = {
    /* round 2: g(i) = (5i + 1) % 16 */
    0x00000001, 0x00000006, 0x0000000b, 0x00000000,
    0x00000005, 0x0000000a, 0x0000000f, 0x00000004,
    0x00000009, 0x0000000e, 0x00000003, 0x00000008,
    0x0000000d, 0x00000002, 0x00000007, 0x0000000c,
    /* round 3: h(i) = (3i + 5) % 16 */
    0x00000005, 0x00000008, 0x0000000b, 0x0000000e,
    0x00000001, 0x00000004, 0x00000007, 0x0000000a,
    0x0000000d, 0x00000000, 0x00000003, 0x00000006,
    0x00000009, 0x0000000c, 0x0000000f, 0x00000002,
    /* round 4: k(i) = (7i) % 16 */
    0x00000000, 0x00000007, 0x0000000e, 0x00000005,
    0x0000000c, 0x00000003, 0x0000000a, 0x00000001,
    0x00000008, 0x0000000f, 0x00000006, 0x0000000d,
    0x00000004, 0x0000000b, 0x00000002, 0x00000009,
};
