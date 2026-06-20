; func_ov002_02250a28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b8c0
        .extern func_0202b950
        .extern func_0202e234
        .extern func_ov002_021ca5bc
        .extern func_ov002_02253458
        .global func_ov002_02250a28
        .arm
func_ov002_02250a28:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r2
    mov r8, r0
    tst r5, #0x10000000
    ldr r0, _LIT0
    beq .L_26c
    and r2, r8, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    bic r6, r5, #-268435456
    add r7, r0, r1
    add r0, r7, #0x18
    add r5, r0, #0x400
    mov r9, #0xe
.L_218:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202e234
    cmp r0, #0x0
    beq .L_254
    mov r0, sl
    bl func_0202b950
    cmp r0, r6
    bhi .L_254
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253458
.L_254:
    ldr r0, [r7, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_218
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_26c:
    ldr r1, _LIT2
    and r2, r8, #0x1
    mla r0, r2, r0, r1
    add r4, r0, #0x120
    ldr r0, [r4, r5, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8c0
    cmp r0, #0x3
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r1, [r4, r5, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r8
    mov r2, r5
    mov r1, #0xb
    bl func_ov002_02253458
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
