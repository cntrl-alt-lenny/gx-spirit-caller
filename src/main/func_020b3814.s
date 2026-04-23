; func_020b3814: 6th-of-6 medium-tier match — closes the tier.
;
; Disassembly (build/eur/asm/_dsd_gap@main_8.s):
;
;     stmdb sp!, {r4, r5, r6, r7, r11, ip, lr}
;     mov   r4, #0x1
;   .L_020b381c:
;     orrs  r5, r3, r2
;     bne   .L_020b382c
;     ldmia sp!, {r4, r5, r6, r7, r11, ip, lr}
;     bx    lr
;   .L_020b382c:
;     orrs  r5, r1, r3
;     bne   .L_020b36cc          ; branches *inside* func_020b3658
;     mov   r1, r2
;     bl    .L_020b3a84          ; calls *inside* func_020b3a7c
;     cmp   r4, #0x0
;     movne r0, r1
;     mov   r1, #0x0
;     ldmia sp!, {r4, r5, r6, r7, r11, ip, lr}
;     bx    lr
;
; 15 ARM instructions, 0x3c bytes.
;
; Entry point into what is almost certainly a hand-written 64-bit
; signed-division runtime routine (a classic CodeWarrior-era
; `__div64`-family piece), where multiple exported entry points
; share code with their neighbours by jumping into the middle of
; each other:
;
;   - `.L_020b36cc` is an internal label inside `func_020b3658`
;     (another entry into the same 64-bit divide).
;   - `.L_020b3a84` is `func_020b3a7c + 8` — the post-skip-early-
;     exit entry point.
;
; Those two targets can't come out of a plain C expression. Even
; the simplest C source for a 64-bit signed divide would compile
; to a runtime-library call (likely to these very functions
; themselves), which produces a `bl` to a *function entry* not a
; `bl` to an *internal label*. Only a hand-crafted asm body with
; explicit branch targets reproduces the inter-function sharing.
;
; Escape-hatch approach: the two inter-function branch targets are
; file-local `.L_*` labels inside their respective `_dsd_gap@*.o`
; objects. They're not in the ELF symbol table of the gap .o, so
; mwldarm has no way to resolve an `extern`-style cross-.o reloc
; to them — any symbolic `bl .L_020b36cc` here would produce an
; unresolved-external link error. (Adding a `kind:function` entry
; at those addresses to `symbols.txt` would collide with the
; enclosing function's size record and confuse dsd.)
;
; Solution: hand-encode the two branch instructions as raw 32-bit
; words. ARM `bl` / `bne` opcodes embed the target as a 24-bit
; signed PC-relative offset, with PC = current_instr + 8. The
; ARM9 main module loads at a fixed address (0x02000000), so the
; absolute targets resolve to deterministic offsets:
;
;     0x020b3830:  bne .L_020b36cc
;       offset = (0x020b36cc - (0x020b3830 + 8)) / 4 = -0x5b
;       encoding = 0x1A000000 | (-0x5b & 0xFFFFFF) = 0x1AFFFFA5
;
;     0x020b3838:  bl  .L_020b3a84
;       offset = (0x020b3a84 - (0x020b3838 + 8)) / 4 = +0x91
;       encoding = 0xEB000000 | 0x91               = 0xEB000091
;
; Both match the baserom bytes verbatim. Because the host function
; itself lives at a fixed address (0x020b3814) and mwldarm's ARM9
; LCF pins it there, the precomputed offsets stay correct after
; link.
;
; Shipped as a standalone `.s` (not inline `asm void` in a `.c`)
; because mwcc-ARM's C inline-asm dialect rejects the CodeWarrior
; data directives (`DCD` / `DC.L`) in that context. The `.s` form
; uses mwasm's GNU-style `.word`, which Just Works. The `src/main/
; Div.s` precedent in this repo uses the same pattern for BIOS
; thunks that can't ship as C for unrelated reasons (Thumb-align
; wall). One `.s` file per entry point, per the dsd/delinks.txt
; constraint noted there.
;
; This is the 6th and final medium-tier match. Paired with the
; brief 009 ov002 `asm void` outlier (same inline-asm escape-hatch
; pattern), it leaves the medium tier at 6/6.

        .text

        .global func_020b3814
        .arm
func_020b3814:
        stmdb   sp!, {r4, r5, r6, r7, r11, ip, lr}
        mov     r4, #0x1
loop_top:
        orrs    r5, r3, r2
        bne     not_zero
        ldmia   sp!, {r4, r5, r6, r7, r11, ip, lr}
        bx      lr
not_zero:
        orrs    r5, r1, r3
        .word   0x1affffa5                      ; bne .L_020b36cc (inside func_020b3658)
        mov     r1, r2
        .word   0xeb000091                      ; bl  .L_020b3a84 (func_020b3a7c + 8)
        cmp     r4, #0x0
        movne   r0, r1
        mov     r1, #0x0
        ldmia   sp!, {r4, r5, r6, r7, r11, ip, lr}
        bx      lr
