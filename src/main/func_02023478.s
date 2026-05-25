; func_02023478 — brief 208 worked example for the literal-tail
; trim trap (C-36). Deferred path:
;
;   - Brief 205 first encountered this pick and deferred it (last
;     pool entry `.word 0x7fff` → bytes `ff 7f 00 00`, last 2 bytes
;     match the patcher trim heuristic; literal-promotion workaround
;     couldn't apply because 0x7fff's high bits are already zero).
;   - Brief 204 (PR #656) added reloc-protection to
;     `trim_text_section_padding`, but that only covers relocation
;     tails. The 0x7fff slot has NO reloc — it's a raw literal —
;     so the trim still fires.
;   - Brief 207 (PR #660) re-attempted and surfaced the residual
;     gap. Deferred at `.s.deferred` for brief 208 to close.
;   - Brief 208 adds a complementary `--delinks` / `--source-path`
;     pair to `patch_section_align.py` that cross-references the
;     TU's intended `.text` slot size from delinks.txt. If mwasm
;     emitted exactly the declared size, the trim is suppressed —
;     resolving the literal-tail false positive without weakening
;     the brief 204 reloc-protection for legitimate mwasm padding.
;
; Recipe: vanilla brief 202 `.s` (two pool slots referencing the
; same `data_0219a8dc` symbol — mwcc 2.0's IR-CSE would collapse
; them to one slot in C source, breaking byte-match; explicit
; `.word`s bypass that). Last pool slot is the literal mask
; `.word 0x7fff` (C-23 saturation pattern). See:
;
;   - docs/research/first-wave-wall-literal-tail-trim.md
;   - docs/research/codegen-walls.md § C-36

        .text
        .extern data_0219a8dc
        .extern Task_InvokeLocked
        .extern func_0208e5ec
        .global func_02023478
        .arm

func_02023478:
        stmdb   sp!, {r3, r4, lr}
        sub     sp, sp, #0x4
        ldr     r0, .L_POOL_A           ; r0 = &data_0219a8dc (slot A)
        ldr     r4, .L_POOL_B           ; r4 = &data_0219a8dc (slot B)
        ldr     r0, [r0, #0x0]
        cmp     r0, #0x0
        beq     .L_skip_invoke
        ldr     r0, [r4, #0x0]
        bl      Task_InvokeLocked
        mov     r0, #0x0
        str     r0, [r4, #0x0]
.L_skip_invoke:
        mov     r3, #0x4000000           ; r3 = REG_BASE (I/O base)
        ldr     r1, [r3, #0x0]           ; r1 = REG_DISPCNT
        ldr     r0, [r3, #0x0]           ; r0 = REG_DISPCNT (reload — pre-modify)
        and     r1, r1, #0x1f00          ; isolate BG mode bits
        mov     r2, r1, lsr #0x8         ; r2 = current BG mode
        bic     r1, r0, #0x1f00          ; clear BG-mode bits in r1
        bic     r0, r2, #0x1             ; r0 = mode & ~1
        orr     r0, r1, r0, lsl #0x8     ; r0 = r1 | (r0 << 8)
        ldr     r2, .L_POOL_MASK
        str     r0, [r3, #0x0]           ; REG_DISPCNT = r0
        mov     r0, #0x0
        mov     r1, #0x1f
        mov     r3, #0x3f
        str     r0, [sp, #0x0]
        bl      func_0208e5ec
        mov     r0, #0x1
        add     sp, sp, #0x4
        ldmia   sp!, {r3, r4, pc}
.L_POOL_A:
        .word   data_0219a8dc
.L_POOL_B:
        .word   data_0219a8dc
.L_POOL_MASK:
        .word   0x7fff
