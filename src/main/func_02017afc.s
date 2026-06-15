; func_02017afc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201abb0
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_02017afc
        .arm
func_02017afc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_8ac
    b .L_918
    b .L_8ec
    b .L_8b4
.L_8ac:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_8b4:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x68
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_8ec:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldrne r0, _LIT2
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_918:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    bl func_0201b7b4
    mov r0, #0x7
    bl func_0201abb0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00250100
_LIT1: .word 0x00250101
_LIT2: .word 0x00250102
_LIT3: .word 0x00250103
