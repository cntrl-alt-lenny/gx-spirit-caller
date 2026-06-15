; func_020384e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .global func_020384e8
        .arm
func_020384e8:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr ip, [r2, #0x4c]
    cmp ip, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, #0x0
.L_29c:
    add r0, r0, #0x20
    cmp r0, r2
    ldr r3, [ip], #0x4
    bge .L_2b8
    cmp r3, #0x0
    addge ip, ip, #0x40
    b .L_29c
.L_2b8:
    cmp r3, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r4, pc}
    cmp r1, #0x0
    beq .L_2e8
    mov r0, r2, lsl #0x1b
    mov r0, r0, lsr #0x1a
    ldrh r0, [ip, r0]
    ldr r1, _LIT1
    cmp r0, r1
    subeq r0, r1, #0x10000
    ldmia sp!, {r4, pc}
.L_2e8:
    mov r4, #0x0
    ldr r0, _LIT1
    mov lr, r4
    and r1, r2, #0x1f
.L_2f8:
    mov r2, lr, lsl #0x1
    ldrh r2, [ip, r2]
    add lr, lr, #0x1
    cmp r2, r0
    addne r4, r4, r2
    cmp lr, r1
    blt .L_2f8
    add r0, r3, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219b2e0
_LIT1: .word 0x0000ffff
