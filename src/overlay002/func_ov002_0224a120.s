; func_ov002_0224a120 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202e234
        .extern func_0203058c
        .extern func_ov002_021ca3f0
        .extern func_ov002_02253458
        .global func_ov002_0224a120
        .arm
func_ov002_0224a120:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    rsb r7, r8, #0x1
    ldr r0, _LIT0
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r2]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r9, #0xe
    add r6, r0, r2
    add r0, r6, #0x18
    add r5, r0, #0x400
.L_1f8:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202e234
    cmp r0, #0x0
    beq .L_258
    mov r0, r8
    mov r1, sl
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    beq .L_258
    mov r0, sl
    bl func_0203058c
    cmp r0, #0x0
    beq .L_248
    ldr r0, [r5]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    beq .L_258
.L_248:
    mov r0, r7
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253458
.L_258:
    ldr r0, [r6, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_1f8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
