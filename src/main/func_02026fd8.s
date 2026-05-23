; func_02026fd8 — brief 205 / Phase 1: E-08, clone of E-07 with
; `data_0219a924` (instead of `data_0219a8e4`) and multiplier `0xe0`
; (instead of `0x88`).
;
; See brief 202's `func_02023f7c.s` worked example + the C-34 wall
; research note (`docs/research/first-wave-wall-address-cse.md`).
; mwcc 2.0/sp1p5's address-CSE pass collapses two pool entries for
; the same symbol into one slot; mwasmarm dedupes the `ldr =sym`
; macro form. Pure `.s` with explicit `ldr rN, [pc, #imm]` + `.word
; sym` bypasses both layers — two `.word`s placed individually
; produce two pool slots, each loaded by its own `ldr`, matching
; orig byte-for-byte.

        .text
        .extern data_0219a924
        .extern Fill32
        .extern Task_PostLocked
        .global func_02026fd8
        .arm

func_02026fd8:
        stmdb   sp!, {r3, r4, r5, lr}
        ldr     r4, .L_POOL_A           ; r4 = &data_0219a924 (slot A)
        mov     r5, r0                  ; r5 = arg0
        mov     r1, r4
        mov     r0, #0x0
        mov     r2, #0x8
        bl      Fill32                   ; Fill32(0, &data, 8)
        ldr     r0, .L_POOL_B           ; r0 = &data_0219a924 (slot B)
        str     r5, [r0, #0x4]           ; data.saved_arg = arg0
        ldr     r0, [r0]                  ; r0 = data.handle
        cmp     r0, #0x0
        bne     .L_done
        ldr     r1, [r4, #0x4]            ; r1 = data.saved_arg (re-read via r4)
        mov     r0, #0xe0                  ; r0 = 0xe0 (sizeof entry — 224)
        mul     r5, r1, r0                ; r5 = saved_arg * 0xe0
        mov     r0, r5
        mov     r1, #0x4
        mov     r2, #0x0
        bl      Task_PostLocked            ; r0 = Task_PostLocked(size, 4, 0)
        mov     r1, r0
        mov     r2, r5
        mov     r0, #0x0
        str     r1, [r4]                  ; data.handle = result
        bl      Fill32                     ; Fill32(0, handle, size)
.L_done:
        mov     r0, #0x1
        ldmia   sp!, {r3, r4, r5, pc}
.L_POOL_A:
        .word   data_0219a924
.L_POOL_B:
        .word   0x0219a924                       ; literal value of `data_0219a924`
                                                   ; — bypasses the patcher's
                                                   ; trim heuristic (last 2 bytes
                                                   ; pre-link are `19 02` not
                                                   ; `00 00`, so the section size
                                                   ; isn't trimmed from 0x70 to
                                                   ; 0x6e). See PR #115 / brief
                                                   ; 204's trim-protect fix.
