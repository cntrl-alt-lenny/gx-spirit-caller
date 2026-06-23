; func_ov011_021cdb14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02018b8c
        .global func_ov011_021cdb14
        .arm
func_ov011_021cdb14:
    stmdb sp!, {r4, r5, r6, lr}
    add r6, r0, #0x10
    mov r5, #0x1
.L_c:
    mov r0, r5
    bl func_02018b8c
    mov r4, r0
    ldr r0, [r4, #0x8]
    mov r0, r0, lsl #0x18
    cmp r6, r0, lsr #0x18
    bne .L_50
    mov r0, r5
    bl func_02018b8c
    ldr r0, [r0, #0x8]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x8]
    moveq r0, r0, lsl #0xf
    cmpeq r5, r0, lsr #0x18
    moveq r0, r5
    ldmeqia sp!, {r4, r5, r6, pc}
.L_50:
    add r5, r5, #0x1
    cmp r5, #0x60
    blt .L_c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
