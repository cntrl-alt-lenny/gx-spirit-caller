; func_ov012_021cb320 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov012_021cc6a0
        .extern data_ov012_021cc6dc
        .extern func_ov000_021ae4c4
        .extern func_ov012_021caea8
        .global func_ov012_021cb320
        .arm
func_ov012_021cb320:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    ldr r0, _LIT0
    ldr r7, _LIT1
    ldr r0, [r0, #0x19c]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    addne sp, sp, #0x10
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov000_021ae4c4
    cmp r0, #0x4
    beq .L_2e8
    bl func_ov000_021ae4c4
    cmp r0, #0x5
    beq .L_2e8
    bl func_ov000_021ae4c4
    cmp r0, #0x3
    addne sp, sp, #0x10
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e8:
    mov r8, #0x0
    mov sl, #0x9
    mov r6, #0x8
    add r5, sp, #0x8
    mov fp, r8
    mvn r4, #0x0
.L_300:
    add r0, r7, r8, lsl #0x1
    ldrb r1, [r0, #0x174]
    ldrb r0, [r0, #0x175]
    cmp r8, #0x3
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    addls pc, pc, r8, lsl #0x2
    b .L_344
    b .L_338
    b .L_340
    b .L_35c
    b .L_340
.L_338:
    mov r9, r6
    b .L_344
.L_340:
    mov r9, sl
.L_344:
    mov r0, r9
    mov r1, r4
    mov r2, fp
    mov r3, #0x10
    stmia sp, {r5, fp}
    bl func_ov012_021caea8
.L_35c:
    add r8, r8, #0x1
    cmp r8, #0x4
    blt .L_300
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov012_021cc6a0
_LIT1: .word data_ov012_021cc6dc
