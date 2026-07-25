; func_ov002_022a1870 — MISTAGGED (cm-parked-reaudit-2 batch B,
; 2026-07-25): this is NOT a genuine C-34 duplicate-pool-slot case —
; the function has zero pool words at all (no `ldr rN, [pc, #...]`
; anywhere in the body below), so there is nothing for mwasmarm to
; dedup or fail to dedup. The real obstacle is a branch/predication
; mismatch: plain C (`if (f4==0xc || f4==0x20) return 0; return f0;`)
; compiles under mwccarm 2.0/sp1p5 to a fully-predicated, branchless
; sequence (`cmp/cmpne` + `moveq`/`ldrne`), while orig keeps the
; `cmp/cmpne` compare chain but an UNPREDICATED explicit `bne` + two
; separate return blocks (this exact shape). Tried: inverted condition,
; single-converged-return restructuring (both still predicate under
; 2.0/sp1p5), and the `.legacy.c` (1.2/sp2p3) tier (does not predicate,
; but also does not emit the `cmp;cmpne` compound-compare orig has --
; two plain `cmp`+branch pairs instead, worse match). Best reached:
; 50% (6/8 words) under plain `.c`. Left as `.s`; a future session with
; a dedicated predication-suppression lever could revisit this.

        .text
        .global func_ov002_022a1870
        .arm
func_ov002_022a1870:
    ldr r1, [r0, #0x4]
    cmp r1, #0xc
    cmpne r1, #0x20
    bne .L_022a1888
    mov r0, #0x0
    bx lr
.L_022a1888:
    ldr r0, [r0, #0x0]
    bx lr
