; func_02005e04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103c8c
        .extern func_0209281c
        .extern func_020943b0
        .global func_02005e04
        .arm
func_02005e04:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    cmp r0, #0x1
    beq .L_18
    cmp r0, #0x2
    beq .L_24
    b .L_30
.L_18:
    ldr r0, _LIT0
    ldr r8, [r0]
    b .L_34
.L_24:
    ldr r0, _LIT0
    ldr r8, [r0, #0x4]
    b .L_34
.L_30:
    mov r8, #0x0
.L_34:
    mov r9, #0x0
    mov fp, r9
    add r7, r8, #0x400
    mov r6, #0x6
    mov r4, #0xc
    mvn r5, #0x0
.L_4c:
    add r0, r8, fp, lsl #0x1
    add r0, r0, #0xa00
    ldrsh r0, [r0, #0x2]
    cmp r0, r5
    beq .L_8c
.L_60:
    mul sl, r0, r4
    add r1, r8, r9, lsl #0x3
    mov r2, r6
    add r0, r7, sl
    add r9, r9, #0x1
    bl func_020943b0
    add r0, r8, sl
    add r0, r0, #0x400
    ldrsh r0, [r0, #0x8]
    cmp r0, r5
    bne .L_60
.L_8c:
    add fp, fp, #0x1
    cmp fp, #0x20
    blt .L_4c
    mov r0, r8
    mov r1, #0x400
    bl func_0209281c
    ldr r3, [r8, #0xa48]
    mov r0, r8
    mov r1, #0x0
    mov r2, #0x400
    blx r3
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02103c8c
