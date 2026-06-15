; func_020602c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101244
        .extern data_02101254
        .extern data_02101260
        .extern data_021012fc
        .extern data_0210130c
        .extern func_020a6d54
        .extern func_020aaddc
        .extern func_020ab0c4
        .global func_020602c4
        .arm
func_020602c4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r5, r0
    mov r8, r1
    mov r4, r2
    mov r7, r3
    bne .L_2f0
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_2f0:
    cmp r8, #0x0
    bne .L_30c
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6d54
.L_30c:
    cmp r4, #0x0
    bne .L_328
    ldr r0, _LIT5
    ldr r1, _LIT1
    ldr r3, _LIT6
    mov r2, #0x0
    bl func_020a6d54
.L_328:
    cmp r7, #0x0
    bgt .L_344
    ldr r0, _LIT7
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x110
    bl func_020a6d54
.L_344:
    ldrsb r6, [r8]
    mov r0, r5
    mov r1, r8
    bl func_020ab0c4
    movs r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    bl func_020aaddc
    add r3, r5, r0
    sub r0, r7, #0x1
    mov r2, #0x0
    b .L_380
.L_378:
    strb r1, [r4, r2]
    add r2, r2, #0x1
.L_380:
    cmp r2, r0
    bge .L_39c
    ldrsb r1, [r3, r2]
    cmp r1, #0x0
    beq .L_39c
    cmp r1, r6
    bne .L_378
.L_39c:
    mov r0, #0x0
    strb r0, [r4, r2]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021012fc
_LIT1: .word data_02101244
_LIT2: .word 0x0000010d
_LIT3: .word data_02101254
_LIT4: .word 0x0000010e
_LIT5: .word data_02101260
_LIT6: .word 0x0000010f
_LIT7: .word data_0210130c
