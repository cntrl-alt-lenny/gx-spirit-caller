; func_0206de68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206bed8
        .extern func_0206bef4
        .extern func_0206bf94
        .extern func_0206ddc0
        .extern func_0206e474
        .extern func_0206e4a4
        .global func_0206de68
        .arm
func_0206de68:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r4, #0x0
    mvnle r0, #0x1b
    ldmleia sp!, {r4, lr}
    bxle lr
    bl func_0206e474
    cmp r0, #0x0
    mvnne r0, #0x19
    ldmneia sp!, {r4, lr}
    bxne lr
    mov r0, r4
    bl func_0206e4a4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, lr}
    bxne lr
    cmp r4, #0x0
    mov r1, #0x0
    beq .L_704
    ldrsh r0, [r4, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_704:
    cmp r1, #0x0
    mvneq r0, #0x26
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrsh r0, [r4, #0x70]
    ands r0, r0, #0x10
    mvnne r0, #0x19
    ldmneia sp!, {r4, lr}
    bxne lr
    ldrsh r0, [r4, #0x70]
    mov r1, #0x1
    orr r0, r0, #0x18
    strh r0, [r4, #0x70]
    ldrsb r0, [r4, #0x73]
    cmp r0, #0x0
    beq .L_74c
    cmp r0, #0x4
    movne r1, #0x0
.L_74c:
    cmp r1, #0x0
    beq .L_760
    ldr r0, [r4, #0x68]
    mov r1, #0x0
    bl func_0206bef4
.L_760:
    ldr r0, _LIT0
    mov r1, r4
    mov r2, #0x1
    bl func_0206bf94
    mov r1, r0
    mov r2, #0x0
    mov r0, r4
    str r2, [r1, #0x8]
    bl func_0206bed8
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word func_0206ddc0
