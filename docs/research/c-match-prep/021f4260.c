/* CAMPAIGN-PREP candidate for func_021f4260 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: nested switch (cardId outer, player inner) recovered by full ARM sim; cases that return the default value must FALL THROUGH, not be listed
 *   risk:       NONE residual — byte-exact (0x770 bytes). The single fix: card 0x1656 player==2 must omit its `case` and fall through to the shared 0x1ac default, else mwcc emits an extra mov;bx. reshape-able (done).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f4260 (ov002, class D) — MED tier.
 * 1904B pure cmp-tree classifier: (cardId, player) -> result-id, default 0x1ac.
 * NO memory reads, NO calls. Outer binary-search on cardId (36 ids), inner switch
 * on player (mostly 0/1, some 0/1/2, two ids use addls-pc jump tables 0..4 / 0..3).
 * ALL cases + return constants RECOVERED by full ARM simulation of the on-disk .s
 * (sim.py/emit.py); computed returns (sub/rsb off held base: 0x1b1 0x1b6 0x1ca
 * 0x1cf) resolved to plain int constants. Case order source-ascending.
 * VALIDATED byte-exact (mwcc 2.0/sp1p5 -O4,p -interworking vs delinked .o) once
 * card 0x1656 player==2 was made to FALL THROUGH to the 0x1ac default (an explicit
 * `case 2: return 0x1ac` emitted an extra mov;bx instead of sharing the default). */

int func_ov002_021f4260(int cardId, int player) {
    switch (cardId) {
    case 0x10f8:
        switch (player) { case 0: return 0x196; case 1: return 0x197; }
        break;
    case 0x1298:
        switch (player) { case 0: return 0x1c6; case 1: return 0x1c7; }
        break;
    case 0x12c6: case 0x153d: case 0x175a:
        switch (player) { case 0: return 0x198; case 1: return 0x199; }
        break;
    case 0x1388:
        switch (player) { case 0: return 0x1ad; case 1: return 0x1ae; }
        break;
    case 0x14e0:
        switch (player) { case 0: return 0x1a4; case 1: return 0x1ad; }
        break;
    case 0x14fd:
        switch (player) { case 0: return 0x1b6; case 1: return 0x1b7; }
        break;
    case 0x1519: case 0x1522: case 0x153f: case 0x15a5: case 0x1746:
        switch (player) { case 0: return 0x1b8; case 1: return 0x1b9; case 2: return 0x1ba; }
        break;
    case 0x1532:
        switch (player) { case 0: return 0x1a6; case 1: return 0x1a7; }
        break;
    case 0x1544:
        switch (player) { case 0: return 0x1aa; case 1: return 0x1ab; }
        break;
    case 0x1581:
        switch (player) { case 0: return 0x1be; case 1: return 0x1bf; }
        break;
    case 0x1599:
        switch (player) { case 0: return 0x1a8; case 1: return 0x1a9; }
        break;
    case 0x15cf:
        switch (player) { case 0: return 0x1c5; case 1: return 0x1cd; }
        break;
    case 0x15d3: case 0x1916:
        switch (player) { case 0: return 0x1c5; case 1: return 0x1cc; }
        break;
    case 0x15e7:
        switch (player) { case 0: return 0x196; case 1: return 0x1a4; }
        break;
    case 0x15f1:
        switch (player) { case 0: return 0x1c2; case 1: return 0x1c3; }
        break;
    case 0x15f7:
        switch (player) { case 0: return 0x1c4; case 1: return 0x1c5; }
        break;
    case 0x161e:
        switch (player) { case 0: return 0x1af; case 1: return 0x1a7; }
        break;
    case 0x1656:
        switch (player) {
        case 0: return 0x1b0; case 1: return 0x1b1;
        case 3: return 0x1b6; case 4: return 0x1b7;
        }
        break;          /* player 2 (and >4) falls through to default 0x1ac */
    case 0x1679:
        switch (player) { case 0: return 0x1c8; case 1: return 0x1c9; }
        break;
    case 0x1685:
        switch (player) { case 0: return 0x1b2; case 1: return 0x1b3; }
        break;
    case 0x1686:
        switch (player) { case 0: return 0x1b4; case 1: return 0x1b5; }
        break;
    case 0x1776:
        switch (player) { case 0: return 0x1c0; case 1: return 0x1c1; }
        break;
    case 0x1841:
        switch (player) { case 0: return 0x1c0; case 1: return 0x1a6; }
        break;
    case 0x184e:
        switch (player) {
        case 0: return 0x1ca; case 1: return 0x1cb; case 2: return 0x1a5; case 3: return 0x1c1;
        }
        break;
    case 0x1885:
        switch (player) { case 0: return 0x1d1; case 1: return 0x1d2; }
        break;
    case 0x19d3:
        switch (player) { case 0: return 0x1ce; case 1: return 0x1cf; case 2: return 0x1d0; }
        break;
    case 0x1a1c: case 0x1a32:
        switch (player) { case 0: return 0x1d3; case 1: return 0x1d4; case 2: return 0x1d5; }
        break;
    case 0x1a80:
        switch (player) { case 0: return 0x1d6; case 1: return 0x1d7; }
        break;
    }
    return 0x1ac;
}
