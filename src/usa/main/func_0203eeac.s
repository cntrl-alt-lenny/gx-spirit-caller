; func_0203eeac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c7c4
        .extern func_0203c8b0
        .extern func_020431a4
        .extern func_020431bc
        .extern func_02043280
        .global func_0203eeac
        .arm
func_0203eeac:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r0, #0x1
    bl func_0203c8b0
    mov r4, r0
    bl func_020431bc
    movs r5, r0
    beq .L_64
    ldrb r0, [r6, #0xd0d]
    bl func_0203c7c4
    ldrb r1, [r4, #0x15]
    cmp r1, r0
    bne .L_3c
    bl func_020431a4
    str r0, [r4, #0x10]
.L_3c:
    bl func_02043280
    cmp r5, #0xb
    moveq r0, #0xf
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrb r1, [r6, #0xd13]
    mov r2, #0x1
    mov r0, #0xb
    add r1, r6, r1, lsl #0x2
    strb r2, [r1, #0x444]
    ldmia sp!, {r4, r5, r6, pc}
.L_64:
    mov r0, #0xe
    ldmia sp!, {r4, r5, r6, pc}
