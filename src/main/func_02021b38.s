; func_02021b38 — brief 204 worked example.
;
; Initialise a 0x34a8-byte BSS block (data_02197434), record the
; arg into data_02198434[44], copy a 16-bit field from
; data_021040ac[14] to data_02197434[1], then run a 256-iteration
; loop that writes -1 into data_02197434[i*16 + 0x48].
;
; The orig was built with a routing trilemma that no current
; mwccarm tier reproduces (brief 204 swept all 15 available
; variants: 1.2/{base,sp2,sp2p3,sp3,sp4}, 2.0/{base,sp1,sp1p2,
; sp1p5,sp1p6,sp1p7,sp2,sp2p2,sp2p3,sp2p4}). Best match was 112
; bytes (1.2/sp2p3); orig is 116 bytes. Three combined codegen
; choices differ:
;
;   1. push {r3, r4, r5, lr} — 2 callee-saved + r3 spill +
;      lr. All 15 mwccarm tiers emit push {r4, lr} (2 regs).
;   2. Duplicate pool ref — orig has two pool slots for
;      data_02197434 (at function offsets 0x60 and 0x70). All
;      mwccarm tiers CSE to one slot.
;   3. Non-strength-reduced loop — orig keeps `add r0, r4, r2,
;      lsl #4` per iteration (multiplying i*16 in the
;      addressing mode). All mwccarm tiers strength-reduce to
;      `add ip, ip, #16` increment.
;
; #2 is C-34 (brief 202's address-CSE wall) — the relocs.txt
; signature flags it cleanly. #1 + #3 are reg-allocator +
; strength-reduction choices downstream of source-shape
; iteration. Per brief 202's precedent (and brief 191's mwldarm
; veneer recipe), the cleanest fix for combined codegen walls
; that no single mwcc tier produces is pure `.s` with explicit
; instruction stream + explicit `.word` pool slots — bypasses
; both mwcc IR and mwasmarm's literal-pool dedup.

        .text
        .extern data_02197434
        .extern data_021040ac
        .extern data_02198434
        .extern Fill32
        .global func_02021b38
        .arm

func_02021b38:
        stmdb   sp!, {r3, r4, r5, lr}
        ldr     r4, .L_DATA_A           ; r4 = &data_02197434 (slot A)
        ldr     r2, .L_SIZE             ; r2 = 0x34a8
        mov     r5, r0                  ; r5 = arg
        mov     r1, r4
        mov     r0, #0x0
        bl      Fill32                  ; Fill32(0, &data_02197434, 0x34a8)
        ldr     r0, .L_CFG_TABLE         ; r0 = &data_021040ac
        ldr     r2, .L_DATA_B            ; r2 = &data_02198434
        ldr     r0, [r0, #0x38]          ; r0 = data_021040ac[14]
        str     r5, [r2, #0xb0]          ; data_02198434[44] = arg
        mov     r0, r0, lsl #0x10
        ldr     r1, .L_DATA_A2           ; r1 = &data_02197434 (slot B —
                                         ;     duplicate-target load, C-34)
        mov     r0, r0, lsr #0x10        ; r0 = low 16 bits zero-extended
        str     r0, [r1, #0x4]           ; data_02197434[1] = (u16)cfg
        mov     r2, #0x0                  ; loop counter i = 0
        mvn     r1, #0x0                  ; r1 = -1 (C-15 mvn form)
.L_loop:
        add     r0, r4, r2, lsl #0x4      ; r0 = &data_02197434[i*16] (NOT
                                          ;     strength-reduced; orig
                                          ;     keeps the lsl in the
                                          ;     addressing mode)
        add     r2, r2, #0x1              ; i++
        str     r1, [r0, #0x48]            ; *(r0 + 0x48) = -1
        cmp     r2, #0x100                  ; i < 256
        blt     .L_loop
        mov     r0, #0x1
        ldmia   sp!, {r3, r4, r5, pc}
.L_DATA_A:
        .word   data_02197434
.L_SIZE:
        .word   0x000034a8
.L_CFG_TABLE:
        .word   data_021040ac
.L_DATA_B:
        .word   data_02198434
.L_DATA_A2:
        .word   data_02197434
