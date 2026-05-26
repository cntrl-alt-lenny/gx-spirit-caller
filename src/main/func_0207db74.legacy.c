/* func_0207db74: copy-and-zero — load int from offset 0x18, store at
 * offset 0x24, then zero the int at offset 0x2c (= substruct base
 * 0x24 + 8).
 *
 *     ldr  r1, [r0, #0x18]
 *     add  r2, r0, #0x24                   ; r2 = substruct ptr
 *     str  r1, [r0, #0x24]                 ; first store via folded offset
 *     mov  r0, #0x0
 *     str  r0, [r2, #0x8]                  ; second store via cached substruct base
 *     bx   lr
 *
 * Brief 216 Recipe C: substruct-ptr cached as a `void *` local, used
 * across the two stores. mwcc 1.2/sp2p3 emits `add r2, r0, #0x24`
 * once and reuses r2 for the second store while keeping the first
 * store at the folded `[r0, #0x24]`. mwcc 2.0's CSE folds the second
 * store offset into a single `[r0, #0x2c]` and skips the add.
 *
 * Routing: `.legacy.c` -> mwcc 1.2/sp2p3.
 * Worked example for `docs/research/wall-2-leaf-no-pool-reg-alloc.md`
 * Recipe C — previously documented but not shipped.
 */

void func_0207db74(void *p) {
    void *sub = (void *)((char *)p + 0x24);
    *(unsigned int *)sub = *(unsigned int *)((char *)p + 0x18);
    *(unsigned int *)((char *)sub + 0x8) = 0;
}
