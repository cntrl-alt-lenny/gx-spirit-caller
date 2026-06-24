; func_02070fa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219edf4
        .extern data_021a62f0
        .global func_02070fa4
        .arm
func_02070fa4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    ldr r6, [r0, #0x8]
    ldr r2, _LIT1
    mov r4, #0x400
    mov r3, #0x1
    mov r5, #0x0
    ldr r1, _LIT2
.L_20:
    ldrh ip, [r2]
    mov r0, r5
    add ip, ip, #0x1
    strh ip, [r2]
    ldrh ip, [r2]
    cmp ip, #0x400
    bcc .L_44
    cmp ip, r1
    bcc .L_48
.L_44:
    strh r4, [r2]
.L_48:
    mov r8, r6
    cmp r6, #0x0
    beq .L_8c
    ldrh r7, [r2]
.L_58:
    ldr lr, [r8, #0xa4]
    cmp lr, #0x0
    beq .L_80
    ldr ip, [lr]
    cmp ip, #0x0
    beq .L_80
    ldrh ip, [lr, #0xa]
    cmp ip, r7
    moveq r0, r3
    beq .L_8c
.L_80:
    ldr r8, [r8, #0x68]
    cmp r8, #0x0
    bne .L_58
.L_8c:
    cmp r0, #0x0
    bne .L_20
    ldr r0, _LIT1
    ldrh r0, [r0]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a62f0
_LIT1: .word data_0219edf4
_LIT2: .word 0x00001388
