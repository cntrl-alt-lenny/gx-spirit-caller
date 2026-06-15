; func_0206a7b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101db0
        .extern data_02101dd4
        .extern func_020540d0
        .extern func_02054140
        .extern func_0206b44c
        .extern func_020a6d54
        .global func_0206a7b0
        .arm
func_0206a7b0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldr r0, [r8, #0x8]
    mov r7, r1
    mov r6, r2
    bl func_02054140
    mov r5, r0
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_58c
    mvn r9, #0x0
.L_4c4:
    ldr r0, [r8, #0x8]
    mov r1, r4
    bl func_020540d0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_508
    cmp r0, #0x1
    beq .L_4f0
    cmp r0, #0x2
    beq .L_4fc
    b .L_550
.L_4f0:
    add r7, r7, #0x1
    sub r6, r6, #0x1
    b .L_570
.L_4fc:
    add r7, r7, #0x2
    sub r6, r6, #0x2
    b .L_570
.L_508:
    cmp r6, #0x1
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldrb r0, [r7], #0x1
    sub r6, r6, #0x1
    cmp r0, #0xff
    bne .L_570
    mov r0, r7
    mov r1, r6
    bl func_0206b44c
    cmp r0, r9
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r7, r7, r0
    sub r6, r6, r0
    b .L_570
.L_550:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_570:
    cmp r6, #0x0
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_4c4
.L_58c:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02101dd4
_LIT1: .word data_02101db0
_LIT2: .word 0x00000317
