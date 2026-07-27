/* func_0209bf18: time {int hour(+0), int min(+4), int sec(+8)} -> total
 * seconds of day = (hour*60 + min)*60 + sec.
 *
 * Historically documented as codegen-walls.md's own P-2 "direction B"
 * example (mwcc fuses the hour/min loads into one ldmia; target keeps
 * them separate) and cited as a "permanent" wall since brief 028/031.
 * That diagnosis was made only against the DEFAULT mwcc 2.0/sp1p5 tier.
 *
 * Neither of the sm64ds-imported levers tried against this candidate
 * (#6 volatile-cast read-pinning, #9 u64 base-pointer laundering) was
 * actually needed: a completely plain transliteration matches
 * byte-exact once routed to the mwcc 1.2/sp2p3 ("legacy") tier -- that
 * compiler's instruction selector simply never performs the
 * ldr+ldr -> ldmia fusion that 2.0/sp1p5 does for this pattern.
 *
 * OBJDIFF 100% on --cc legacy (7/7 insns). WALLs on --cc 2.0 (mwcc
 * fuses t[0]/t[1] into `ldmib r0,{r2,r3}`, 6v7 words).
 */
int func_0209bf18(int *t) {
    return (t[0] * 60 + t[1]) * 60 + t[2];
}
