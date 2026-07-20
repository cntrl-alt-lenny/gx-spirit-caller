/* func_02093814: calibrated busy-wait -- decrements count by 4 until
 * it underflows. A pure C loop with no side effects (`do { count -=
 * 4; } while (...);`, count never read again) has zero observable
 * behavior under the C abstract machine, so mwcc -O4 eliminates the
 * whole loop (confirmed: compiles down to a bare `bx lr`). Ships as
 * asm -- there's no portable-C way to force a compiler to keep a
 * timing-only loop it can prove has no effect.
 */

asm void func_02093814(void) {
    nofralloc
loop_top:
    subs    r0, r0, #0x4
    bhs     loop_top
    bx      lr
}
