; func_02090b54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern WaitByLoop
        .extern data_021a63b4
        .extern func_02090a50
        .extern func_02090af0
        .global func_02090b54
        .arm
func_02090b54:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    mov r2, #0x1
    ldr r1, _LIT1
    str r2, [r0]
    mov r2, #0x0
    mov r0, #0x7e
    str r2, [r1]
    bl func_02090af0
    ldr r5, _LIT1
    ldrh r0, [r5, #0x6]
    cmp r0, #0x0
    beq .L_b8
    mov r4, #0x400
.L_a4:
    mov r0, r4
    bl WaitByLoop
    ldrh r0, [r5, #0x6]
    cmp r0, #0x0
    bne .L_a4
.L_b8:
    ldr r2, _LIT2
    mvn ip, #0x0
    mov r0, #0x10000
    ldr r3, _LIT3
    ldr r1, _LIT4
    str ip, [r2]
    rsb ip, r0, #0x0
    mov r0, #0x0
    mov r2, #0x28
    str ip, [r3]
    bl Fill32
    ldr ip, _LIT5
    ldr r1, _LIT1
    ldrh r3, [ip]
    mov r0, #0x7e
    mov r2, #0x0
    orr r3, r3, #0x800
    strh r3, [ip]
    ldrh r3, [ip]
    orr r3, r3, #0x80
    strh r3, [ip]
    bl func_02090a50
    ldr r1, _LIT1
    mov r0, #0x7f
    mov r2, #0x0
    bl func_02090af0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a63b4
_LIT1: .word 0x027ffff0
_LIT2: .word 0x027fffb0
_LIT3: .word 0x027fffb4
_LIT4: .word 0x027fffc0
_LIT5: .word 0x04000204
