; func_02023f7c — brief 202 attempt (a-refined): pure `.s` with
; EXPLICIT `.word` directives to force two distinct pool slots
; for the same data symbol.
;
; Brief 201 documented mwcc 2.0/sp1p5's address-CSE wall: any
; two C-source references to the same symbol resolve to a single
; pool slot via mwcc's IR-level CSE pass. Brief 202 attempt (a)
; first tried `asm void` + `nofralloc` to bypass mwcc's IR
; pass — that worked for the BL/MOV instruction stream, but
; mwasmarm (the assembler) STILL dedupes its literal pool when
; the `ldr rN, =sym` macro is used. Result: two distinct `ldr`
; instructions but both targeting the same pool offset.
;
; Pure `.s` with explicit `ldr rN, [pc, #imm]` + `.word sym`
; bypasses BOTH layers — the `.word`s are placed individually
; and mwasmarm doesn't dedupe explicit data directives. This
; produces two pool slots, each loaded by its own `ldr`,
; matching orig byte-for-byte.

        .text
        .extern data_0219a8e4
        .extern Fill32
        .extern Task_PostLocked
        .global func_02023f7c
        .arm

func_02023f7c:
        stmdb   sp!, {r3, r4, r5, lr}
        ldr     r4, .L_POOL_A           ; r4 = &data_0219a8e4 (slot A)
        mov     r5, r0                  ; r5 = arg0
        mov     r1, r4
        mov     r0, #0x0
        mov     r2, #0x8
        bl      Fill32                   ; Fill32(0, &data, 8)
        ldr     r0, .L_POOL_B           ; r0 = &data_0219a8e4 (slot B)
        str     r5, [r0, #0x4]           ; data.saved_arg = arg0
        ldr     r0, [r0]                  ; r0 = data.handle
        cmp     r0, #0x0
        bne     .L_done
        ldr     r1, [r4, #0x4]            ; r1 = data.saved_arg (re-read via r4)
        mov     r0, #0x88                  ; r0 = 0x88 (sizeof entry)
        mul     r5, r1, r0                ; r5 = saved_arg * 0x88
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
        .word   data_0219a8e4
.L_POOL_B:
        .word   data_0219a8e4
