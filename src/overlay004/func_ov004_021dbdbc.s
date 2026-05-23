; Brief 191 worked example — mwldarm interwork veneer.
;
; func_ov004_021dbdbc is an 8-byte Thumb→ARM interwork veneer
; that bridges Thumb-mode calls (from ov004's own .thumb code)
; into the ARM trampoline `func_0206ecb4` in main, which then
; jumps to the real `func_0206de68`. Brief 188 (PR #636) skipped
; this pick along with 4 siblings (#3, #4, #5, #9, #12) after a
; naive `.s` attempt triggered a 26K-byte downstream cascade
; (decomper observation) — which my Part 1 reproduction at
; the `.c` claim shape confirms at 159K bytes / 19,693 runs +
; a +5-byte `.rodata` shift that exceeds the brief 180 patcher
; cap.
;
; The empirical recipe (brief 191 Part 2 — option b in the
; brief's enumeration):
;
;   - `.text` + `.thumb` directives (NOT `.thumb_func` —
;     mwasmarm 2.0/sp1p5 rejects the GNU symbol-marker; just
;     using `.thumb` to switch encoding mode is enough).
;   - `.global` exposes the symbol so mwldarm's interwork pass
;     picks it up as an EXISTING veneer rather than emitting
;     its own.
;   - The literal-pool `.word target` is the link-time-resolved
;     target VA. dsd's reloc-walk wires it.
;
; Why this works where `.c` doesn't: mwcc defaults to ARM-mode
; code for `.c` files in this project (`-proc arm946e` without
; `-mthumb`), so a `.c` tail-call wrapper emits 12+ bytes of
; ARM rather than the 8-byte Thumb veneer shape. The size
; difference cascades through the link layout.

        .text
        .global func_ov004_021dbdbc
        .thumb
func_ov004_021dbdbc:
        ldr     r3, [pc, #0]
        bx      r3
        .word   0x0206ecb4
