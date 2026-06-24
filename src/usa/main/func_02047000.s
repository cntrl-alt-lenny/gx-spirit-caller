; func_02047000 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02045230
        .extern func_020455d0
        .extern func_0204591c
        .extern func_0204664c
        .extern func_02048040
        .extern func_020538f8
        .extern func_02094398
        .extern func_020943b0
        .global func_02047000
        .arm
func_02047000:
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r0
    mov r6, r2
    mov r5, r3
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_02045230
    cmp r0, #0x0
    bne .L_38
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r1, [r2, #0x24]
    cmp r1, #0x0
    beq .L_40
.L_38:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_40:
    str r6, [r2, #0x70]
    ldr r1, [r0]
    cmp r4, #0x0
    str r5, [r1, #0x74]
    beq .L_60
    ldrh r1, [r4]
    cmp r1, #0x0
    bne .L_68
.L_60:
    mov r5, #0x0
    b .L_b4
.L_68:
    ldr r1, [r0]
    mov r0, #0x0
    add r1, r1, #0x2e
    mov r2, #0x34
    bl func_02094398
    mov r0, r4
    bl func_0204591c
    cmp r0, #0x19
    movhi r5, #0x19
    bhi .L_9c
    mov r0, r4
    bl func_0204591c
    mov r5, r0
.L_9c:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1]
    mov r2, r5, lsl #0x1
    add r1, r1, #0x2e
    bl func_020943b0
.L_b4:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, r5, lsl #0x1
    strh r1, [r0, #0x2e]
    bl func_020455d0
    cmp r0, #0x4
    beq .L_e8
    ldr r1, _LIT1
    mov r0, #0x2
    bl func_02048040
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_e8:
    mov r0, #0x1
    bl func_0204664c
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x68]
    bl func_020538f8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219da0c
_LIT1: .word 0xffff1596
