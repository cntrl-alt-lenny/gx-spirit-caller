; func_02070400 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ede0
        .extern data_021a62f0
        .extern func_020704ec
        .extern func_02072e18
        .extern func_02072f58
        .extern func_020746f8
        .global func_02070400
        .arm
func_02070400:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr ip, _LIT0
    mov r7, r1
    ldr ip, [ip, #0x4]
    mov r6, r2
    ldr r4, [ip, #0xa4]
    mov r5, r3
    cmp r4, #0x0
    beq .L_d4
    ldrb ip, [r4, #0x8]
    cmp ip, #0xa
    bne .L_64
    cmp r7, #0x0
    beq .L_44
    mov r2, r4
    bl func_02072e18
.L_44:
    cmp r5, #0x0
    beq .L_5c
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02072e18
.L_5c:
    add r0, r7, r5
    b .L_bc
.L_64:
    cmp ip, #0xb
    bne .L_9c
    cmp r7, #0x0
    beq .L_7c
    mov r2, r4
    bl func_02072f58
.L_7c:
    cmp r5, #0x0
    beq .L_94
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02072f58
.L_94:
    add r0, r7, r5
    b .L_bc
.L_9c:
    ldrb ip, [r4, #0x9]
    cmp ip, #0x0
    beq .L_b4
    str r4, [sp]
    bl func_020746f8
    b .L_bc
.L_b4:
    str r4, [sp]
    bl func_020704ec
.L_bc:
    ldr r1, _LIT1
    ldrb r1, [r1]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
.L_d4:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a62f0
_LIT1: .word data_0219ede0
