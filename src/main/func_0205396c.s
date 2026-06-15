; func_0205396c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffadc
        .extern data_0219e3f4
        .extern data_0219e434
        .extern data_0219e474
        .extern data_0219e478
        .extern data_0219e485
        .extern func_02053a64
        .extern func_02053ab4
        .extern func_02054e8c
        .extern func_02055320
        .extern func_020a7368
        .extern func_020a978c
        .extern func_020aaddc
        .extern func_020aadf8
        .global func_0205396c
        .arm
func_0205396c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x44
    mov r4, r0
    ldr r0, _LIT0
    mov r1, r4
    bl func_020aadf8
    ldr r0, _LIT1
    mvn r1, #0x0
    str r1, [r0]
    bl func_02055320
    ldr r0, _LIT2
    ldrsb r5, [r0]
    cmp r5, #0x0
    bne .L_240
    ldr r1, _LIT3
    add r0, sp, #0x0
    mov r2, r4
    bl func_020a978c
.L_240:
    cmp r5, #0x0
    ldrne r0, _LIT2
    ldr r1, _LIT4
    ldr r2, _LIT5
    addeq r0, sp, #0x0
    bl func_02053ab4
    cmp r0, #0x0
    addeq sp, sp, #0x44
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x2
    mov r1, r0
    mov r2, #0x0
    bl func_02054e8c
    ldr r2, _LIT1
    mvn r1, #0x0
    cmp r0, r1
    str r0, [r2]
    addeq sp, sp, #0x44
    ldmeqia sp!, {r4, r5, pc}
    mov r1, #0x9
    mov r0, r4
    strb r1, [r2, #0xc]
    bl func_020aaddc
    mov r5, r0
    ldr r0, _LIT6
    mov r1, r4
    add r2, r5, #0x1
    bl func_020a7368
    ldr r0, _LIT1
    add r1, r5, #0x6
    str r1, [r0, #0x4c]
    bl func_02053a64
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0x54]
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219e434
_LIT1: .word data_0219e474
_LIT2: .word data_0219e3f4
_LIT3: .word data_020ffadc
_LIT4: .word 0x00006cfc
_LIT5: .word data_0219e478
_LIT6: .word data_0219e485
