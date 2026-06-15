; func_02038e58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2fc
        .extern data_0219c488
        .extern func_01ff8000
        .extern func_020893f0
        .global func_02038e58
        .arm
func_02038e58:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r8, r0
    mov r0, r7, lsr #0x14
    movs r5, r3
    mov r4, r5
    rsbmi r5, r5, #0x0
    cmp r8, #0x0
    and r0, r0, #0xf
    ldreq r8, _LIT0
    mov r6, r2
    cmp r0, #0xd
    bne .L_208
    ldr r0, _LIT1
    mov r1, r7, lsl #0x1a
    ldr r2, [r0]
    mov r0, r1, lsr #0x18
    ldrh r7, [r2, r0]
.L_208:
    bl func_020893f0
    ldr r1, [r0, #0x84]
    ldr r0, [r1, #0x8]
    cmp r7, r0
    mvncs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, r7, r8, pc}
    add r0, r1, #0xc
    add r1, r0, r7, lsl #0x4
    ldr r0, [r1, #0x4]
    ldr r3, [sp, #0x18]
    ldr r1, [r1]
    sub r0, r0, r3
    cmp r5, r0
    movhi r5, r0
    ldr r0, [sp, #0x1c]
    ldr r2, [r8]
    add r0, r1, r0
    add r1, r3, r0
    ldr r0, _LIT2
    add r2, r1, r2
    cmp r4, #0x0
    and r0, r2, r0
    bge .L_27c
    cmp r5, #0x200
    bne .L_27c
    cmp r0, #0x0
    beq .L_27c
    tst r0, #0x3
    rsbeq r5, r0, #0x200
.L_27c:
    ldr r2, [sp, #0x18]
    mov r0, r8
    mov r3, r5
    add r2, r6, r2
    bl func_01ff8000
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219c488
_LIT1: .word data_0219b2fc
_LIT2: .word 0x000001ff
