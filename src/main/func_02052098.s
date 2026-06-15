; func_02052098 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3ec
        .extern func_02052334
        .extern func_0205272c
        .extern func_02094688
        .global func_02052098
        .arm
func_02052098:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    mov r3, #0x30
    ldr r4, [r4]
    mov r7, r1
    mla r5, r0, r3, r4
    mov r6, r2
    bl func_02052334
    strb r0, [r5, #0x1e]
    mov r0, r7
    bl func_0205272c
    mov r4, r0
    cmp r4, #0x4
    addls pc, pc, r4, lsl #0x2
    b .L_208
    b .L_208
    b .L_1a4
    b .L_200
    b .L_200
    b .L_200
.L_1a4:
    cmp r6, #0x8
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    add r1, sp, #0x0
    mov r0, r7
    mov r2, #0x8
    bl func_02094688
    ldr r1, [sp]
    mov r0, #0x0
    str r1, [r5, #0x18]
    str r0, [r5, #0x10]
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_1f4
    ldr r1, [r5, #0x8]
    ldr r0, [r5, #0x18]
    cmp r1, r0
    movge r0, #0x2
    strgeb r0, [r5, #0x1d]
    bge .L_208
.L_1f4:
    mov r0, #0x4
    strb r0, [r5, #0x1d]
    b .L_208
.L_200:
    mov r0, #0x3
    strb r0, [r5, #0x1d]
.L_208:
    strh r4, [r5, #0x22]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219e3ec
