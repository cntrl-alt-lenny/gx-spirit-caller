; func_ov002_02232f48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b878
        .extern func_0202e234
        .extern func_ov002_021ca698
        .extern func_ov002_021d8128
        .extern func_ov002_021de8fc
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_02257704
        .global func_ov002_02232f48
        .arm
func_ov002_02232f48:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_35c
    cmp r0, #0x7f
    beq .L_274
    cmp r0, #0x80
    bne .L_360
    bl func_ov002_021e2b3c
    mov r0, r7
    bl func_ov002_02257704
    mov r1, r0
    mov r0, r7
    mov r2, #0x0
    bl func_ov002_021de8fc
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_274:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    bl func_ov002_021ca698
    cmp r0, #0x0
    beq .L_354
    ldrh r1, [r7, #0x2]
    ldr r8, _LIT1
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    and r1, r1, #0x1
    mul r2, r1, r8
    ldr r0, [r0, r2]
    subs r5, r0, #0x1
    bmi .L_354
    ldr r4, _LIT3
    mov r6, r5, lsl #0x2
.L_2c4:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r0, r1, r8, r4
    add r0, r0, r6
    ldr r0, [r0, #0x418]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_348
    mov r0, r9
    bl func_0202b878
    cmp r0, #0x7
    bne .L_348
    ldrh r0, [r7, #0x2]
    ldr r3, _LIT3
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, r5, lsl #0x2
    mov r2, #0x1
    bl func_ov002_021d8128
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_348:
    sub r6, r6, #0x4
    subs r5, r5, #0x1
    bpl .L_2c4
.L_354:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_35c:
    bl func_ov002_021e2c5c
.L_360:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf180
_LIT3: .word data_ov002_022cf16c
