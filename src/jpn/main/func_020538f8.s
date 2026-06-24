; func_020538f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff9fc
        .extern data_0219e314
        .extern data_0219e354
        .extern data_0219e394
        .extern data_0219e398
        .extern data_0219e3a5
        .extern func_020539f0
        .extern func_02053a40
        .extern func_02054e18
        .extern func_020552ac
        .extern func_020a7274
        .extern func_020a9698
        .extern func_020aace8
        .extern func_020aad04
        .global func_020538f8
        .arm
func_020538f8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x44
    mov r4, r0
    ldr r0, _LIT0
    mov r1, r4
    bl func_020aad04
    ldr r0, _LIT1
    mvn r1, #0x0
    str r1, [r0]
    bl func_020552ac
    ldr r0, _LIT2
    ldrsb r5, [r0]
    cmp r5, #0x0
    bne .L_48
    ldr r1, _LIT3
    add r0, sp, #0x0
    mov r2, r4
    bl func_020a9698
.L_48:
    cmp r5, #0x0
    ldrne r0, _LIT2
    ldr r1, _LIT4
    ldr r2, _LIT5
    addeq r0, sp, #0x0
    bl func_02053a40
    cmp r0, #0x0
    addeq sp, sp, #0x44
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x2
    mov r1, r0
    mov r2, #0x0
    bl func_02054e18
    ldr r2, _LIT1
    mvn r1, #0x0
    cmp r0, r1
    str r0, [r2]
    addeq sp, sp, #0x44
    ldmeqia sp!, {r4, r5, pc}
    mov r1, #0x9
    mov r0, r4
    strb r1, [r2, #0xc]
    bl func_020aace8
    mov r5, r0
    ldr r0, _LIT6
    mov r1, r4
    add r2, r5, #0x1
    bl func_020a7274
    ldr r0, _LIT1
    add r1, r5, #0x6
    str r1, [r0, #0x4c]
    bl func_020539f0
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0x54]
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219e354
_LIT1: .word data_0219e394
_LIT2: .word data_0219e314
_LIT3: .word data_020ff9fc
_LIT4: .word 0x00006cfc
_LIT5: .word data_0219e398
_LIT6: .word data_0219e3a5
