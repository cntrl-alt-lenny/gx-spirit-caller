; Copy32 (was func_020944d4): 4-byte-stride memory copy.
;
; Sibling of Fill32 (#165) — sits immediately after Fill32 in the
; .text (Fill32 ends at 0x020944d4). Classic "memcpy + memfill" pair
; that the scouting doc (#175) identified as the strongest Fill32
; cascade candidate: 17 shared callers, adjacent address, matching
; size-class (0x1c).
;
; Disassembly (build/eur/asm/_dsd_gap@main_*.s):
;
;     add ip, r1, r2                  ; end = dst + size_bytes
; .L_020944d8:
;     cmp r1, ip                      ; while (dst < end)
;     ldmltia r0!, {r2}               ;   r2 = *src++  (conditional
;     stmltia r1!, {r2}               ;                 store-multiple,
;                                     ;                 single-register
;                                     ;                 form)
;                                     ;   *dst++ = r2
;     blt .L_020944d8                 ; loop back
;     bx  lr
;
; 6 ARM instructions, 0x18 bytes.
;
; Arg convention: (src, dst, size_bytes). r0 = const src pointer,
; r1 = dst pointer, r2 = count in bytes. Loop copies 4 bytes per
; iteration. size_bytes is expected to be a multiple of 4 —
; callers guarantee alignment, same contract as Fill32.
;
; Ships as `.s` (like Fill32 before it): mwcc-ARM -O4 won't emit the
; `ldmltia {r2}` / `stmltia {r2}` store-multiple-with-one-register
; form from any C `while (d < end) *d++ = *s++` pattern — it uses
; `ldr`/`str` with post-indexed addressing and an unconditional
; branch. Functionally identical, byte-different (also 0x18 bytes
; but different opcodes).
;
; NitroSDK identity: this function IS `MI_CpuCopy32(src, dst, size)`.
; We use the generic `Copy32` name to pair symmetrically with
; `Fill32`, matching this project's convention of using descriptive
; generic names rather than claiming verbatim NitroSDK identity
; (e.g. for arg-order canonicalization reasons documented in
; Fill32.s).
;
; Cascade impact: scouting predicts ~22 callers (matching Fill32's
; cluster shape) plus 17 direct Fill32-overlap.

        .text

        .global Copy32
        .arm
Copy32:
        add     ip, r1, r2
loop_top:
        cmp     r1, ip
        ldmltia r0!, {r2}
        stmltia r1!, {r2}
        blt     loop_top
        bx      lr
