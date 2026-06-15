; func_020353cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b760
        .extern func_02036298
        .extern func_02037dc0
        .global func_020353cc
        .arm
func_020353cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs r9, r1
    mov sl, r0
    mov r6, r9
    ldreq r6, [sl, #0x34]
    ldr r1, _LIT0
    mov r0, r6, lsl #0x10
    ldr r2, [r1, #0x34]
    mov r1, r0, lsr #0x10
    mov r0, #0xc
    mla r0, r1, r0, r2
    ldrb r0, [r0, #0x8]
    mov fp, #0x0
    ldr r8, _LIT1
    and r0, r0, #0xf
    mov r5, fp
    add r7, r0, #0x1
    mvn r4, #0x0
.L_1fc:
    ldrsb r0, [r8, #0x6a]
    cmp r0, #0x0
    blt .L_270
    ldr r1, [r8, #0x34]
    cmp r1, r6
    bne .L_270
    ldrh r0, [r8, #0x68]
    tst r0, #0x4000
    beq .L_270
    tst r1, #0x1000000
    cmpne r8, sl
    beq .L_270
    sub r7, r7, #0x1
    cmp r7, #0x0
    bgt .L_270
    cmp r9, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrsb r1, [r8, #0x26]
    ldrsb r0, [sl, #0x26]
    mov fp, #0x1
    cmp r1, r0
    ble .L_264
    mov r0, sl
    mov r2, #0x0
    bl func_02037dc0
.L_264:
    mov r0, r8
    mov r1, r4
    bl func_02036298
.L_270:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r8, r8, #0x78
    bcc .L_1fc
    mov r0, fp
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219b2e0
_LIT1: .word data_0219b760
