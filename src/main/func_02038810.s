; func_02038810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b550
        .extern func_02037b58
        .extern func_0203874c
        .extern func_02087df4
        .global func_02038810
        .arm
func_02038810:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r1
    mov r7, r2
    mov r6, r3
    bl func_02037b58
    movs r4, r0
    beq .L_8c
    ldrsb r2, [r4, #0x6a]
    cmp r2, #0x4
    bge .L_8c
    ldr r0, [r4, #0x34]
    mov r0, r0, lsr #0x14
    and r0, r0, #0xf
    cmp r0, #0x1
    beq .L_94
.L_8c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_94:
    ldr r1, _LIT0
    mov r0, #0x84
    mla r5, r2, r0, r1
    cmp r8, #0x10000
    movcc r0, #0x1
    movcc r8, r0, lsl r8
    mov r0, r8, lsl #0x10
    movs r8, r0, lsr #0x10
    ldrh r1, [r5]
    mov r9, r8
    orr r0, r1, r8
    strh r0, [r5]
    beq .L_f0
    add sl, r5, #0x4
.L_cc:
    tst r9, #0x1
    beq .L_e4
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_0203874c
.L_e4:
    movs r9, r9, asr #0x1
    add sl, sl, #0x8
    bne .L_cc
.L_f0:
    ldrh r0, [r4, #0x68]
    tst r0, #0x6000
    cmpeq r6, #0x0
    bne .L_124
    mov r1, r8, lsl #0x10
    mov r2, r7
    add r0, r4, #0x4
    mov r1, r1, lsr #0x10
    bl func_02087df4
    ldrh r1, [r5]
    mvn r0, r8
    and r0, r1, r0
    strh r0, [r5]
.L_124:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219b550
