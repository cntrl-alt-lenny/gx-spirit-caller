; func_02013b18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0201b71c
        .extern func_0201b7a0
        .global func_02013b18
        .arm
func_02013b18:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r1, [r0, #0x8d8]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x920]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_58
    b .L_64
    b .L_80
    b .L_8c
    b .L_98
    b .L_b0
    b .L_c8
    b .L_d4
    b .L_e0
    b .L_ec
.L_58:
    ldr r0, _LIT0
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_64:
    ldr r0, _LIT1
    str r0, [r4, #0x8]
    bl func_0201b71c
    ldr r1, [r0]
    bic r1, r1, #0x2000
    str r1, [r0]
    ldmia sp!, {r4, pc}
.L_80:
    ldr r0, _LIT2
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_8c:
    mov r0, #0x20400
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_98:
    mov r0, r4
    bl func_0201b7a0
    cmp r0, #0x4
    ldreq r0, _LIT3
    streq r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_b0:
    mov r0, r4
    bl func_0201b7a0
    cmp r0, #0x5
    ldreq r0, _LIT4
    streq r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_c8:
    ldr r0, _LIT5
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_d4:
    mov r0, #0x20800
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_e0:
    ldr r0, _LIT6
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_ec:
    ldr r0, _LIT7
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00020100
_LIT1: .word 0x00020200
_LIT2: .word 0x00020300
_LIT3: .word 0x00020500
_LIT4: .word 0x00020600
_LIT5: .word 0x00020700
_LIT6: .word 0x00020900
_LIT7: .word 0x00020a00
