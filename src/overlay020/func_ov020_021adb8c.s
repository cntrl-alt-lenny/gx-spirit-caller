; func_ov020_021adb8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov020_021adb8c
        .arm
func_ov020_021adb8c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r3, #0x6
    mul r7, r0, r3
    ldr r5, _LIT0
    mov r3, r7, lsr #0x1f
    smull r4, r8, r5, r7
    add r8, r7, r8
    add r8, r3, r8, asr #0x8
    mov r6, #0x168
    smull r3, r4, r6, r8
    sub r8, r7, r3
    mul lr, r1, r8
    rsb r3, r8, #0x168
    smull r6, r4, r5, lr
    mul r3, r1, r3
    smull r6, ip, r5, r3
    rsb r1, r1, #0xff
    mul r9, r2, r1
    ldr r5, _LIT1
    add ip, r3, ip
    smull r8, r1, r5, r9
    mov r3, r3, lsr #0x1f
    add ip, r3, ip, asr #0x8
    ldr r6, _LIT2
    mov r7, r0, lsl #0x8
    smull sl, r8, r6, r7
    add r8, r8, r0, lsl #0x8
    mov r0, r7, lsr #0x1f
    add r8, r0, r8, asr #0x5
    mov r0, r8, asr #0x8
    add r1, r9, r1
    mov r6, r9, lsr #0x1f
    add r1, r6, r1, asr #0x7
    add r4, lr, r4
    mov r6, lr, lsr #0x1f
    add r4, r6, r4, asr #0x8
    rsb r4, r4, #0xff
    mul r7, r2, r4
    smull r6, r4, r5, r7
    add r4, r7, r4
    mov r6, r7, lsr #0x1f
    rsb r3, ip, #0xff
    add r4, r6, r4, asr #0x7
    mul r6, r2, r3
    smull r3, r7, r5, r6
    add r7, r6, r7
    mov r3, r6, lsr #0x1f
    cmp r0, #0x5
    add r7, r3, r7, asr #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_254
    b .L_1fc
    b .L_208
    b .L_214
    b .L_224
    b .L_234
    b .L_244
.L_1fc:
    mov r0, r2
    mov r3, r7
    b .L_260
.L_208:
    mov r0, r4
    mov r3, r2
    b .L_260
.L_214:
    mov r0, r1
    mov r3, r2
    mov r1, r7
    b .L_260
.L_224:
    mov r0, r1
    mov r3, r4
    mov r1, r2
    b .L_260
.L_234:
    mov r3, r1
    mov r0, r7
    mov r1, r2
    b .L_260
.L_244:
    mov r3, r1
    mov r0, r2
    mov r1, r4
    b .L_260
.L_254:
    mov r0, #0x0
    mov r3, r0
    mov r1, r0
.L_260:
    cmp r0, #0xff
    movgt r0, #0xff
    cmp r3, #0xff
    movgt r3, #0xff
    cmp r1, #0xff
    mov r2, r0, asr #0x3
    mov r0, r3, lsl #0x2
    movgt r1, #0xff
    mov r3, r1, lsl #0x7
    and r1, r2, #0x1f
    and r0, r0, #0x3e0
    and r2, r3, #0x7c00
    orr r0, r1, r0
    orr r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0xb60b60b7
_LIT1: .word 0x80808081
_LIT2: .word 0x88888889
